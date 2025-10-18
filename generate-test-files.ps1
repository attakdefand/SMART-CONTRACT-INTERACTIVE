# PowerShell script to generate test files from the CSV catalog
# This script reads the Smart-Contract_Interaction__146_Tests_Catalog.csv file
# and generates markdown files for each test case

# Import the CSV file
$csvPath = "Smart-Contract_Interaction__146_Tests_Catalog.csv"
$tests = Import-Csv -Path $csvPath

# Function to sanitize folder/file names by replacing invalid characters
function Sanitize-Name($name) {
    $invalidChars = [IO.Path]::GetInvalidFileNameChars() -join ''
    $regexp = "[{0}]" -f [RegEx]::Escape($invalidChars)
    return ($name -replace $regexp) -replace '[^\w\s-]', '' -replace '\s+', '-'
}

# Counter for tracking progress
$totalTests = $tests.Count
$currentTest = 0

# Process each test case
foreach ($test in $tests) {
    $currentTest++
    Write-Progress -Activity "Generating test files" -Status "Processing test $currentTest of $totalTests" -PercentComplete (($currentTest / $totalTests) * 100)
    
    # Sanitize category and sub-type names for folder creation
    $category = Sanitize-Name($test.Category)
    $subType = Sanitize-Name($test.'Sub-Type')
    $testName = Sanitize-Name($test.'Test Name')
    
    # Create directory path
    $dirPath = "src\$category\$subType"
    
    # Ensure directory exists
    if (!(Test-Path $dirPath)) {
        New-Item -ItemType Directory -Path $dirPath | Out-Null
    }
    
    # Create file path
    $filePath = "$dirPath\$testName.md"
    
    # Create content for the test file
    $content = @"
# $($test.'Test Name')

## Category
$($test.Category)

## Sub-Type
$($test.'Sub-Type')

## Interaction
$($test.Interaction)

## What to Do
$($test.'What to Do')

## Key Assertions
$($test.'Key Assertions')

## Suggested Tools
$($test.'Suggested Tools')

## Notes
$($test.Notes)
"@
    
    # Write content to file
    Set-Content -Path $filePath -Value $content
    
    # Output progress
    Write-Host "Created: $filePath"
}

Write-Host "Successfully generated $totalTests test files!"