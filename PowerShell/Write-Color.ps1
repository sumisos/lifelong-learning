function Write-Color {
    foreach ($c in "Black" , "DarkBlue" , "DarkGreen", "DarkCyan" , "DarkRed", "DarkMagenta" , "DarkYellow" , "Gray" , "DarkGray" , "Blue" , "Green" , "Cyan" , "Red" , "Magenta" , "Yellow" , "White") {
        Write-Host $c -ForegroundColor $c
    }
}

Write-Color
