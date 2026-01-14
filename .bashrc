#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# settings
export GTK_CSD=0
#cd ~

# ========== PROMT ==========
CFG="\e[38;5;189m"
CBG="\e[48;5;235m"
CFBG="\e[38;5;235m"
CACCENT="\e[38;5;174m"

# -----modules-----
# user
CUSER="\e[38;5;152m"
# path
CPATH="\e[38;5;180m"
# git
CBRNCH="\e[38;5;150m"
CBRNCH_R="\e[38;5;203m"
CBRNCH_D="\e[38;5;211m"
CBRNCH_A="\e[38;5;114m"
CBRNCH_H="\e[38;5;208m"
# hz
CDIR="\e[38;5;150m"
# separator
CSEP="\e[1;38;5;146m"

CR="\e[0m"

__path_prompt() {
    local dir=$(pwd)
    dir=${dir/$HOME/🏠︎ }
    echo -n "$dir "
}

__git_prompt() {
	local branch=$(git branch 2>/dev/null | grep "*" | awk '{print $2}')
	local status=$(git status -sb 2>/dev/null)
	
	[ -z "${branch}" ] && return
	
	local ahd=$([ -n "$(echo "$status" | head -n1 | grep "ahead")" ] && echo true || echo false)
	local beh=$([ -n "$(echo "$status" | head -n1 | grep "behind")" ] && echo true || echo false)
	local remote=$([ -n "$(echo "$status" | head -n1 | grep "\.\.\.")" ] && echo true || echo false)
	local detached=$([ -n "$(echo "$status" | head -n1 | grep "HEAD")" ] && echo true || echo false)
	local busy=$([ -n "$(echo "$status" | head -n1 | grep "MERGING|REBASE|CHERRY|bisect")" ] && echo true || echo false)
	
	local untracked=$([ -n "$(echo "$status" | grep '??')" ] && echo true || echo false)
	local staged=$([ -n "$(echo "$status" | grep '')" ] && echo true || echo false)
	local commit=$([ -n "$(echo "$status" | grep '')" ] && echo true || echo false)
	
	echo -n " "

	echo -n "\["
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
	
	echo -n "\] "
	echo -n "\[${CBRNCH}\]${branch}"
	echo -n " "
}

promt_generator() {
	PS1="\[${CBG}${CFG}\] \[${CUSER}${CBG}\]\u\[${CSEP}\] ❯ \[${CPATH}\]$(__path_prompt)$(__git_prompt)\[${CR}${CFBG}\]\[${CR}\] "
}

PROMPT_COMMAND=promt_generator

# ========== start ==========
fastfetch

# git account switch
source $HOME/.git-acc
