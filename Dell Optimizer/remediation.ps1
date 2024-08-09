#Create temp folder and copy installer over (folder is cleaned weekly)
#New-Item -ItemType Directory -Force -Path "c:\surgtemp\"
#remove-Item -Path "C:\Program Files (x86)\Foxit Software\Foxit PDF Editor\fpmkey.txt" -Recurse -Force

#Start Install Process - Wait until complete
#start-process -wait -filepath "C:\Program Files (x86)\InstallShield Installation Information\{286A9ADE-A581-43E8-AA85-6F5D58C7DC88}\DellOptimizer.exe" -ArgumentList "-remove -runfromtemp -silent"
Start-Process msiexec.exe -Wait -ArgumentList "/x {4EA9855C-3339-4AE3-977B-6DF8A369469D} /qn"

Start-Process msiexec.exe -Wait -ArgumentList "/x {EC45CAE6-9000-43EC-B7BA-54D3D654BF21} /qn"

Start-Process msiexec.exe -Wait -ArgumentList "/x {E27862BD-4371-4245-896A-7EBE989B6F7F} /qn"

&"C:\Program Files (x86)\InstallShield Installation Information\{286A9ADE-A581-43E8-AA85-6F5D58C7DC88}\DellOptimizer.exe" -remove -runfromtemp -silent

Start-Sleep 120

Start-Process msiexec.exe -Wait -ArgumentList "/x {EC45CAE6-9000-43EC-B7BA-54D3D654BF21} /qn"

Start-Process msiexec.exe -Wait -ArgumentList "/x {6B8F1793-AB75-4A01-B72D-CC2B54B19759} /qn"

Start-Process msiexec.exe -Wait -ArgumentList "/x {65CD6BB0-7507-40D2-930B-797C5EF44938} /qn"

&"C:\ProgramData\Package Cache\{26e99410-cf21-40aa-9a6e-75bdd110d349}\DellSupportAssistRemediationServiceInstaller.exe"  /uninstall

Start-Sleep 120

Exit 0