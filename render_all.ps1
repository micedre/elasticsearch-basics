# PowerShell script to render both language versions

Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  Rendering Multilingual Quarto Website    ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

Write-Host "📝 Rendering French version..." -ForegroundColor Yellow
quarto render --profile french

Write-Host ""
Write-Host "📝 Rendering English version..." -ForegroundColor Yellow
quarto render --profile english --no-clean

Write-Host ""
Write-Host "✅ Both versions rendered successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Output directories:" -ForegroundColor Cyan
Write-Host "  - French:  _site/fr/"
Write-Host "  - English: _site/en/"
