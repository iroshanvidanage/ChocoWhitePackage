# ------------- App hashtables ("dictionaries") -----------------

# Modify this to you linking. Just un-comment or comment (#) software you want to have / don't want to have.
# For further instructions see: https://github.com/vii33/ChocoVanillaPackage

$packagesBasic = @{
# --- Basics ---
    'bandizip'='';
    notepadplusplus=''; 
    potplayer=''; 
    adobereader='--params="/UpdateMode:4"';
    #foxitreader='--ia="/MERGETASKS=!desktopicon,!displayinbrowser /COMPONENTS=*pdfviewer,*ffse,*installprint,!ffaddin,*ffspellcheck,!connectedpdf.!installprint\wordaddin,!installprint\pptaddin,!installprint\exceladdin /DIR=D:\Programme\choco\foxitreader"';

# --- Browsers ---
    googlechrome='';
    #firefox='--params="/l:de /NoDesktopShortcut /RemoveDistributionDir"';
    #opera='--params="/NoDesktopShortcut /NoTaskbarShortcut"';

# --- File Sync Tools ---
    #dropbox='';
    #googledrive='';

# --- Collaboration Tools ---
    zoom='';    
    'microsoft-teams'='';
    #discord='';

# --- System administration ---
    #chocolateygui='';    
    #windirstat='';

} 



$packagesDev = @{
# --- General ---
    vscode='--params="/NoDesktopIcon /NoQuicklaunchIcon"';
    git='';

# --- API Clients ---
    postman='';

# --- Cloud ---
    #'azure-cli'='';
    #'aws-vault'='';

}
# --------------------------------------------------------------




# --------------------- Script start ---------------------------
Write-Host "`n --- The CHOCO WHITE PACKAGE --- " -ForegroundColor black -BackgroundColor white
Write-Host "https://github.com/ShehanBrendon/ChocoWhitePackage `n" -ForegroundColor green

$Break = $False
Do{
    switch (Read-Host "Which apps should be installed? Enter 'b' for basic apps, 'v' for developer apps. If you want both, then run the
script two times."){
    
    b { $packToInstall = $packagesBasic; $Break = $True}
    v { $packToInstall = $packagesDev; $Break = $True}
    e { exit }

    default {  Write-Host "Wrong input. Plase provide the character 'b' or 'v'. Select 'e' for exit." -ForegroundColor red  }
    }
} While ($Break -eq $False)


ForEach($key in $packToInstall.Keys){
    if ($packToInstall[$key]) {
        choco install $key -y $packToInstall[$key]   
    } 
    else {
        # Default installer
        choco install $key -y  
    }
}
