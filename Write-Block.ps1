Function Write-Block {
    [CmdletBinding()]
    param(
        [Parameter(
            Position=0,
            Mandatory=$true,
            ValueFromPipeline=$true
        )]
        [string[]] $msg,

        [ValidateRange(40,200)]
        [int] $width = 80,

        [Parameter(
            Mandatory=$false
        )]
        [ValidateLength(1,1)]
        [string] $char = "*"
    )

    Begin {
        $lineBreak = "{0}" -f  $char * $width
        
        $hollowBreak = $lineBreak

        # $paddedWidth = $width - ($char.Length * 2 + 2) # 2 spaces are the "padding"
        $paddedWidth = $width - 4 # 2 spaces are the "padding"
        $final = ""

        Write-Host $lineBreak
    }

    Process {
        $msgCount = 0
        foreach($m in $msg) {
            $text = ""
            $spaces = ""
            $lines = [math]::floor($m.Length / $width)
            $linesCount, $charCount = 0, 0
            $words = $m.split()

            foreach($w in 0..$words.Count) {
                $word = $words[$w]

                # if the next word extends beyond $width, 
                # then add blanks spaces in the remaining spots and reset the 
                # character counter
                if($charCount + $word.Length -ge $paddedWidth) {
                    $spaces = $paddedWidth - $charCount + 1
                    $text += " " * $spaces
                    $text += "{0}{1}{2}{3}" -f $char, "`n", $char, ' '

                    $charCount = 0
                    $linesCount++
                }
                
                # The last word of the message will have spaces appended to it
                if($w -eq $words.Count) {
                    $spaces = $paddedWidth - $charCount + 1
                    $text += " " * $spaces
                } else {
                    $text += "$word "
                }
                
                $charCount = $charCount + $word.Length + 1 
            }

            $msgCount = $msgCount + 1
            
            $final += "{0} {1}{2}" -f $char, $text, $char 

            if($msgCount -lt $msg.Count) {
                $final += "{0}{1}{2}" -f "`n", $hollowBreak, "`n"
            }
        }

        Write-Host $final
    }

    End {
        Write-Host $lineBreak
    }
}