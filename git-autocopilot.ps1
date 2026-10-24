[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "=== GIT AUTOCOPILOT ===" -ForegroundColor Cyan
git status; git add .; git commit -m "Auto-commit"; git push
Read-Host "Pressiona Enter para voltar..."
