# Git Command Shortcuts

This project includes custom Git commands to simplify common operations.

## Available Commands

### `git autopush`
Automatically adds all changes, commits them with a timestamp, and pushes to the GitHub repository.

**Usage:**
```bash
git autopush
```

This command will:
1. Add all changes in the repository
2. Commit with a timestamp message
3. Push to the main branch on GitHub

### `git-autopull.bat`
A background service that automatically pulls updates from GitHub every 20 minutes.

**Usage:**
```bash
git-autopull.bat
```

To stop the service, press `Ctrl+C`.

## Setup

These commands have been automatically set up for you. They work from any directory because the scripts have been added to your system PATH.

## Notes

- All commands operate on the `d:\INTERACTIVE-SMART-CONTRACT` directory
- The `git autopush` command uses the main branch
- The auto-pull service runs continuously until manually stopped
- Both commands provide clear feedback about their operations