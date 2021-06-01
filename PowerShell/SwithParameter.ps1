function Test-Ping {
    param (
        [Parameter(Mandatory = $false)] [Switch]$t
    )
    if ($t) {
        Write-Host 'with -t: Always Ping'
    }
    else {
        Write-Host 'without -t: Only 4 Times'
    }
}

function Test-Unit {
    Test-Ping -t
    Test-Ping
    'Press Any Key To Exit.'; [Console]::Readkey() | Out-Null; exit
}

Test-Unit
