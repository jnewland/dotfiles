shopt -s histappend
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"