# Writes text to a file and display the results. 
# This test is intended to emulate the dropping of a malicious file to disk.
cmd.exe /c "echo `"Injection success.`" > `"%TEMP%\test.bin`" & type `"%TEMP%\test.bin`""