echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

useradd -m -G wheel -s /bin/bash moxeii

passwd moxeii

su moxeii

# Arch.exe config --default-user moxeii

------------------------------------------------------------------------------------------------------

sudo pacman-key --init

sudo pacman-key --populate

sudo pacman -Syy archlinux-keyring

sudo pacman -Syyuu --noconfirm

sudo pacman -S --noconfirm git base-devel wget zsh docker docker-compose fzf zoxide 

cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R moxeii:wheel ./yay
cd yay
makepkg -si

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

------------------------------------------------------------------------------------------------------

sudo git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/hlissner/zsh-autopair $ZSH_CUSTOM/plugins/zsh-autopair
sudo git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
sudo git clone https://github.com/Aloxaf/fzf-tab $ZSH_CUSTOM/plugins/fzf-tab
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

sed -i 's/plugins=(git)/plugins=(\n\tgit\n\taliases\n\tyou-should-use\n\tsudo\n\tzsh-autopair\n\tzsh-autosuggestions\n\tzsh-syntax-highlighting)\n\tfzf-tab/' ~/.zshrc
sed -i 's/robbyrussell/powerlevel10k/powerlevel10k/' ~/.zshrc
echo 'eval "$(zoxide init zsh --cmd cd)"' >> ~/.zshrc

source ~/.zshrc

chsh -s /usr/bin/zsh

yay -S mongodb-bin

sudo pacman -S deno nginx

echo 'export DENO_INSTALL="/root/.deno"' >> ~/.zshrc
echo 'export FZF="/usr/share/fzf"'
echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

sudo ln -s $HOME/.oh-my-zsh           /root/.oh-my-zsh
sudo ln -s $HOME/.zshrc               /root/.zshrc

git config --global user.name moxeii
git config --global user.email 2649075705@qq.com