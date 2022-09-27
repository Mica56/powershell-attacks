# Query Windows Registry. Upon successful execution, cmd.exe will perform multiple reg queries. 
# Some will succeed and others will fail (dependent upon OS)

cmd.exe /c "reg query `"HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows`""
cmd.exe /c  "reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce"
cmd.exe /c  "reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce"
cmd.exe /c  "reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices"
cmd.exe /c  "reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunServices"
cmd.exe /c  "reg query `"HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Notify`""
cmd.exe /c "reg query `"HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit`""
cmd.exe /c "reg query `"HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\\Shell`""
cmd.exe /c  "reg query `"HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\\Shell`""
cmd.exe /c  "reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ShellServiceObjectDelayLoad"
cmd.exe /c "reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce"
cmd.exe /c  "reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnceEx"
cmd.exe /c "reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run"
cmd.exe /c  "reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run"
cmd.exe /c "reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce"
cmd.exe /c  "reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run"
cmd.exe /c  "reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run"
cmd.exe /c  "reg query HKLM\system\currentcontrolset\services /s | findstr ImagePath 2>nul | findstr /Ri `".*\.sys$`""
cmd.exe /c  "reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run"

# enumerate the COM objects listed in HKCR, then output their methods and CLSIDs to a text file
New-PSDrive -PSProvider registry -Root HKEY_CLASSES_ROOT -Name HKCR
Get-ChildItem -Path HKCR:\CLSID -Name | Select -Skip 1 > $env:temp\clsids.txt
ForEach($CLSID in Get-Content "$env:temp\clsids.txt")
{try{write-output "$($Position)-$($CLSID)"
write-output "------------"| out-file $env:temp\T1592.002Test1.txt -append
write-output $($CLSID)| out-file $env:temp\T1592.002Test1.txt -append
$handle=[activator]::CreateInstance([type]::GetTypeFromCLSID($CLSID))
$handle | get-member -erroraction silentlycontinue | out-file $env:temp\T1592.002Test1.txt -append
$position += 1} catch{}}