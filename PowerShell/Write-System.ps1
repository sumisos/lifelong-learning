function Write-System {
    $OSVersion = (wmic os get caption)[2].Trim()
    $OSBits = if ([Environment]::Is64BitOperatingSystem) { '64' } else { '32' }
    $Tips = "Current System is [{0} x{1}]" -F $OSVersion, $OSBits
    Write-Host $Tips
    'Press Any Key To Exit.'; [Console]::Readkey() | Out-Null; exit
}

Write-System
