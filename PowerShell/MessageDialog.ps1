Add-Type -AssemblyName System.Windows.Forms
function Get-MsgBox {
    param (
        [String]$Prompt = "Default Content",
        [System.Windows.Forms.MessageBoxButtons]$Buttons = [System.Windows.Forms.MessageBoxButtons]::OK,
        [String]$Title = "Default Title",
        [System.Windows.Forms.MessageBoxIcon]$Icon = [System.Windows.Forms.MessageBoxIcon]::None
    )
    return [System.Windows.Forms.MessageBox]::Show($Prompt, $Title, $Buttons, $Icon)
}

function Test-Unit {
    $confirm = Get-MsgBox -Title "Custom Title" -Prompt "Custom Content" -Buttons YesNoCancel -Icon Question
    if ($confirm -eq 'Yes') {
        Write-Host "chosen Yes"
    }
    elseif ($confirm -eq 'No') {
        Write-Host "chosen No"
    }
    elseif ($confirm -eq 'Cancel') {
        Write-Host "chosen Cancel"
    }
    'Press Any Key To Exit.'; [Console]::Readkey() | Out-Null; exit
}

Test-Unit
