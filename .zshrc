# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=5000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nokit/.zshrc'

# ========== PLUGINS ==========
autoload -Uz compinit
autoload -Uz add-zsh-hook
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ========== BINDS ==========
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

# ========== IMPORT ==========
source ~/.zfunc/fzf.sh

# ========== ALIASES ==========
alias ls='lsd'
alias la='lsd -l'
alias tree='lsd --tree'

# ========== EXT ALIASES ==========
alias -s py=python
alias -s cpp=g++
alias -s pdf=zathura

# ========== AUTOCOMPLETION ==========



# ========== PROMT ==========
CFG=$'\e[38;5;189m'
CBG=$'\e[48;5;235m'
CFBG=$'\e[38;5;235m'
CACCENT=$'\e[38;5;174m'

# -----modules-----
# user
CUSER=$'\e[38;5;152m'
# path
CPATH=$'\e[38;5;180m'
# git
CBRNCH=$'\e[38;5;150m'
CBRNCH_R=$'\e[38;5;203m'
CBRNCH_D=$'\e[38;5;211m'
CBRNCH_A=$'\e[38;5;185m'
CBRNCH_H=$'\e[38;5;208m'
# hz
CDIR=$'\e[38;5;150m'
# separator
CSEP=$'\e[1;38;5;146m'

CR=$'\e[0m'

__path_prompt() {
    local dir=$(pwd)
    dir=${dir/$HOME/'🏠︎ '}
    echo -n "$dir "
}

__git_prompt() {
    local branch=$(git branch 2>/dev/null | grep "*" | awk '{print $2}')
    local gstatus=$(git status -sb 2>/dev/null)
    
    [ -z "${branch}" ] && return
    
    local ahd=$([ -n "$(echo "$gstatus" | head -n1 | grep "ahead")" ] && echo true || echo false)
    local beh=$([ -n "$(echo "$gstatus" | head -n1 | grep "behind")" ] && echo true || echo false)
    local remote=$([ -n "$(echo "$gstatus" | head -n1 | grep "\.\.\.")" ] && echo true || echo false)
    local detached=$([ -n "$(echo "$gstatus" | head -n1 | grep "HEAD")" ] && echo true || echo false)

    echo -n "%{"
    if $remote; then
        if $detached; then
            echo -n "${CBRNCH_D}"
        else
            if $beh || $ahd; then
                $ahd && echo -n "${CBRNCH_A}"
                $beh && echo -n "${CBRNCH_H}"
            else
                echo -n "${CBRNCH}"
            fi
        fi
    else
        echo -n "${CBRNCH_R}"
    fi
    
    echo -n "%} "
    echo -n "%{${CBRNCH}%}${branch}"
    echo -n " "
}

prompt_generator() {
    local path_part=$(__path_prompt)
    local git_part=$(__git_prompt)
    
    PS1="%{${CBG}${CFG}%} %{${CUSER}${CBG}%}%n%{${CSEP}%} ❯ %{${CPATH}%}${path_part}${git_part}%{${CR}${CFBG}%}%{${CR}%} "
}

add-zsh-hook precmd prompt_generator

# ========== PATH ==========

export PATH=$PATH:$HOME/.zfunc
export PATH=$PATH:$HOME/.local/bin/

# ========== start ==========
fastfetch
