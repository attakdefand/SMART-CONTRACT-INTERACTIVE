# GitHub Pages Setup Script
Write-Host "GitHub Pages Setup for SMART-CONTRACT-INTERACTIVE" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green
Write-Host ""

# Check if we're in the right directory
if (-not (Test-Path "index.html")) {
    Write-Host "Error: index.html not found in current directory." -ForegroundColor Red
    Write-Host "Please run this script from the repository root directory." -ForegroundColor Yellow
    exit 1
}

Write-Host "✓ Repository files verified" -ForegroundColor Green

# Check if we're in a git repository
try {
    $gitStatus = git status
    Write-Host "✓ Git repository detected" -ForegroundColor Green
} catch {
    Write-Host "Error: Not a git repository or git not installed." -ForegroundColor Red
    exit 1
}

# Check current branch
$branch = git branch --show-current
Write-Host "✓ Current branch: $branch" -ForegroundColor Green

# Check if we're up to date with remote
try {
    git fetch origin
    $localCommit = git rev-parse HEAD
    $remoteCommit = git rev-parse origin/$branch
    
    if ($localCommit -ne $remoteCommit) {
        Write-Host "Warning: Local repository is not up to date with remote." -ForegroundColor Yellow
        Write-Host "Consider running 'git push origin $branch' before setting up GitHub Pages." -ForegroundColor Yellow
    } else {
        Write-Host "✓ Repository is up to date with remote" -ForegroundColor Green
    }
} catch {
    Write-Host "Warning: Could not verify remote repository status." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "To enable GitHub Pages, follow these steps:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Go to your repository on GitHub:" -ForegroundColor White
Write-Host "   https://github.com/attakdefand/SMART-CONTRACT-INTERACTIVE" -ForegroundColor Blue
Write-Host ""
Write-Host "2. Click on the 'Settings' tab" -ForegroundColor White
Write-Host ""
Write-Host "3. In the left sidebar, scroll down and click on 'Pages'" -ForegroundColor White
Write-Host ""
Write-Host "4. In the 'Source' section:" -ForegroundColor White
Write-Host "   - Select 'Deploy from a branch'" -ForegroundColor White
Write-Host "   - Under 'Branch', select '$branch'" -ForegroundColor White
Write-Host "   - Leave the folder as '/ (root)'" -ForegroundColor White
Write-Host "   - Click 'Save'" -ForegroundColor White
Write-Host ""
Write-Host "5. Wait a few minutes for GitHub to build and deploy your site" -ForegroundColor White
Write-Host ""
Write-Host "Your site will be available at:" -ForegroundColor Green
Write-Host "https://attakdefand.github.io/SMART-CONTRACT-INTERACTIVE/" -ForegroundColor Blue
Write-Host ""
Write-Host "Press any key to continue..." -ForegroundColor Gray
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")