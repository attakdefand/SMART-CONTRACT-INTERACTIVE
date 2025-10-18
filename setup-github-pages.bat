@echo off
title GitHub Pages Setup for SMART-CONTRACT-INTERACTIVE

echo ==================================================
echo GitHub Pages Setup for SMART-CONTRACT-INTERACTIVE
echo ==================================================
echo.

REM Check if we're in the right directory
if not exist index.html (
    echo Error: index.html not found in current directory.
    echo Please run this script from the repository root directory.
    pause
    exit /b 1
)

echo ✓ Repository files verified

REM Check current branch
for /f "tokens=*" %%i in ('git branch --show-current') do set branch=%%i
echo ✓ Current branch: %branch%

echo.
echo To enable GitHub Pages, follow these steps:
echo.
echo 1. Go to your repository on GitHub:
echo    https://github.com/attakdefand/SMART-CONTRACT-INTERACTIVE
echo.
echo 2. Click on the "Settings" tab
echo.
echo 3. In the left sidebar, scroll down and click on "Pages"
echo.
echo 4. In the "Source" section:
echo    - Select "Deploy from a branch"
echo    - Under "Branch", select "%branch%"
echo    - Leave the folder as "/ (root)"
echo    - Click "Save"
echo.
echo 5. Wait a few minutes for GitHub to build and deploy your site
echo.
echo Your site will be available at:
echo https://attakdefand.github.io/SMART-CONTRACT-INTERACTIVE/
echo.
pause