# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git asdf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
# Node version manager
 export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# sst
export PATH=$HOME/.sst/bin:$PATH
# opencode
export PATH=$HOME/.opencode/bin:$PATH
# Added by Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$PATH"
# asdf (node versions)
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
# General
export PATH="$HOME/.local/bin:$PATH"
export PATH="~/bin:$PATH"

# Place configuration that only needs to happen on work laptop in here
source ~/.flo-zsh

# Exports
export EDITOR='nvim'

# Aliases

# Directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias dots="cd ~/.dotfiles/"

# ls replacement with eza
alias ls="eza"
alias ll="eza -l"
alias la="eza -la"
alias lt="eza --tree"

# File operations
alias cp="cp -v"
alias ddf="df -h"
alias etc="erd -H"
alias mkdir="mkdir -p"
alias mv="mv -v"
alias rm="rm -v"

# Utilities
alias vim="nvim"
alias cdi="zi"

# Git aliases
alias gaa="git add -A"
alias ga="git add"
alias gbd="git branch --delete"
alias gb="git branch"
alias gc="git commit"
alias gcm="git commit -m"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log"
alias gp="git push"
alias gph="git push -u origin HEAD"
alias gs="git status"
alias gst="git stash"
alias gstp="git stash pop"

# Other
alias p="pnpm"
alias claude="/Users/michael.vessia/.claude/local/claude"

# Functions

# Extract archive
extract() {
    case "$1" in
        *.tar.bz2) tar xjf "$1" ;;
        *.tar.gz)  tar xzf "$1" ;;
        *.bz2)     bunzip2 "$1" ;;
        *.rar)     unrar e "$1" ;;
        *.gz)      gunzip "$1" ;;
        *.tar)     tar xf "$1" ;;
        *.tbz2)    tar xjf "$1" ;;
        *.tgz)     tar xzf "$1" ;;
        *.zip)     unzip "$1" ;;
        *.Z)       uncompress "$1" ;;
        *.7z)      7z x "$1" ;;
        *)         echo "unknown extension: $1" ;;
    esac
}

# Extract to directory
extracttodir() {
    case "$1" in
        *.tar.bz2) tar -xjf "$1" -C "$2" ;;
        *.tar.gz)  tar -xzf "$1" -C "$2" ;;
        *.rar)     unrar x "$1" "$2/" ;;
        *.tar)     tar -xf "$1" -C "$2" ;;
        *.tbz2)    tar -xjf "$1" -C "$2" ;;
        *.tgz)     tar -xzf "$1" -C "$2" ;;
        *.zip)     unzip "$1" -d "$2" ;;
        *.7z)      7za e -y "$1" -o"$2" ;;
        *)         echo "unknown extension: $1" ;;
    esac
}

# List files matching pattern
lsr() {
    ls | rg -i "$1"
}

# Make directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Count files
num() {
    ls -1 "$@" | wc -l
}

# Wget wrapper
wg() {
    if [ $# -eq 1 ]; then
        wget -c "$1"
    elif [ $# -eq 2 ]; then
        # arg1 = name, arg2 = url
        wget -c -O "$1" "$2"
    else
        echo "Incorrect number of arguments"
    fi
}

# FZF Configuration
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {} 2>/dev/null || echo {}'"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always {} 2>/dev/null || echo {}'"

# Source fzf if installed
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zoxide Configuration
eval "$(zoxide init zsh --cmd cd)"

# Atuin Configuration
eval "$(atuin init zsh)"
