[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "     INTEGRAÇÃO SUPERPOWERS FRAMEWORK (obra/superpowers)" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
$repoDest = "$PSScriptRoot\repos\superpowers"
if (!(Test-Path "$PSScriptRoot\repos")) { New-Item -ItemType Directory -Path "$PSScriptRoot\repos" | Out-Null }
if (!(Test-Path $repoDest)) {
    git clone https://github.com/obra/superpowers.git $repoDest
} else {
    Set-Location $repoDest; git pull; Set-Location $PSScriptRoot
}
Write-Host "[SUCESSO] Superpowers Framework integrado com sucesso!" -ForegroundColor Green
Read-Host "
Pressiona Enter para voltar..."
