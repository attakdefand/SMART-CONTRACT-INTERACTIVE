# Git Automation Scripts

This project includes automation scripts to simplify Git operations.

## Autopush Scripts

### Windows Batch Version (`git-autopush.bat`)
- Adds all changes
- Commits with timestamp
- Pushes to GitHub main branch

**Usage:**
Double-click `git-autopush.bat` or run from command line:
```
git-autopush.bat
```

### PowerShell Version (`git-autopush.ps1`)
- Same functionality as batch version but with better output formatting

**Usage:**
```powershell
.\git-autopush.ps1
```

## Auto Pull Scripts

### Windows Batch Version (`auto-pull.bat`)
- Automatically pulls from GitHub every 20 minutes
- Runs continuously until manually stopped

**Usage:**
Double-click `auto-pull.bat` or run from command line:
```
auto-pull.bat
```

### PowerShell Version (`auto-pull.ps1`)
- Same functionality as batch version but with better output formatting

**Usage:**
```powershell
.\auto-pull.ps1
```

## Notes
- All scripts assume you're working with the `main` branch
- Make sure you have internet connectivity for push/pull operations
- The auto-pull script will run indefinitely until manually stopped (Ctrl+C)