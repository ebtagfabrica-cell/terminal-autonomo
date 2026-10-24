[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor
$total = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$livre = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
$p = @{ CPU = $cpu.Name; RAM_Total = $total; RAM_Livre = $livre; Data = (Get-Date).ToString() }
$p | ConvertTo-Json | Set-Content -Path "$PSScriptRoot\hardware-profile.json" -Encoding UTF8
Write-Host "[HARDWARE] Perfil verificado com sucesso." -ForegroundColor Green
