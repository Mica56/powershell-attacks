Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine

New-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name LocalAccountTokenFilterPolicy -PropertyType DWord -Value 1 -Force
New-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableLinkedConnections -PropertyType DWord -Value 1 -Force
New-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name LongPathsEnabled -PropertyType DWord -Value 1 -Force