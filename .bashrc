# shellcheck shell=bash
echo "shell configured with https://github.com/jnewland/dotfiles"

shopt -s histappend
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PATH="$HOME/bin:$PATH"