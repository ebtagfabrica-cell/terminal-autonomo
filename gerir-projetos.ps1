[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
function Menu {
    Clear-Host
    Write-Host "========================================================" -ForegroundColor Cyan
    Write-Host "     TERMINAL AUTONOMO DE AGENTES - PAINEL MASTER       " -ForegroundColor Cyan
    Write-Host "========================================================" -ForegroundColor Cyan
    Write-Host " [1] Listar Projetos Registados" -ForegroundColor White
    Write-Host " [2] Indexar Novos Projetos (repos)" -ForegroundColor White
    Write-Host " [3] Verificar Hardware Local" -ForegroundColor White
    Write-Host " [6] Entender Projeto (OpenViking / Understand Anything)" -ForegroundColor White
    Write-Host " [10] Integrar REA Framework (morluto/rea)" -ForegroundColor Green
    Write-Host " [11] Copiloto Git (Commit e Push)" -ForegroundColor Cyan
    Write-Host " [12] Executar Backup para Terabox (1TB)" -ForegroundColor Yellow
    Write-Host " [13] Integrar Superpowers Framework (obra/superpowers)" -ForegroundColor Green
    Write-Host " [14] Integrar Hermes Agent (NousResearch/hermes-agent)" -ForegroundColor Cyan
    Write-Host " [15] Integrar Perplexity MCP (Pesquisa Web Real-time)" -ForegroundColor Yellow
    Write-Host " [16] Verificar Headroom do Sistema (Margens)" -ForegroundColor Green
    Write-Host " [17] Ativar Strix Shield (Blindagem de Rede)" -ForegroundColor Cyan
    Write-Host " [18] Graphify Terminal (Visualizacao Grafica)" -ForegroundColor Yellow
    Write-Host " [19] Integrar Kaparty Skills" -ForegroundColor Green
    Write-Host " [0] Sair" -ForegroundColor Red
    Write-Host "========================================================" -ForegroundColor Cyan
}

do {
    Menu
    $op = Read-Host "Seleciona uma opcao"
    switch ($op) {
        "1" { if (Test-Path "$PSScriptRoot\projetos.json") { Get-Content "$PSScriptRoot\projetos.json" } else { Write-Host "Sem projetos." -ForegroundColor Yellow }; Pause }
        "2" { & "$PSScriptRoot\indexar-projetos.ps1"; Pause }
        "3" { & "$PSScriptRoot\verificar-hardware.ps1"; Pause }
        "6" { & "$PSScriptRoot\entender-projeto.ps1" }
        "10" { & "$PSScriptRoot\adicionar-rea.ps1" }
        "11" { & "$PSScriptRoot\git-autocopilot.ps1" }
        "12" { & "$PSScriptRoot\backup-terabox.ps1" }
        "13" { & "$PSScriptRoot\adicionar-superpowers.ps1" }
        "14" { & "$PSScriptRoot\adicionar-hermes.ps1" }
        "15" { & "$PSScriptRoot\adicionar-perplexity-mcp.ps1" }
        "16" { & "$PSScriptRoot\headroom-manager.ps1" }
        "17" { & "$PSScriptRoot\strix-shield.ps1" }
        "18" { & "$PSScriptRoot\graphify-engine.ps1" }
        "19" { & "$PSScriptRoot\adicionar-kaparty.ps1" }
        "0" { Write-Host "A sair..." -ForegroundColor Cyan; break }
        default { Write-Host "Opcao invalida!" -ForegroundColor Red; Start-Sleep -Seconds 1 }
    }
} while ($op -ne "0")
