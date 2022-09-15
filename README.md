# powershell-attacks
### To download using powershell:
- Run windows powershell as an administrator, enter the commands below:
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 
Invoke-WebRequest "Raw-download-link-of-the-file" -OutFile "Destination-Path-of-the-File"
```
Source: [Atomic Red Team](https://github.com/redcanaryco/atomic-red-team)
## Red Team Study Guides
- [Red Teaming/Adversary Simulation Toolkit](https://renatoborbolla.medium.com/red-teaming-adversary-simulation-toolkit-da89b20cb5ea)
- [cybersec-related pdfs](https://github.com/jivoi/offsec_pdfs)
- [MITRE ATT&CK - Adversaries knowledge library](https://attack.mitre.org/)
- [VirusTotal - lookup and share suspiscious stuff](https://www.virustotal.com/)
- [Nishang – PowerShell for penetration testing](https://github.com/samratashok/nishang)
