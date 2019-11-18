[cmdletBinding()]
Param(
    [ValidateScript({Test-Path $_ })]
    [string]$TargetPath,
    [ValidateRange(1,200)]
    [int]$Filecount = 20,
    [Validaterange(1,200)]
    [int]$Directorycount = 5
)

for($i = 0;$i -le $Directorycount;$i++)
{
    $Path = $TargetPath + "\Dir$("{0:D3}" -f $i)\"
    If(!(Test-Path -Path $Path))
    {
        New-Item -ItemType Directory -Path $Path
    }
    for($x = 0; $x -le $Filecount;$x++)
    {
        Get-Process | Out-File -FilePath ($Path + "File" + ("{0:D3}" -f $x) + ".txt")
    }
}

