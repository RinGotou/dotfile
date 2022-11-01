function tmux-attatch {
  if [ -z $1 ]; then
    script -c 'tmux a' /dev/null
  else
    script -c "tmux a -t $1" /dev/null
  fi
}

function tmux-new {
  if [ -z $1 ]; then
    script -c 'tmux new' /dev/null
  else
    script -c "tmux new -s $1" /dev/null
  fi
}
