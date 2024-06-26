# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vvetu/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vvetu/conda/etc/profile.d/conda.sh" ]; then
        . "/home/vvetu/conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/vvetu/conda/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/vvetu/conda/etc/profile.d/mamba.sh" ]; then
    . "/home/vvetu/conda/etc/profile.d/mamba.sh"
fi 
# <<< conda initialize <<<
# Check if conda os environment exist and activate it
if [ -d $HOME/conda/envs/os ]; then
  conda activate os
fi
