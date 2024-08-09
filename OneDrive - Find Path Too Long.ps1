#get logged in user and format
$loggedInUser = Get-WMIObject -class Win32_ComputerSystem | select username
$loggedInUser = ($loggedInUser -split "\\")[1]
$loggedInUser = $loggedInUser.trim("}")
$pathToScan = "C:\Users\$loggedInUser\OneDrive - Organization"  # The path to scan and the the lengths for (sub-directories will be scanned as well).
$outputFilePath = "C:\temp\PathLengths.txt" # This must be a file in a directory that exists and does not require admin rights to write to.

$writeToConsoleAsWell = $true   # Writing to the console will be much slower.
 
# Open a new file stream (nice and fast) and write all the paths and their lengths to it.
$outputFileDirectory = Split-Path $outputFilePath -Parent
if (!(Test-Path $outputFileDirectory)) { New-Item $outputFileDirectory -ItemType Directory }
$stream = New-Object System.IO.StreamWriter($outputFilePath, $false)
Get-ChildItem -Path $pathToScan -Recurse -Force | Select-Object -Property FullName, @{Name="FullNameLength";Expression={($_.FullName.Length)}} | Sort-Object -Property FullNameLength -Descending | ForEach-Object {
    $filePath = $_.FullName
    $length = $_.FullNameLength
    $string = "$length : $filePath"
     
    # Write to the Console.
    if ($writeToConsoleAsWell) { Write-Host $string }
  
    #Write to the file.
    $stream.WriteLine($string)
}
$stream.Close()