

#Alias
Set-Alias  nvm  $HOME\.config\nvm\nvm.exe 
Set-ALias ll ls 
Set-Alias grep findstr
Set-Alias fetch neofetch



function reload (){
    . $profile
}

set choco='sudo choco'


#GIT
Set-Alias omp oh-my-posh

#open setting.json windows terminal
Set-Alias Settings C:\users\$env:UserName\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json
set settings="C:\users\$env:UserName\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json"

