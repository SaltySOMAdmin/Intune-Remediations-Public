#Checks if Dell SupportAssist Exists

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell SupportAssist"}

If ( $MyApp -ne $null ) {
	Write-Output "Dell SupportAssist Exists."
	Exit 1

}Else {
	Write-Output "Dell SupportAssist Does Not Exists."
	Exit 0
}