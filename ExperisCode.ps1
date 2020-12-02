<#
Solution #1 seemed to average a slightly faster speed than solution #2
I was seeing 1.3 ms for solution #1 and 1.5 ms for solution #2
#>


#Solution #1
function Invoke-ReturnFirstDup {
    [CmdletBinding()]
    Param (
        [Parameter()][array]$stringArray
    )

    Begin {        
        $firstRepeatingChar = ""
        $stringArrayList = New-Object System.Collections.ArrayList
    }

    Process {
        foreach ($char in $stringArray){
            if ($char -inotin $stringArrayList){
                $stringArrayList.Add($char) |Out-Null
            }
            else {
                $firstRepeatingChar = $char
                break
            }
        }
    }

    End {
        Return $firstRepeatingChar
    }
}

measure-command{
    $inputString = "adaditional"
    $stringArray = $inputString.ToCharArray()
    $firstRepeatingChar = Invoke-ReturnFirstDup -stringArray $stringArray
}
Write-Output $firstRepeatingChar




#Solution #2
function Invoke-ReturnFirstDup {
    [CmdletBinding()]
    Param (
        [Parameter()][string]$inputString
    )

    Begin {
        $stringArray = $inputString.ToCharArray()
        $lowStringIndex = $inputString.Length
        $currentStringIndex = 1
        $count = 1
    }

    Process {
        foreach ($char in $stringArray){
            for ($i=$count;$i -lt $inputString.Length-1;$i++){
                $currentStringIndex = $i
                if ($char -ieq $stringArray[$i]){
                    if ($currentStringIndex -lt $lowStringIndex){$lowStringIndex = $currentStringIndex}
                }
            }
            $count++
        }
        $firstRepeatingChar = $stringArray[$lowStringIndex]
    }

    End {
        Return $firstRepeatingChar
    }
}

measure-command{
    $inputString = "adaditional"
    $firstRepeatingChar = Invoke-ReturnFirstDup -inputString $inputString
}
Write-Output $firstRepeatingChar
