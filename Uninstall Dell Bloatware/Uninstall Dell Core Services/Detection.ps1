#Checks if Dell Core Services Exists

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Core Services"}

If ( $MyApp -ne $null ) {
	Write-Output "Dell Core Services Exists."
	Exit 1

}Else {
	Write-Output "Dell Core Services Does Not Exists."
	Exit 0
}