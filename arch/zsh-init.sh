#!/bin/bash
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/hlissner/zsh-autopair $ZSH_CUSTOM/plugins/zsh-autopair
git clone https://github.com/Aloxaf/fzf-tab $ZSH_CUSTOM/plugins/fzf-tab
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/ldmoxeii/OS-init.git $HOME/.oh-my-zsh/custom/config

mkdir -p $HOME/.history/zsh_history
touch  $HOME/.history/fzf_history

sed -i 's#robbyrussell#powerlevel10k/powerlevel10k#' $HOME/.zshrc
sed -i 's#plugins=(git)#plugins=(sudo\n\tzsh-autopair\n\tzsh-autosuggestions\n\tzsh-syntax-highlighting\n\tfzf-tab\n)#' $HOME/.zshrc

echo 'HISTFILE=$HOME/.history/zsh_history' >> $HOME/.zshrc
echo 'HISTSIZE=5000' >> $HOME/.zshrc
echo 'SAVEHIST=5000' >> $HOME/.zshrc

echo 'export DENO_INSTALL="/root/.deno"' >> $HOME/.zshrc
echo 'export FZF="/usr/share/fzf"' >> $HOME/.zshrc
echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> $HOME/.zshrc
echo 'eval "$(zoxide init zsh --cmd cd)"' >> $HOME/.zshrc

echo 'alias ls="lsd"' >> $HOME/.zshrc
echo 'alias find="fd --exclude ~/SourceFile --exclude ~/go"' >> $HOME/.zshrc
echo 'alias cat="bat"' >> $HOME/.zshrc
echo '[[ ! -f $ZSH_CUSTOM/config/.p10k.zsh ]] || source $ZSH_CUSTOM/config/.p10k.zsh' >> $HOME/.zshrc
echo '[[ ! -f $ZSH_CUSTOM/config/fzf.zsh ]] || source $ZSH_CUSTOM/config/fzf.zsh' >> $HOME/.zshrc

source $HOME/.zshrc

chsh -s /usr/bin/zsh

sudo cp -r $HOME/.oh-my-zsh           /root/.oh-my-zsh
sudo cp -r $HOME/.zshrc               /root/.zshrc