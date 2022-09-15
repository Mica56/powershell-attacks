$SecPassword = ConvertTo-SecureString "N0virus1" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential("$env:USERNAME", $SecPassword)
Invoke-Command -ComputerName "$env:COMPUTERNAME" -Credential $Cred -ScriptBlock {whoami}