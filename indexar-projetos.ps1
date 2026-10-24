[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$repos = "$PSScriptRoot\repos"
if (!(Test-Path $repos)) { New-Item -ItemType Directory -Path $repos | Out-Null }
$proj = @()
Get-ChildItem -Path $repos -Directory | ForEach-Object { $proj += [PSCustomObject]@{ Nome = $_.Name; Caminho = $_.FullName } }
$proj | ConvertTo-Json | Set-Content -Path "$PSScriptRoot\projetos.json" -Encoding UTF8
Write-Host "[INDEX] Projetos indexados." -ForegroundColor Green
