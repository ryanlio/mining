
#!/bin/bash

tmux new-session -d -n MINER
#tmux send-keys -t MINER "cd mining/zec-miner-0.3.3b-ewbf" C-m
tmux send-keys -t MINER "sudo nvidia-smi -pm 1 && sudo nvidia-smi -pl 105 && docker start zcash" C-m
tmux send-keys -t MINER "<password>" C-m
#tmux send-keys -t MINER "sudo ./start.sh" C-m
