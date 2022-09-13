.  C:\temp\Start-Hollow.ps1
$ppid=Get-Process explorer | select -expand id
Start-Hollow -Sponsor "C:\Windows\System32\notepad.exe" -Hollow "C:\Windows\System32\cmd.exe" -ParentPID $ppid -Verbose

