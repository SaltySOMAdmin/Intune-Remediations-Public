#Checks if Dell Trusted Device Agent Exists

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Trusted Device Agent"}

If ( $MyApp -ne $null ) {
	Write-Output "Dell Trusted Device Agent Exists."
	Exit 1

}Else {
	Write-Output "Dell Trusted Device Agent Does Not Exists."
	Exit 0
}