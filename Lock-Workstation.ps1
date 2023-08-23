﻿$winApi = Add-Type -Name WinAPI -Namespace Extern -PassThru -MemberDefinition @"
[DllImport("user32.dll")]
public static extern void LockWorkStation();
"@
$winApi::LockWorkStation()