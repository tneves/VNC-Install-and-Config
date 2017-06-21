cd /d %~dp0

REM ECHO %CD%
REM PAUSE

powershell.exe Set-ExecutionPolicy Unrestricted -Force
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '.\AutoInstall.ps1'"
powershell.exe Set-ExecutionPolicy Restricted -Force

REM runas /user:Suporte powershell.exe Set-ExecutionPolicy Unrestricted -Force
REM powershell.exe Start-Process powershell -Verb runAs .\AutoInstall.ps1
REM PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""%~dpn0.ps1""' -Verb RunAs}"
