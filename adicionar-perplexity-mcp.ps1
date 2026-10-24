[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "     INTEGRAÇÃO PERPLEXITY MCP (WEB SEARCH)             " -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
$mcpDir = "$PSScriptRoot\mcp"
if (!(Test-Path $mcpDir)) { New-Item -ItemType Directory -Path $mcpDir | Out-Null }
$config = @{ mcpServers = @{ perplexity = @{ command = "npx"; args = @("-y", "@modelcontextprotocol/server-perplexity") } } } | ConvertTo-Json -Depth 5
Set-Content -Path "$mcpDir\perplexity-mcp-config.json" -Value $config -Encoding UTF8
Write-Host "[SUCESSO] Perplexity MCP configurado em $mcpDir" -ForegroundColor Green
Read-Host "
Pressiona Enter para voltar..."
