#! /bin/sh

# ref. https://gist.github.com/kaosf/5471662
echo 'export PATH=$HOME/local/bin:$PATH' >> $HOME/.zshenv # or .bashrc
exec $SHELL
mkdir -p $HOME/local/bin
cd $HOME/local/bin
git clone https://github.com/mxcl/homebrew --depth 1
ln -s $HOME/local/bin/homebrew/bin/brew

# coreutils
brew install coreutils
echo 'export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH' >> $HOME/.zshrc # or .bashrc
exec $SHELL

# findutils
brew install findutils

# gnu-sed
brew install gnu-sed

# tig
brew install tig
