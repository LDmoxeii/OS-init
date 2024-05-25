# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

plugins=(
	sudo
	zsh-autopair
	zsh-autosuggestions
	zsh-syntax-highlighting
	fzf-tab
)

ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# User configuration
HISTFILE=$HOME/.history/zsh_history
HISTSIZE=5000
SAVEHIST=5000

export DENO_INSTALL="/root/.deno"
export FZF="/usr/share/fzf"
export PATH="$DENO_INSTALL/bin:$PATH"

alias ls="lsd"
alias find="fd --exclude ~/SourceFile --exclude ~/go "
alias cat="bat"

eval "$(zoxide init zsh --cmd cd)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZSH_CUSTOM/config/.p10k.zsh ]] || source $ZSH_CUSTOM/config/.p10k.zsh
[[ ! -f $ZSH_CUSTOM/config/fzf.zsh ]] || source $ZSH_CUSTOM/config/fzf.zsh
