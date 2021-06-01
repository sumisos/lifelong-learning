#=================================================
# @func Write-Breakpoint
# @param {Object} $Target
# @desc Print debug
#=================================================
function Write-Breakpoint {
  [CmdletBinding()] param (
    [Parameter(Mandatory = $true)] $Breakpoint,
    [Parameter(Mandatory = $false)] [Switch]$Pause
  )
  $DebugTips = "[{0}]`n{1}" -F $Breakpoint.GetType(), $Breakpoint
  Write-Host $DebugTips
  if ($Pause) { 'Press Any Key To Exit.'; [Console]::Readkey() | Out-Null }
  exit
}

function Test-Unit {
  do {
    $current = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Write-Host $current
    Start-Sleep 0.5
    Write-Breakpoint $current -Pause
  } while ($true)
}

Test-Unit
