function New-Guid {
    return [GUID]::NewGUID()
}

function Test-Unit {
    foreach ($format in "N", "D", "B", "P") {
        "GUID with $format : {0}" -F (New-Guid).ToString($format)
    }
    'Press Any Key To Exit.'; [Console]::Readkey() | Out-Null; exit
}

Test-Unit
