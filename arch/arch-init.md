```sh
## 第一次命令组

export username=<username>
passwd

systemctl enable systemd-networkd-wait-online.service

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

useradd -m -G wheel -s /bin/bash $username
passwd $username
su -l $username

---
## 第二次命令组

export git_username=<git_username>
export git_email=<git_email>
sudo pacman-key --init

sudo pacman-key --populate

sudo pacman -Syy --noconfirm archlinux-keyring

sudo pacman -Syyuu --noconfirm

sudo pacman -S --noconfirm git base-devel wget zsh zoxide lsd fd bat fzf docker docker-compose deno nginx

git config --global user.name $git_username
git config --global user.email $git_email

cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $USER:wheel ./yay
cd yay
makepkg -si --noconfirm

yay -S --noconfirm mongodb-bin

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

---

## 第三次命令组
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/hlissner/zsh-autopair $ZSH_CUSTOM/plugins/zsh-autopair
git clone https://github.com/Aloxaf/fzf-tab $ZSH_CUSTOM/plugins/fzf-tab
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

mkdir -p $HOME/.history/zsh_history
touch  $HOME/.history/fzf_history

sudo mv Zsh/.zshrc $HOME/.zshrc && cp -r Zsh/config $ZSH_CUSTOM/config
---
## 第四次命令组

su 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh

---
## 第五次命令组

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/hlissner/zsh-autopair $ZSH_CUSTOM/plugins/zsh-autopair
git clone https://github.com/Aloxaf/fzf-tab $ZSH_CUSTOM/plugins/fzf-tab
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
mkdir -p $HOME/.history/zsh_history
touch  $HOME/.history/fzf_history

export username=<username>
cp /home/$username/.zshrc $HOME/.zshrc 
cp -r /home/$username/.oh-my-zsh/custom/config $ZSH_CUSTOM/config
chsh -s /usr/bin/zsh
```