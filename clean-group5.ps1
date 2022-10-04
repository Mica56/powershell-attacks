# T1027
Remove-ItemProperty -Force -ErrorAction Ignore -Path HKCU:Software\Microsoft\Windows\CurrentVersion -Name Debug
cmd.exe /c "taskkill /f /im calculator.exe >nul 2>nul"

# 1056.001
Remove-Item $env:TEMP\key.log -ErrorAction Ignore
Remove-Item $env:TEMP\Get-Keystrokes.ps1 -ErrorAction Ignore