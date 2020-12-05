# PYTHONPATH was empty, so I give also the default one
PYTHONPATH=/usr/lib/python3.6:~/dev/accounts:~/dev/latex/latexrun:~/dev/helm
export PYTHONPATH

# add latexrun to the PATH, so vimtex can find it
PATH=$PATH:$HOME/dev/latex/latexrun

# use also the bashrc
if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc
fi

# search history with arrows
# arrow up
bind '"\e[A": history-search-backward'
# arrow down
bind '"\e[B": history-search-forward'
