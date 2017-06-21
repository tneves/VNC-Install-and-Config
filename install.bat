cd /d %~dp0
powershell.exe Set-ExecutionPolicy Unrestricted -Force
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '.\AutoInstall.ps1'"
powershell.exe Set-ExecutionPolicy Restricted -Force
