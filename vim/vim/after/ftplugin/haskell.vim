" -t <name-of-session>:<name-of-window>.<number-of-pane>
au BufWritePost Scratch.hs :call system("tmux send-keys -t 0:0.1 :l \"Space\" Scratch.hs \"Enter\"")
