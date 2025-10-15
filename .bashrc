# prompt

# colors for prompt
RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
BLUE='\[\e[0;34m\]'
MAGENTA='\[\e[0;35m\]'
CYAN='\[\e[0;36m\]'
RESET='\[\e[0m\]'
# colors for echo
E_RED='\e[0;31m'
E_GREEN='\e[0;32m'
E_YELLOW='\e[0;33m'
E_BLUE='\e[0;34m'
E_MAGENTA='\e[0;35m'
E_CYAN='\e[0;36m'
E_RESET='\e[0m'

# Git branch function
parse_git_branch() {
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$branch" ] && [ "$branch" != "HEAD" ]; then
    echo "${branch} "
  fi
}

PS1="\n${YELLOW}\$(parse_git_branch)${RESET}${MAGENTA}\w${RESET} ${CYAN}›${RESET} "

# Enable Git autocompletion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# aliases
alias ls='ls -a --color=auto'
alias gs='git status'
alias ga='git add'
alias gca='git commit -am'
alias gc='git checkout'
alias gb='git checkout -b'

gh() {
  echo -e "${E_RED}Switching to main branch and pulling latest changes...${E_RESET}"
  git checkout main && git pull
}

gbh() {
  gh
  echo -e "${E_RED}Creating and switching to new branch: ${E_CYAN}$1${E_RESET}"
  git checkout -b "$1"
}



# path problems for vscode
export PATH="/c/Program Files/Amazon/AWSCLIV2:$PATH"