[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "=== TERABOX BACKUP (1TB) ===" -ForegroundColor Cyan
$dest = "C:\TeraboxBackup"
if (!(Test-Path $dest)) { New-Item -ItemType Directory -Path $dest | Out-Null }
Compress-Archive -Path "C:\TerminalAutonomo\*" -DestinationPath "$dest\Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').zip" -Force
Write-Host "[SUCESSO] Backup efetuado para Terabox." -ForegroundColor Green
Read-Host "Pressiona Enter para voltar..."
