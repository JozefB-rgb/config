#...

#Multi-level cd undo:
cd() {
  builtin cd "$@" && [ "$OLDPWD" != "$PWD" ] && _cd_hist+=("$OLDPWD")
}

b() {   #cd back
  local n=${1:-1}
  while (( n-- > 0 && ${#_cd_hist[@]} > 0 )); do
    builtin cd "${_cd_hist[-1]}" || return
    unset '_cd_hist[-1]'
  done
  pwd
}

alias ppe='python3'
alias op='xdg-open .'
alias c='clear'
alias q='cd ..'
alias qq='cd ../..'
alias qqq='cd ../../..'
alias e='pwd'

