﻿cmd /c start /b psr.exe /start /output c:\temp\T1113_desktop.zip /sc 1 /gui 0 /stopevent 12
Add-Type -MemberDefinition '[DllImport("user32.dll")] public static extern void mouse_event(int flags, int dx, int dy, int cButtons, int info);' -Name U32 -Namespace W;
[W.U32]::mouse_event(0x02 -bor 0x04 -bor 0x01, 0, 0, 0, 0);
cmd /c "timeout 5 > NULL && psr.exe /stop"

