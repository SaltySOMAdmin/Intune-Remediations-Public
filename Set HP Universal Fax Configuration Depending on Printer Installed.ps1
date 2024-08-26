<# 

Test for Print To Fax Object first. Exit if doens't exist

#>
# Set variables to indicate value and key to set
$PrinterName = "Print To Fax"
$RegistryPathPrinter = "HKLM:\SYSTEM\CurrentControlSet\Control\Print\Printers\$PrinterName"

# Call Function to test and set registry
#If printer exists, test registry values exists Else Exit 0
If ( -not (Test-Path -Path $RegistryPathPrinter)) {
#Output to Intune that Acrobat Client Exists
Write-Output "Printerlogic Print To Fax Object Does Not Exist."
Exit 2
}

# Set variables to indicate value and key to set
$PrinterName = "HP X67755"
$RegistryPathPrinter = "HKLM:\SYSTEM\CurrentControlSet\Control\Print\Printers\$PrinterName"
$FaxObjectName = "Print To Fax"
$RegistryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Print\Printers\$FaxObjectName\PrinterDriverData"
$FaxPort = "HKLM:\SYSTEM\CurrentControlSet\Control\Print\Printers\$FaxObjectName"

<#


HP X67755 

#>

#Remove Installtype to remove the find-printer dialog
If (Get-ItemProperty -path $RegistryPath -Name "Installtype" -ErrorAction SilentlyContinue){
Remove-Itemproperty -path $RegistryPath -Name Installtype -Force
}

# Call Function to test and set registry
#If printer exists, test registry values exists Else Exit 0
If ( Test-Path -Path $RegistryPathPrinter) {

	# HP X67755 - 7-S-154
	# Set Printer-specific variables
	$UFDPrinterSerial = ''
	$UFDPrinterName = 'HP Color LaserJet Flow X67755'
	$UFDPrinterAddress = ''
	Set-ItemProperty -path $FaxPort -Name "Port" -Value $UFDPrinterAddress -Type 'STRING' -Force
	
	Add-PrinterPort -Name "TCPPort:$UFDPrinterAddress" -PrinterHostAddress $UFDPrinterAddress
	Set-Printer -Name $FaxObjectName -PortName "TCPPort:$UFDPrinterAddress"

	# Set variables to indicate value and key to set	
		$ValueName    = 'AssociatedPrintDriverName'
		$ValueData    = 'HP Universal Fax Driver'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendDialogUI'
		$ValueData    = 'HPUFD_FaxPCSendDialogUI.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendStatus'
		$ValueData    = 'HPUFD_FaxPCSendRenderPlugin.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendStatusUI'
		$ValueData    = 'HPUFD_FaxPCSendDialogUI.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterAddress'
		$ValueData    = $UFDPrinterAddress
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterName'
		$ValueData    = $UFDPrinterName
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterSerial'
		$ValueData    = $UFDPrinterSerial
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force
	
	Write-Output "Successfully updated Print to Fax to point to $PrinterName."
	Exit 0
}



<#


HP E78635 - 

#>
# Set variables to indicate value and key to set
$PrinterName = "HP E78635 "
$RegistryPathPrinter = "HKLM:\SYSTEM\CurrentControlSet\Control\Print\Printers\$PrinterName"
	
# Call Function to test and set registry
#If printer exists, test registry values exists Else Exit 0
If ( Test-Path -Path $RegistryPathPrinter) {

	# Set Printer-specific variables
	$UFDPrinterSerial = ''
	$UFDPrinterName = 'HP Color LaserJet Flow E78635'
	$UFDPrinterAddress = ''
	Set-ItemProperty -path $FaxPort -Name "Port" -Value $UFDPrinterAddress -Type 'STRING' -Force
	Add-PrinterPort -Name "TCPPort:$UFDPrinterAddress" -PrinterHostAddress $UFDPrinterAddress
	Set-Printer -Name $FaxObjectName -PortName "TCPPort:$UFDPrinterAddress"

	# Set variables to indicate value and key to set	
		$ValueName    = 'AssociatedPrintDriverName'
		$ValueData    = 'HP Universal Fax Driver'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendDialogUI'
		$ValueData    = 'HPUFD_FaxPCSendDialogUI.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendStatus'
		$ValueData    = 'HPUFD_FaxPCSendRenderPlugin.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendStatusUI'
		$ValueData    = 'HPUFD_FaxPCSendDialogUI.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterAddress'
		$ValueData    = $UFDPrinterAddress
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterName'
		$ValueData    = $UFDPrinterName
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterSerial'
		$ValueData    = $UFDPrinterSerial
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force
	Write-Output "Successfully updated Print to Fax to point to $PrinterName."
	Exit 0
}




<#

HP X57945 - 

#>
# Set variables to indicate value and key to set
$PrinterName = "HP X57945 - S"
$RegistryPathPrinter = "HKLM:\SYSTEM\CurrentControlSet\Control\Print\Printers\$PrinterName"
	
# Call Function to test and set registry
#If printer exists, test registry values exists Else Exit 0
If ( Test-Path -Path $RegistryPathPrinter) {


	# Set Printer-specific variables
	$UFDPrinterSerial = ''
	$UFDPrinterName = 'HP Color LaserJet Flow X57945'
	$UFDPrinterAddress = ''
	Set-ItemProperty -path $FaxPort -Name "Port" -Value $UFDPrinterAddress -Type 'STRING' -Force
	Add-PrinterPort -Name "TCPPort:$UFDPrinterAddress" -PrinterHostAddress $UFDPrinterAddress
	Set-Printer -Name $FaxObjectName -PortName "TCPPort:$UFDPrinterAddress"

	# Set variables to indicate value and key to set	
		$ValueName    = 'AssociatedPrintDriverName'
		$ValueData    = 'HP Universal Fax Driver'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendDialogUI'
		$ValueData    = 'HPUFD_FaxPCSendDialogUI.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendStatus'
		$ValueData    = 'HPUFD_FaxPCSendRenderPlugin.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendStatusUI'
		$ValueData    = 'HPUFD_FaxPCSendDialogUI.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterAddress'
		$ValueData    = $UFDPrinterAddress
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterName'
		$ValueData    = $UFDPrinterName
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterSerial'
		$ValueData    = $UFDPrinterSerial
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force
	Write-Output "Successfully updated Print to Fax to point to $PrinterName."
	Exit 0
}



<#


HP X57945 - G

#>
# Set variables to indicate value and key to set
$PrinterName = "HP X57945 - G"
$RegistryPathPrinter = "HKLM:\SYSTEM\CurrentControlSet\Control\Print\Printers\$PrinterName"
	
# Call Function to test and set registry
#If printer exists, test registry values exists Else Exit 0
If ( Test-Path -Path $RegistryPathPrinter) {


	# Set Printer-specific variables
	$UFDPrinterSerial = ''
	$UFDPrinterName = 'HP Color LaserJet Flow X57945'
	$UFDPrinterAddress = ''
	Set-ItemProperty -path $FaxPort -Name "Port" -Value $UFDPrinterAddress -Type 'STRING' -Force
	Add-PrinterPort -Name "TCPPort:$UFDPrinterAddress" -PrinterHostAddress $UFDPrinterAddress
	Set-Printer -Name $FaxObjectName -PortName "TCPPort:$UFDPrinterAddress"

	# Set variables to indicate value and key to set	
		$ValueName    = 'AssociatedPrintDriverName'
		$ValueData    = 'HP Universal Fax Driver'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendDialogUI'
		$ValueData    = 'HPUFD_FaxPCSendDialogUI.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendStatus'
		$ValueData    = 'HPUFD_FaxPCSendRenderPlugin.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendStatusUI'
		$ValueData    = 'HPUFD_FaxPCSendDialogUI.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterAddress'
		$ValueData    = $UFDPrinterAddress
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterName'
		$ValueData    = $UFDPrinterName
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterSerial'
		$ValueData    = $UFDPrinterSerial
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force
	Write-Output "Successfully updated Print to Fax to point to $PrinterName."
	Exit 0
}

<#

Pediatric Surgery - GSB
HP X57945 - Ped Surgery

#>
# Set variables to indicate value and key to set
$PrinterName = "HP X57945 -y"
$RegistryPathPrinter = "HKLM:\SYSTEM\CurrentControlSet\Control\Print\Printers\$PrinterName"
	
# Call Function to test and set registry
#If printer exists, test registry values exists Else Exit 0
If ( Test-Path -Path $RegistryPathPrinter) {


	# Set Printer-specific variables
	$UFDPrinterSerial = ''
	$UFDPrinterName = 'HP Color LaserJet Flow X57945'
	$UFDPrinterAddress = ''
	Set-ItemProperty -path $FaxPort -Name "Port" -Value $UFDPrinterAddress -Type 'STRING' -Force
	Add-PrinterPort -Name "TCPPort:$UFDPrinterAddress" -PrinterHostAddress $UFDPrinterAddress
	Set-Printer -Name $FaxObjectName -PortName "TCPPort:$UFDPrinterAddress"

	# Set variables to indicate value and key to set	
		$ValueName    = 'AssociatedPrintDriverName'
		$ValueData    = 'HP Universal Fax Driver'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendDialogUI'
		$ValueData    = 'HPUFD_FaxPCSendDialogUI.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendStatus'
		$ValueData    = 'HPUFD_FaxPCSendRenderPlugin.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'FaxPCSendStatusUI'
		$ValueData    = 'HPUFD_FaxPCSendDialogUI.dll'
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterAddress'
		$ValueData    = $UFDPrinterAddress
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterName'
		$ValueData    = $UFDPrinterName
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force

	# Set variables to indicate value and key to set
		$ValueName    = 'UFDPrinterSerial'
		$ValueData    = $UFDPrinterSerial
		$Type		  = 'STRING' #string,expandstring,binary,dword,multistring.qword
	Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force
	Write-Output "Successfully updated Print to Fax to point to $PrinterName."
	Exit 0
}

Write-Output "No HP Print to Fax device installed"
Exit 0
