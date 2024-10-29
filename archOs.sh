#!/usr/bin/env zsh


#PACMAN
	sudo pacman -Syu
	sudo pacman -S --needed base-devel git curl


# Define an array of packages to install using pacman.
packages=(
    "python"
    "tcl-tk"
    "python-tk"
    "git"    
    "tree"
    "pylint"
    "black"
    "node"
	"zsh"
	"zsh-completions"
	"zsh-autosuggestions"
	"sublime-text"
	"discord"
	"vim"
)

#SUBLIME

curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text

for package in "${packages[@]}"; do
    if pacman -Qqe | grep -q "^$package\$"; then
        echo "$package is already installed. Skipping..."
    else
        echo "Installing $package..."
        sudo pacman -Syu "$package"
    fi
done

# Oh My Zsh
cd $HOME
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
source $HOME/.zshrc

#YAY
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd $HOME

packages=(
	"visual-studio-code-bin"
	"google-chrome"
	"firefoxv
	"brave-bin"
)

for package in "${packages[@]}"; do
    if pacman -Qm | grep -q "^$package\$"; then
        echo "$package is already installed. Skipping..."
    else
        echo "Installing $package..."
        sudo yay -S "$package"
    fi
done
