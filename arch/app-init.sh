echo "enter username: "
read user_name
echo "enter git user.name: "
read git_user_name
echo "enter git user.email: "
read git_user_email

sudo pacman-key --init

sudo pacman-key --populate

sudo pacman -Syy archlinux-keyring

sudo pacman -Syyuu --noconfirm

sudo pacman -S --noconfirm git base-devel wget zsh zoxide lsd fd bat fzf docker docker-compose deno nginx

git config --global user.name $git_user_name
git config --global user.email $git_user_email

cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $user_name:wheel ./yay
cd yay
makepkg -si

yay -S --noconfirm mongodb-bin

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"