sudo git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/hlissner/zsh-autopair $ZSH_CUSTOM/plugins/zsh-autopair
sudo git clone https://github.com/Aloxaf/fzf-tab $ZSH_CUSTOM/plugins/fzf-tab
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

sed -i 's/plugins=(git)/plugins=(sudo\n\tzsh-autopair\n\tzsh-autosuggestions\n\tzsh-syntax-highlighting)\n\tfzf-tab/' ~/.zshrc
sed -i 's/robbyrussell/powerlevel10k/powerlevel10k/' ~/.zshrc
echo 'eval "$(zoxide init zsh --cmd cd)"' >> ~/.zshrc
echo 'export DENO_INSTALL="/root/.deno"' >> ~/.zshrc
echo 'export FZF="/usr/share/fzf"'
echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.zshrc

source ~/.zshrc

chsh -s /usr/bin/zsh

sudo ln -s $HOME/.oh-my-zsh           /root/.oh-my-zsh
sudo ln -s $HOME/.zshrc               /root/.zshrc