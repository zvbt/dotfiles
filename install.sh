log_file=~/config_logs.txt
config=~/.config

# handle_error() {
#     local exit_code=$?
#     echo -e "\033[0;31m An error occurred. (try running this script as admin) \033[0m"
#     exit $exit_code
# }
# trap 'handle_error' ERR

# Scoop & winget check
if scoop -v 2>/dev/null | grep -q Scoop; then
    echo "Scoop is already installed." | tee -a $log_file
    scoop=true
else
    echo "Please install Scoop https://scoop.sh/" | tee -a $log_file
fi
if winget 2>/dev/null | grep -q winget; then
    echo "Winget is already installed." | tee -a $log_file
    winget=true
else
    echo "Please install Winget https://aka.ms/getwinget" | tee -a $log_file
fi


if [ "$scoop" = true ] && [ "$winget" = true ]; then
    # Alacritty
if alacritty --version list 2>/dev/null | grep -q alacritty; then
    echo "Alacritty is already installed."| tee -a $log_file
    cp -r "./alacritty" $APPDATA
    echo "Moving the config to $APPDATA/alacritty" | tee -a $log_file
    echo "Alacritty done." | tee -a $log_file
else
    echo "Alacritty is not installed." | tee -a $log_file
    echo "Installing Alacritty..." | tee -a $log_file
    winget install Alacritty.Alacritty
    echo "Successfully installed Alacritty." | tee -a $log_file
    echo "Moving the config to $APPDATA/alacritty" | tee -a $log_file
    cp -r "./alacritty" $APPDATA
    echo "Alacritty done." | tee -a $log_file
fi

# MPV
if mpv.com --version 2>/dev/null | grep -q mpv; then
    echo "mpv is already installed." | tee -a $log_file
    echo "Moving the config to $USERPROFILE/scoop/apps/mpv/current/portable_config/" | tee -a $log_file
    cp -r "./mpv"/* $USERPROFILE/scoop/apps/mpv/current/portable_config/
    echo "mpv done." | tee -a $log_file
else
    echo "mpv is not installed." | tee -a $log_file
    echo "Installing mpv..." | tee -a $log_file
    echo "Successfully installed mpv." | tee -a $log_file
    echo "Moving the config to $USERPROFILE/scoop/apps/mpv/current/portable_config/" | tee -a $log_file
    cp -r "./mpv"/* $USERPROFILE/scoop/apps/mpv/current/portable_config/
    echo "mpv done." | tee -a $log_file
fi


# GlazeWM
if scoop list 2>/dev/null | grep -q glazewm; then
    echo "GlazeWM is already installed." | tee -a $log_file
    echo "Moving the config to $USERPROFILE/.glaze-wm/" | tee -a $log_file
    cp -r "./glaze-wm"/* $USERPROFILE/.glaze-wm/
    echo "Creating a startmenu shortcut & auto startup..." | tee -a $log_file
    powershell -Command "New-Item -ItemType SymbolicLink -Path '$APPDATA\Microsoft\Windows\Start Menu\Programs' -Name "GlazeWM.lnk" -Value '$USERPROFILE/scoop/apps/glazewm/current/GlazeWM.exe'"
    powershell -Command "New-Item -ItemType SymbolicLink -Path '$APPDATA\Microsoft\Windows\Start Menu\Programs\Startup' -Name "GlazeWM.lnk" -Value '$USERPROFILE/scoop/apps/glazewm/current/GlazeWM.exe'"
    echo "GlazeWM done." | tee -a $log_file
else
    echo "GlazeWM is not installed." | tee -a $log_file
    echo "Installing GlazeWM..." | tee -a $log_file
    scoop install glazewm
    echo "Successfully installed GlazeWM." | tee -a $log_file
    echo "Moving the config to $USERPROFILE/.glaze-wm/" | tee -a $log_file
    mkdir $USERPROFILE/.glaze-wm/
    cp -r "./glaze-wm"/* $USERPROFILE/.glaze-wm/
    echo "Creating a startmenu shortcut & auto startup..." | tee -a $log_file
    powershell -Command "New-Item -ItemType SymbolicLink -Path '$APPDATA\Microsoft\Windows\Start Menu\Programs' -Name "GlazeWM.lnk" -Value '$USERPROFILE/scoop/apps/glazewm/current/GlazeWM.exe'"
    powershell -Command "New-Item -ItemType SymbolicLink -Path '$APPDATA\Microsoft\Windows\Start Menu\Programs\Startup' -Name "GlazeWM.lnk" -Value '$USERPROFILE/scoop/apps/glazewm/current/GlazeWM.exe'"
    echo "GlazeWM done." | tee -a $log_file
fi

else
    echo "Please make sure to install winget & scoop." | tee -a $log_file
fi




#==============
# Give the user a summary of what has been installed
#==============
clear
echo -e "\n====== LOGS ======\n"
cat $log_file
echo
rm $log_file
