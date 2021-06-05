$Text = '0123-4567-89AB-CDEF'
$Pi = 3.141592653589793238462

function Remove-Tail() {
    Param (
        [Parameter(Mandatory = $true, Position = 1)] [String]$text,
        [Parameter(Mandatory = $true, Position = 2)] [Int]$index
    )
    return $text.Remove($text.Length - $index, $index)
}

function Test-Unit {
    $result = Remove-Tail $Text 12
    [String[]] $tip_list = @() # = , ''
    $tip_list += "[01] {0,-10}{1,-10}{2,-10}{3,-10}{4,-10}" -F '$result', '=', $result, 'length', $result.Length
    $tip_list += "[02] {0:n0} {1:n} {2:n5}" -F $Pi, $Pi, $Pi
    $tip_list += "[03] {0:p0} {1:p} {2:p4}" -F 0.123, 2, 0.7654321
    if (('Good Idea'.Contains('Idea')) -and ($Text -like '*67*')) {
        $tip_list += "[04] You never see.".Replace('never', 'will')
    }
    if ((('Caps'.CompareTo('Caps')) -eq 0) -and (('Caps'.CompareTo('caps')) -eq 1) -and (('Caps'.CompareTo('X')) -eq -1)) {
        $tip_list += "[05] CompareTo: 0=Same -1=Mismatch".Insert(19, '1=Like ')
    }
    $tip_list += "[06] {0}//{1}" -F 'https://www.google.com'.Split('/', [StringSplitOptions]::RemoveEmptyEntries)
    $tips = $tip_list -join ("`n")
    Write-Host '$tips'
    Write-Host "$tips"
    'Press Any Key To Exit.'; [Console]::Readkey() | Out-Null; exit

}

Test-Unit
