# Habilitando a execução de scripts
# Set-ExecutionPolicy Unrestricted -Force

# Desabilitar o Firewall
# netsh advfirewall set allprofiles state off

# Remover o serviÃ§o existente do VNC
$service=Get-WmiObject -Class Win32_Service -Filter "Name LIKE '%vnc%'"
Stop-Service $service.Name
$service.delete()

# Desinstalar VNC existente
$app = Get-WmiObject -Class Win32_Product -Filter "Name LIKE '%vnc%'"
if($app -ne $null){
    $app.Uninstall()
}

# Remover diretï¿½rios do VNC existentes
$directories = Get-ChildItem -Path 'C:\Program Files'
foreach ($directory in $directories) { 
    if ($directory.Name | Select-String -Pattern "vnc") {
        $vncdir = 'C:\Program Files' + '\' + $directory.Name
        Remove-Item -Recurse -Force $vncdir
    }
}

$directories = Get-ChildItem -Path 'C:\Program Files (x86)'
foreach ($directory in $directories) { 
    if ($directory.Name | Select-String -Pattern "vnc") {
        $vncdir = 'C:\Program Files (x86)' + '\' + $directory.Name
        Remove-Item -Recurse -Force $vncdir
    }
}

# Instala o VNC
.\UltraVNC_1_2_11_X64_Setup.exe /silent /loadinf=".\InstallConfig" | Out-Null

# Configura o VNC
Copy-Item -Force .\ultravnc.ini 'C:\Program Files\UltraVNC\'
