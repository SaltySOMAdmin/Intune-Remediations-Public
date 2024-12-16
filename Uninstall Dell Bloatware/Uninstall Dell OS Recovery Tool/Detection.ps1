#Checks if Dell OS Recovery Tool Exists

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell OS Recovery Tool"}

If ( $MyApp -ne $null ) {
	Write-Output "Dell OS Recovery Tool Exists."
	Exit 1

}Else {
	Write-Output "Dell OS Recovery Tool Does Not Exists."
	Exit 0
}