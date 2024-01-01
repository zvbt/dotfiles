# alacritty

appdataConfig="C:/Users/cyadine/AppData/Roaming"
dotConfig="C:/Users/cyadine/.config"
userFolder="C:/Users/cyadine"


echo -e "  "
cp -r "./alacritty" $appdataConfig
echo -e "moved \033[31m./alacritty\033[0m to $appdataConfig"

echo -e "  "
cp -r "./komorebi" $dotConfig
rm "$dotConfig/komorebi/whkdrc"
cp "./komorebi/whkdrc" $dotConfig
echo -e "moved \033[31m./komerebi\033[0m to $dotConfig"

echo -e "  "
cp -r "./mpv/" $appdataConfig
echo -e "moved \033[31m./mpv\033[0m to $appdataConfig"

echo -e "  "
cp -r "./oh-my-bash/themes/zvbt/" "$userFolder/.oh-my-bash/themes"
cp "./oh-my-bash/.bashrc" $userFolder
echo -e "moved \033[31moh-my-bash theme & config\033[0m"

echo -e "  "
cp "./local.sh" $userFolder
echo -e "moved \033[31mlocal.sh\033[0m to $userFolder"

echo -e "  "
cp -r "./glaze-wm" "$userFolder/.glaze-wm"
echo -e "moved \033[31m./glaze-wm/\033[0m to $userFolder"