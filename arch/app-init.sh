sudo pacman-key --init

sudo pacman-key --populate

sudo pacman -Syy archlinux-keyring

sudo pacman -Syyuu --noconfirm

sudo pacman -S --noconfirm git base-devel wget zsh zoxide lsd fd bat fzf docker docker-compose deno nginx

git config --global user.name moxeii
git config --global user.email 2649075705@qq.com

cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R moxeii:wheel ./yay
cd yay
makepkg -si

yay -S --noconfirm mongodb-bin

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"