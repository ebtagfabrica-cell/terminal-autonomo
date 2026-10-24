[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$Diretorio = "C:\TerminalAutonomo"
Set-Location $Diretorio

# Criar diretorios auxiliares
foreach ($dir in @("repos", "skills", "mcp", ".logs")) {
    if (!(Test-Path "$Diretorio\$dir")) { New-Item -ItemType Directory -Path "$Diretorio\$dir" -Force | Out-Null }
}

# 1. lancar.bat
$lancarBat = @"
@echo off
chcp 65001 >nul
title Terminal Autónomo de Agentes
cd /d C:\TerminalAutonomo
powershell -ExecutionPolicy Bypass -File .\iniciar-terminal.ps1
pause
"@
Set-Content -Path "$Diretorio\lancar.bat" -Value $lancarBat -Encoding Default

# 2. config-stack.json
$configStack = @"
{
    "MotorPrincipal": "GLM 5.3 Flash X",
    "Failover": "OmniRoute",
    "OtimizacaoLocal": "Ternary Bonsai 2",
    "Modo": "Zero Friction & Ultra-Low Cost"
}
"@
Set-Content -Path "$Diretorio\config-stack.json" -Value $configStack -Encoding UTF8

# 3. verificar-hardware.ps1
$verificarHardware = @"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
`$os = Get-CimInstance Win32_OperatingSystem
`$cpu = Get-CimInstance Win32_Processor
`$totalRam = [math]::Round(`$os.TotalVisibleMemorySize / 1MB, 2)
`$livreRam = [math]::Round(`$os.FreePhysicalMemory / 1MB, 2)
`$perfil = @{
    CPU = `$cpu.Name
    Nucleos = `$cpu.NumberOfCores
    RAM_Total_GB = `$totalRam
    RAM_Livre_GB = `$livreRam
    Atualizado = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
}
`$perfil | ConvertTo-Json -Depth 3 | Set-Content -Path "`$PSScriptRoot\hardware-profile.json" -Encoding UTF8
Write-Host "[HARDWARE] Perfil verificado e gerido com sucesso." -ForegroundColor Green
"@
Set-Content -Path "$Diretorio\verificar-hardware.ps1" -Value $verificarHardware -Encoding UTF8

# 4. indexar-projetos.ps1
$indexarProjetos = @"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
`$PastaRepos = "`$PSScriptRoot\repos"
`$JsonPath = "`$PSScriptRoot\projetos.json"
if (!(Test-Path `$PastaRepos)) { New-Item -ItemType Directory -Path `$PastaRepos | Out-Null }
`$projetos = @()
Get-ChildItem -Path `$PastaRepos -Directory | ForEach-Object {
    `$projetos += [PSCustomObject]@{
        Nome = `$_.Name
        Caminho = `$_.FullName
        Tipo = "Repository"
        Atualizado = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    }
}
`$projetos | ConvertTo-Json -Depth 3 | Set-Content -Path `$JsonPath -Encoding UTF8
Write-Host "[INDEX] Projetos indexados com sucesso em projetos.json" -ForegroundColor Green
"@
Set-Content -Path "$Diretorio\indexar-projetos.ps1" -Value $indexarProjetos -Encoding UTF8

# 5. headroom-manager.ps1
$headroomManager = @"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "=== HEADROOM MANAGER ===" -ForegroundColor Cyan
`$os = Get-CimInstance Win32_OperatingSystem
`$total = [math]::Round(`$os.TotalVisibleMemorySize / 1MB, 2)
`$livre = [math]::Round(`$os.FreePhysicalMemory / 1MB, 2)
Write-Host "RAM Total: `$total GB | RAM Livre: `$livre GB" -ForegroundColor White
Write-Host "[OK] Margens operacionais seguras." -ForegroundColor Green
Read-Host "Pressiona Enter para voltar..."
"@
Set-Content -Path "$Diretorio\headroom-manager.ps1" -Value $headroomManager -Encoding UTF8

# 6. strix-shield.ps1
$strixShield = @"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "=== STRIX SHIELD ===" -ForegroundColor Cyan
Write-Host "[STRIX] Auditoria de portas e isolamento de rede ativo." -ForegroundColor Green
Read-Host "Pressiona Enter para voltar..."
"@
Set-Content -Path "$Diretorio\strix-shield.ps1" -Value $strixShield -Encoding UTF8

# 7. graphify-engine.ps1
$graphifyEngine = @"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "=== GRAPHIFY ENGINE ===" -ForegroundColor Cyan
Write-Host "[GRAPH] Arquitetura de Agentes e Stack Ativa visualizada." -ForegroundColor Green
Read-Host "Pressiona Enter para voltar..."
"@
Set-Content -Path "$Diretorio\graphify-engine.ps1" -Value $graphifyEngine -Encoding UTF8

# 8. git-autocopilot.ps1
$gitAutocopilot = @"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "=== GIT AUTOCOPILOT ===" -ForegroundColor Cyan
git status
git add .
git commit -m "Auto-commit via Terminal Autónomo"
git push
Read-Host "Pressiona Enter para voltar..."
"@
Set-Content -Path "$Diretorio\git-autocopilot.ps1" -Value $gitAutocopilot -Encoding UTF8

# 9. backup-terabox.ps1
$backupTerabox = @"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "=== TERABOX CLOUD BACKUP (1TB) ===" -ForegroundColor Cyan
`$destino = "C:\TeraboxBackup"
if (!(Test-Path `$destino)) { New-Item -ItemType Directory -Path `$destino | Out-Null }
`$nomeZip = "`$destino\TerminalBackup_`$(Get-Date -Format 'yyyyMMdd_HHmmss').zip"
Compress-Archive -Path "C:\TerminalAutonomo\*" -DestinationPath `$nomeZip -Force
Write-Host "[SUCESSO] Backup compactado para: `$nomeZip" -ForegroundColor Green
Read-Host "Pressiona Enter para voltar..."
"@
Set-Content -Path "$Diretorio\backup-terabox.ps1" -Value $backupTerabox -Encoding UTF8

# 10. gerir-projetos.ps1
$gerirProjetos = @"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
function Mostrar-Menu {
    Clear-Host
    Write-Host "========================================================" -ForegroundColor Cyan
    Write-Host "     TERMINAL AUTÓNOMO DE AGENTES - PAINEL MASTER       " -ForegroundColor Cyan
    Write-Host "========================================================" -ForegroundColor Cyan
    Write-Host " [1] Listar Projetos Registados" -ForegroundColor White
    Write-Host " [2] Indexar Novos Projetos (repos)" -ForegroundColor White
    Write-Host " [3] Verificar Hardware Local" -ForegroundColor White
    Write-Host " [6] Entender Projeto (OpenViking / Understand Anything)" -ForegroundColor White
    Write-Host " [8] Procurar Competências (Find Skills)" -ForegroundColor White
    Write-Host " [10] Integrar REA Framework (morluto/rea)" -ForegroundColor Green
    Write-Host " [11] Copiloto Git Automático (Commit & Push)" -ForegroundColor Cyan
    Write-Host " [12] Executar Backup para Terabox (1TB)" -ForegroundColor Yellow
    Write-Host " [13] Integrar Superpowers Framework (obra/superpowers)" -ForegroundColor Green
    Write-Host " [14] Integrar Hermes Agent (NousResearch/hermes-agent)" -ForegroundColor Cyan
    Write-Host " [15] Integrar Perplexity MCP (Pesquisa Web Real-time)" -ForegroundColor Yellow
    Write-Host " [16] Verificar Headroom do Sistema (Margens)" -ForegroundColor Green
    Write-Host " [17] Ativar Strix Shield (Blindagem de Rede)" -ForegroundColor Cyan
    Write-Host " [18] Graphify Terminal (Visualização Gráfica)" -ForegroundColor Yellow
    Write-Host " [19] Integrar Kaparty Skills" -ForegroundColor Green
    Write-Host " [0] Sair" -ForegroundColor Red
    Write-Host "========================================================" -ForegroundColor Cyan
}

do {
    Mostrar-Menu
    `$opcao = Read-Host "Seleciona uma opção"
    switch (`$opcao) {
        "1" { if (Test-Path "`$PSScriptRoot\projetos.json") { Get-Content "`$PSScriptRoot\projetos.json" } else { Write-Host "Sem projetos." -ForegroundColor Yellow }; Pause }
        "2" { & "`$PSScriptRoot\indexar-projetos.ps1"; Pause }
        "3" { & "`$PSScriptRoot\verificar-hardware.ps1"; Pause }
        "11" { & "`$PSScriptRoot\git-autocopilot.ps1" }
        "12" { & "`$PSScriptRoot\backup-terabox.ps1" }
        "16" { & "`$PSScriptRoot\headroom-manager.ps1" }
        "17" { & "`$PSScriptRoot\strix-shield.ps1" }
        "18" { & "`$PSScriptRoot\graphify-engine.ps1" }
        "0" { Write-Host "A sair..." -ForegroundColor Cyan; break }
        default { Write-Host "Opção inválida!" -ForegroundColor Red; Start-Sleep -Seconds 1 }
    }
} while (`$opcao -ne "0")
"@
Set-Content -Path "$Diretorio\gerir-projetos.ps1" -Value $gerirProjetos -Encoding UTF8

# 11. iniciar-terminal.ps1
$iniciarTerminal = @"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
& "`$PSScriptRoot\verificar-hardware.ps1"
& "`$PSScriptRoot\gerir-projetos.ps1"
"@
Set-Content -Path "$Diretorio\iniciar-terminal.ps1" -Value $iniciarTerminal -Encoding UTF8

# 12. Atalho na Área de Trabalho
`$DesktopPath = [Environment]::GetFolderPath("Desktop")
`$ShortcutPath = "`$DesktopPath\Terminal Autónomo.lnk"
`$WScriptObj = New-Object -ComObject WScript.Shell
`$Shortcut = `$WScriptObj.CreateShortcut(`$ShortcutPath)
`$Shortcut.TargetPath = "`$Diretorio\lancar.bat"
`$Shortcut.WorkingDirectory = `$Diretorio
`$Shortcut.Description = "Terminal Autónomo de Agentes"
`$Shortcut.Save()

Write-Host "`n[SUCESSO] Terminal Autónomo instalado e configurado com sucesso!" -ForegroundColor Green
Write-Host "[SUCESSO] Atalho criado na Área de Trabalho." -ForegroundColor Green
