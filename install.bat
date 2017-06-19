runas /user:Suporte powershell.exe Set-ExecutionPolicy Unrestricted -Force
powershell.exe Start-Process powershell -Verb runAs .\AutoInstall.ps1
PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""%~dpn0.ps1""' -Verb RunAs}"
