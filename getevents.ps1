function Get-EventID
{
<#
.Synopsis
   EventAbfrage
.DESCRIPTION
   Abfrage von Security Events
.EXAMPLE
   .\getevents.ps1 -EventId 4634 -COMPUTERNAME localhost

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   18771 Nov 15 11:16  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
   18768 Nov 15 11:15  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
   18765 Nov 15 11:15  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
   18762 Nov 15 11:15  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
   18759 Nov 15 11:14  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....

.EXAMPLE
   Ein weiteres Beispiel für die Verwendung dieses Cmdlets
#>
[cmdletBinding()]
Param(

[int]$EventId = 4624,
[ValidateSet("Security","Application","System")]
[string]$LogName = "Security",
[ValidateScript({Test-Connection -ComputerName $_ -Quiet -Count 2 })]
[Parameter(Mandatory=$true)]
[string]$COMPUTERNAME,
[ValidateRange(5,10)]
[int]$Count = 4
)

Write-Verbose -Message "Der User hat Eventid $EventID angegeben"
Get-EventLog -LogName $LogName -ComputerName $COMPUTERNAME | Where-Object EventId -eq $EventId |Select-Object -First $Count
}
