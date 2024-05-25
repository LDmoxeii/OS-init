#!/bin/bash
if [ $# -ne 2 ]; then
  echo "Usage: $0 <git_username> <git_email>"
  exit 1
fi

sudo pacman-key --init

sudo pacman-key --populate

sudo pacman -Syy --noconfirm archlinux-keyring

sudo pacman -Syyuu --noconfirm

sudo pacman -S --noconfirm git base-devel wget zsh zoxide lsd fd bat fzf docker docker-compose deno nginx

git config --global user.name $1
git config --global user.email $2

cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $USER:wheel ./yay
cd yay
makepkg -si --noconfirm

yay -S --noconfirm mongodb-bin

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"