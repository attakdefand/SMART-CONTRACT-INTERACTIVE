Write-Host "[Git AutoPush] Starting automatic push to GitHub..." -ForegroundColor Green
Write-Host "[Git AutoPush] Adding all changes..." -ForegroundColor Yellow
git add .

Write-Host "[Git AutoPush] Committing changes..." -ForegroundColor Yellow
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Auto commit - $timestamp"

Write-Host "[Git AutoPush] Pushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "[Git AutoPush] Push completed successfully!" -ForegroundColor Green