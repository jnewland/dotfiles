echo "dotfiles greetings" 
echo "enabling real-time bash history..."

shopt -s histappend
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
