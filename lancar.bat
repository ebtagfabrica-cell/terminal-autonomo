@echo off
chcp 65001 >nul
title Terminal Autónomo de Agentes
cd /d C:\TerminalAutonomo
powershell -ExecutionPolicy Bypass -File .\iniciar-terminal.ps1
pause
