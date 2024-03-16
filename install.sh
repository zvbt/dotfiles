log_file=~/config_logs.txt
config=~/.config

# Alacritty
if winget list 2>/dev/null | grep -q Alacritty; then
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

# Scoop
if scoop -v 2>/dev/null | grep -q Scoop; then
    echo "Scoop is already installed." | tee -a $log_file
else
    echo "Running Scoop installer in a powershell window" | tee -a $log_file
    powershell Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    powershell -Command "irm get.scoop.sh | iex"
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


#==============
# Give the user a summary of what has been installed
#==============
clear
echo -e "\n====== LOGS ======\n"
cat $log_file
echo
rm $log_file
