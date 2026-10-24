[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "=== HEADROOM MANAGER ===" -ForegroundColor Cyan
$os = Get-CimInstance Win32_OperatingSystem
Write-Host "RAM Livre: ([math]::Round($os.FreePhysicalMemory / 1MB, 2)) GB" -ForegroundColor White
Read-Host "Pressiona Enter para voltar..."
