### pacman packages
```
pacman -S --needed - < pacman-packages.txt
```

### yay installation
```
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
```

### yay packages
```
yay -Sy google-chrome visual-studio-code-bin
```

### git setup
```
git config --global user.email "YOUR_EMAIL"
git config --global user.name "YOUR_NAME"

gh auth login
```
