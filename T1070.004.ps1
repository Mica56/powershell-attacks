# Delete a single file from the temporary directory using Powershell. 
# Upon execution, no output will be displayed. Use File Explorer to verify the file was deleted.
Remove-Item -path $env:TEMP\deleteme_T1551.004

# This test just places the files in a non-TeamViewer folder, a detection would just check for a deletion event matching the TeamViewer log file format of TeamViewer_##.log. 
# Upon execution, no output will be displayed. Use File Explorer to verify the folder was deleted.
New-Item -Path $env:TEMP\TeamViewer_54.log -Force | Out-Null
Remove-Item $env:TEMP\TeamViewer_54.log -Force -ErrorAction Ignore