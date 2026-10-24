[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "     INTEGRAÇÃO HERMES AGENT (NousResearch)             " -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
$repoDest = "$PSScriptRoot\repos\hermes-agent"
if (!(Test-Path "$PSScriptRoot\repos")) { New-Item -ItemType Directory -Path "$PSScriptRoot\repos" | Out-Null }
if (!(Test-Path $repoDest)) {
    git clone https://github.com/NousResearch/hermes-agent.git $repoDest
} else {
    Set-Location $repoDest; git pull; Set-Location $PSScriptRoot
}
Write-Host "[SUCESSO] Hermes Agent integrado com sucesso!" -ForegroundColor Green
Read-Host "
Pressiona Enter para voltar..."
