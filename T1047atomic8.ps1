$Class = New-Object Management.ManagementClass(New-Object Management.ManagementPath("Win32_Process"))
$NewClass = $Class.Derive("Win32_Atomic")
$NewClass.Put()
Invoke-WmiMethod -Path Win32_Atomic -Name create -ArgumentList notepad.exe