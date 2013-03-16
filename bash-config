#############################################
#                                           #
#               ***     ***                 #
#             **   ** **   **               #
#            *       *       *              #
#            *               *              #
#             *             *               #
#              **         **                #
#                **     **                  #
#                  ** **                    #
#                    *                      #
#                                           #
#  ____       _ _        ____ _      _      #
# |  _ \ __ _(_) |___   / ___(_)_ __| |___  #
# | |_) / _` | | / __| | |  _| | '__| / __| #
# |  _ < (_| | | \__ \ | |_| | | |  | \__ \ #
# |_| \_\__,_|_|_|___/  \____|_|_|  |_|___/ #
#                                           #
#############################################

# Setup RBENV
#
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Standard UNIX file sorting
#
export LC_COLLATE=C

# Show last command's exit status
#
function check_exit_status() {
  local status="$?";
  local signal="";
  if [ ${status} -ne 0 -a ${status} != 128 ]; then
    if [ ${status} -gt 128 ]; then
      signal="$(builtin kill -l $((${status} - 128)) 2>/dev/null)";
      if [ "$signal" ]; then
        signal=" ($signal)";
      fi;
    fi;
    echo "[Exit ${status}${signal}]" 1>&2;
  fi;
  return 0
}
PROMPT_COMMAND='check_exit_status'

# Colorized and smarter less
#
export LESSOPEN='| /usr/bin/highlight -O ansi -q "%s"' # 2>/dev/null'
export LESS=-R

# Colorized grep
#
export GREP_COLOR=93
export GREP_OPTIONS='--color=auto'

# Setup aliases
#
alias la='l -a'
alias ll='ls -lFs'
alias l='ll'

alias ..='cd ..'
alias ...='cd ../..'

alias irb='pry'
alias Ruby='irb'

alias diff='colordiff -u'

# vim: ft=sh
