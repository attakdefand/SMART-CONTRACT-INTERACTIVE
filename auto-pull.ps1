Write-Host "[Auto Pull] Starting automatic pull service..." -ForegroundColor Green

while ($true) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "[Auto Pull] Checking for updates at $timestamp..." -ForegroundColor Yellow
    
    git pull origin main
    
    Write-Host "[Auto Pull] Pull completed. Waiting 20 minutes for next check..." -ForegroundColor Cyan
    Start-Sleep -Seconds 1200  # 20 minutes = 1200 seconds
}