[System.Environment]::UserName | Out-File -FilePath .\CurrentactiveUser.txt 
$env:UserName | Out-File -FilePath .\CurrentactiveUser.txt -Append