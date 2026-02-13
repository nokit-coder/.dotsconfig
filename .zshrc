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
bindkey -r '^d'

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

# ========== IMPORT ==========
source ~/.zfunc/*
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# ========== SETTINGS ==========
export XDG_PICTURES_DIR='$HOME/Pictures/'
export EDITOR='nvim'
stty eof undef

# ========== ALIASES ==========
# ===== redefenition =====
alias ls='lsd -lv --color=always --git --gitsort'
alias lls='lsd -v --color=always'
alias la='lsd -laAv --color=always --git --gitsort'
alias lla='lsd -vaA --color=always'
alias tree='lsd --tree --color=always --git --gitsort --ignore-glob=.git'
alias less='less -r'
alias cd='z'
# ===== new =====
alias fim='nvim $(fzf +x)'
alias cl='clear'
alias vi='nvim'
alias tch='touch'

# ========== EXT ALIASES ==========
alias -s 'py=python'
alias -s 'cpp=g++'
alias -s 'c=g++'
alias -s 'pdf=zathura'
alias -s 'gz=tar -xf'
alias -s 'bz2=bzip2 -d'
alias -s 'tar=tar -xf'
alias -s 'sh=zsh'
alias -s 'md=glow'

alias -s 'json=$EDITOR'
alias -s 'jsonc=$EDITOR'

# ========== AUTOCOMPLETION ==========



# ========== PROMPT ==========
# cfg=$'\e[38;5;189m'
# cbg=$'\e[48;5;235m'
# cfbg=$'\e[38;5;235m'
# caccent=$'\e[38;5;174m'
#
# # -----modules-----
# # user
# cuser=$'\e[38;5;152m'
# # path
# cpath=$'\e[38;5;180m'
# # git
# cbrnch=$'\e[38;5;150m'
# cbrnch_r=$'\e[38;5;203m'
# cbrnch_d=$'\e[38;5;211m'
# cbrnch_a=$'\e[38;5;185m'
# cbrnch_h=$'\e[38;5;208m'
# # hz
# cdir=$'\e[38;5;150m'
# # separator
# csep=$'\e[1;38;5;146m'
#
# cr=$'\e[0m'
#
# __path_prompt() {
# 	local dir=${$(pwd)/$home/'🏠︎ '}
# 	echo -n "$dir "
# }
#
# __git_prompt() {
# 	local branch=$(git branch 2>/dev/null | grep "*" | awk '{print $2}')
# 	local gstatus=$(git status -sb 2>/dev/null)
#
# 	[ -z "${gstatus}" ] && return
#
# 	local ahd=$([ -n "$(echo "$gstatus" | head -n1 | grep "ahead")" ] && echo true || echo false)
# 	local beh=$([ -n "$(echo "$gstatus" | head -n1 | grep "behind")" ] && echo true || echo false)
# 	local remote=$([ -n "$(echo "$gstatus" | head -n1 | grep "##")" ] && echo true || echo false)
# 	local detached=$([ -n "$(echo "$gstatus" | head -n1 | grep "head")" ] && echo true || echo false)
#
# 	echo -n "%{"
# 	if $remote; then
# 		if $detached; then
# 			echo -n "${cbrnch_d}"
# 		else
# 			if $beh || $ahd; then
# 				$ahd && echo -n "${cbrnch_a}"
# 				$beh && echo -n "${cbrnch_h}"
# 			else
# 				echo -n "${cbrnch}"
# 			fi
# 		fi
# 	else
# 		echo -n "${cbrnch_r}"
# 	fi
#
# 	echo -n "%} "
# 	echo -n "%{${cbrnch}%}${branch}"
# 	echo -n " "
# }
#
# __prompt_generator() {
# 	local path_part=$(__path_prompt)
# 	local git_part=$(__git_prompt)
#
# 	export PS1="%{${cbg}${cfg}%} %{${cuser}${cbg}%}%n%{${csep}%} ❯ %{${cpath}%}${path_part}${git_part}%{${cr}${cfbg}%}%{${cr}%} "
# }
#
# add-zsh-hook precmd __prompt_generator

# ========== PATH ==========

# export path='$path:$home/.zfunc'
path+=("$HOME/.local/bin/")
export path

# ========== START ==========
fastfetch
