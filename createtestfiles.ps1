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
    Write-Progress -Activity "Erstelle Testordner" -Status "Generiere Verzeichnis \Dir$("{0:D3}" -f $i)\" -PercentComplete ((100/$Directorycount)*$i)
    $Path = $TargetPath + "\Dir$("{0:D3}" -f $i)\"
    If(!(Test-Path -Path $Path))
    {
        New-Item -ItemType Directory -Path $Path
    }
    for($x = 0; $x -le $Filecount;$x++)
    {
        Write-Progress -Activity "Erstelle Tesdateien" -Status "Generiere Datei $("File$("{0:D3}" -f $x).txt in Ordner $("\Dir$("{0:D3}" -f $i)")")" -PercentComplete ((100/$Filecount)*$x) 
        if(Test-Path -Path ($Path + "File" + ("{0:D3}" -f $x) + ".txt")
        {
            Write-Verbose -Message "Datei schon existent wird überschrieben"
        }
        Get-Process | Out-File -FilePath ($Path + "File" + ("{0:D3}" -f $x) + ".txt") -Force
    }
}

