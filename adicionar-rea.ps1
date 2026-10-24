[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "     INTEGRAÇÃO REA FRAMEWORK (morluto/rea)            " -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
$repoDest = "$PSScriptRoot\repos\rea"
if (!(Test-Path "$PSScriptRoot\repos")) { New-Item -ItemType Directory -Path "$PSScriptRoot\repos" | Out-Null }
if (!(Test-Path $repoDest)) {
    git clone https://github.com/morluto/rea.git $repoDest
} else {
    Set-Location $repoDest; git pull; Set-Location $PSScriptRoot
}
Write-Host "[SUCESSO] REA Framework integrado com sucesso!" -ForegroundColor Green
Read-Host "
Pressiona Enter para voltar..."
