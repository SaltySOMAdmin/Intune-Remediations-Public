# Define the version to compare with
 $compareVersion = "24.005.20272"
 $compareVersionArray = $compareVersion -split '\.'

# Get the path of the installed 64 bit executable
$exePath = "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe"

# Check if Chrome is installed
if (Test-Path $exePath) {
    # Get the version
    $exeVersion = (Get-Item $exePath).VersionInfo.FileVersion

    # Split the version string into an array of numbers
    $exeVersionArray = $exeVersion -split '\.'

    # Compare each version segment
    for ($i = 0; $i -lt 4; $i++) {
        if ([int]$exeVersionArray[$i] -lt [int]$compareVersionArray[$i]) {
            Write-output "Application is out of date. $exeVersion"
			exit 1
        } elseif ([int]$exeVersionArray[$i] -gt [int]$compareVersionArray[$i]) {
			Write-output "Application is up to date. $exeVersion"
            exit 0
        }
    }

    Write-output "the versions are equal"
    exit 0
}


# Get the path of the installed 32 bit executable
$exePath = "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"

if (Test-Path $exePath) {
    # Get the version
    $exeVersion = (Get-Item $exePath).VersionInfo.FileVersion

    # Split the version string into an array of numbers
    $exeVersionArray = $exeVersion -split '\.'

    # Compare each version segment
    for ($i = 0; $i -lt 4; $i++) {
        if ([int]$exeVersionArray[$i] -lt [int]$compareVersionArray[$i]) {
            Write-output "Application is out of date. $exeVersion"
			exit 1
        } elseif ([int]$exeVersionArray[$i] -gt [int]$compareVersionArray[$i]) {
			Write-output "Application is up to date. $exeVersion"
            exit 0
        }
    }

    Write-output "the versions are equal"
    exit 0
}
else {
	Write-output "Application not installed" 
	Exit 0
}