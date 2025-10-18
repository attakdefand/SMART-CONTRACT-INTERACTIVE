# PowerShell script to verify the project structure
Write-Host "Verifying Smart Contract Interaction Tests Catalog structure..." -ForegroundColor Green

# Check main directories
$mainDirs = @("src", "docs")
foreach ($dir in $mainDirs) {
    if (Test-Path $dir) {
        Write-Host "✓ Found directory: $dir" -ForegroundColor Green
    } else {
        Write-Host "✗ Missing directory: $dir" -ForegroundColor Red
    }
}

# Check documentation files
$docFiles = @("README.md", "USAGE.md", "PROJECT_SUMMARY.md", "COMPLETION_NOTICE.md")
foreach ($file in $docFiles) {
    if (Test-Path $file) {
        Write-Host "✓ Found file: $file" -ForegroundColor Green
    } else {
        Write-Host "✗ Missing file: $file" -ForegroundColor Red
    }
}

# Check docs subdirectory files
$docsFiles = @("docs/categories.md", "docs/test-template.md")
foreach ($file in $docsFiles) {
    if (Test-Path $file) {
        Write-Host "✓ Found file: $file" -ForegroundColor Green
    } else {
        Write-Host "✗ Missing file: $file" -ForegroundColor Red
    }
}

# Count category directories
$categoryCount = (Get-ChildItem -Path "src" -Directory).Count
Write-Host "✓ Found $categoryCount category directories" -ForegroundColor Green

# Count sub-type directories
$subTypeCount = (Get-ChildItem -Path "src\*" -Directory -Recurse).Count
Write-Host "✓ Found $subTypeCount sub-type directories" -ForegroundColor Green

# Count test files
$testFileCount = (Get-ChildItem -Path "src\*\*" -Filter "*.md" -Recurse).Count
Write-Host "✓ Found $testFileCount test files" -ForegroundColor Green

# Verify CSV file exists
if (Test-Path "Smart-Contract_Interaction__146_Tests_Catalog.csv") {
    Write-Host "✓ Found catalog CSV file" -ForegroundColor Green
} else {
    Write-Host "✗ Missing catalog CSV file" -ForegroundColor Red
}

Write-Host "`nVerification complete!" -ForegroundColor Green
if ($categoryCount -eq 21 -and $subTypeCount -eq 146 -and $testFileCount -ge 146) {
    Write-Host "✓ Project structure is complete and correct!" -ForegroundColor Green
} else {
    Write-Host "⚠ Some components may be missing or incorrect" -ForegroundColor Yellow
}