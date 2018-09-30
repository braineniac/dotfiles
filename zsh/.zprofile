if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  numlockx & exec startx
fi
