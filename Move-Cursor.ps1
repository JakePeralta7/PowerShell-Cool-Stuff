Add-Type @"
using System.Runtime.InteropServices;
public class GetCursor {
    [StructLayout(LayoutKind.Sequential)]
    public struct POINT
    {
        public int x;
        public int y;
    }
    [DllImport("user32.dll")]
    public static extern bool GetCursorPos(out POINT lpPoint);
}
"@

# Get the current cursor position
$cursorPos = New-Object GetCursor+POINT
[GetCursor]::GetCursorPos([ref]$cursorPos) | Out-Null
Write-Host "The cursor is at ($($cursorPos.x), $($cursorPos.y))"

Add-Type @"
using System.Runtime.InteropServices;
public class SetCursor {
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int X, int Y);
}
"@

# Set the cursor position to specified position (x, y)
while ($true) {
    [SetCursor]::SetCursorPos($cursorPos.x + 300, $cursorPos.y) | Out-Null
    Start-Sleep -Milliseconds 200
    [SetCursor]::SetCursorPos($cursorPos.x + 300, $cursorPos.y + 300) | Out-Null
    Start-Sleep -Milliseconds 200
    [SetCursor]::SetCursorPos($cursorPos.x, $cursorPos.y + 300) | Out-Null
    Start-Sleep -Milliseconds 200
    [SetCursor]::SetCursorPos($cursorPos.x, $cursorPos.y) | Out-Null
    Start-Sleep -Milliseconds 200
}