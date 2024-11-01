### yay installation
```
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
```

### yay packages
```
yay -S --needed - < yay-packages.txt
```

### change default shell
```
chsh -s $(which zsh)
```

### git setup
```
git config --global user.email "YOUR_EMAIL"
git config --global user.name "YOUR_NAME"

gh auth login
```

### remove dunst notification center
```
sudo pacman -Rcns dunst
killall dunst
```

### stow
```
stow -t ~/ PACKAGE_NAME
```

### bluetooth
```
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
```