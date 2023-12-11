# ------------- App hashtables ("dictionaries") -----------------

# Modify this to you linking. Just un-comment or comment (#) software you want to have / don't want to have.
# For further instructions see: https://github.com/vii33/ChocoVanillaPackage

$packagesBasic = @{
# --- Basics ---
    '7zip'='';
    vlc='';
    lightshot='';
    #adobereader='--params="/UpdateMode:4"';
    #foxitreader='--ia="/MERGETASKS=!desktopicon,!displayinbrowser /COMPONENTS=*pdfviewer,*ffse,*installprint,!ffaddin,*ffspellcheck,!connectedpdf.!installprint\wordaddin,!installprint\pptaddin,!installprint\exceladdin /DIR=D:\Programme\choco\foxitreader"';

# --- Browsers ---
    googlechrome='--params="/NoDesktopShortcut"';
    brave='--params="/NoDesktopShortcut"';
    #firefox='--params="/l:de /NoDesktopShortcut /RemoveDistributionDir"';
    #opera='--params="/NoDesktopShortcut /NoTaskbarShortcut"';

# --- File Sync Tools ---
    #dropbox='';
    #googledrive='';

# --- Collaboration Tools ---
    #zoom='';    
    #discord='';

# --- System administration ---
    #chocolateygui='';    
    #windirstat='';

} 



$packagesDev = @{
# --- General ---
    python='';
    vscode='--params="/NoDesktopIcon /NoQuicklaunchIcon"';
    notepadplusplus='';
    git='';
    anaconda3='';
    'pycharm-community'='';
    'intellijidea-community'='';
    
# --- API Clients ---
    postman='';
    
# --- Docker ---
    'docker-desktop'='';
    
# --- Cloud ---
    #'azure-cli'='';
    #'aws-vault'='';
    terraform='';

}

$packagesWork = @{
# --- General ---
    putty='';
    'openvpn-connect'='';
    winscp='';
    'microsoft-teams'='';

}
# --------------------------------------------------------------




# --------------------- Script start ---------------------------
Write-Host "`n --- The CHOCO WHITE PACKAGE --- " -ForegroundColor black -BackgroundColor white
Write-Host "https://github.com/iroshanvidanage/ChocoWhitePackage `n" -ForegroundColor green

$Break = $False
Do{
    switch (Read-Host "Which apps should be installed? Enter 'b' for basic apps, 'v' for developer apps, and 'w' for work related apps. If you want all, then run the
script three times."){
    
    b { $packToInstall = $packagesBasic; $Break = $True}
    v { $packToInstall = $packagesDev; $Break = $True}
    w { $packToInstall = $packagesWork; $Break = $True}
    # a { $packToInstall = 'a'; $Break = $True}
    e { exit }

    default {  Write-Host "Wrong input. Plase provide the character 'b' or 'v' or 'w'. Select 'e' for exit." -ForegroundColor red  }
    }
} While ($Break -eq $False)

# if ($packToInstall == 'a') {

# }
ForEach($key in $packToInstall.Keys){
    if ($packToInstall[$key]) {
        choco install $key -y $packToInstall[$key]   
    } 
    else {
        # Default installer
        choco install $key -y  
    }
}
