# powershell-attacks
### To download using powershell:
- Run windows powershell as an administrator
'''
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 </br>
Invoke-WebRequest "Raw-download-link-of-the-file" -OutFile "Destination-Path-of-the-File"
'''
