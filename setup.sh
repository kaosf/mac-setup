#! /bin/sh

# ref. https://gist.github.com/kaosf/5471662
echo 'export PATH=$HOME/local/bin:$PATH' >> $HOME/.zshenv # or .bash_profile
exec $SHELL
mkdir -p $HOME/local/bin
cd $HOME/local/bin
git clone https://github.com/mxcl/homebrew --depth 1
ln -s $HOME/local/bin/homebrew/bin/brew

# GCC
echo 'export PATH=$HOME/local/bin/homebrew/Library/ENV/4.3:$PATH' >> $HOME/.zshenv # or .bash_profile
exec $SHELL

# coreutils
brew install coreutils
echo 'export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH' >> $HOME/.zshenv # or .bash_profile
exec $SHELL
ln -s $HOME/local/bin/gsed $HOME/local/bin/sed

# findutils
brew install findutils
ln -s $HOME/local/bin/gxargs $HOME/local/bin/xargs

# gnu-sed
brew install gnu-sed

# tig
brew install tig

# tmux
brew install tmux

# for Ruby
# ref.
#   http://qiita.com/items/05a09296f3633cadac3f
#   http://qiita.com/items/c70a8f65edb69bedfc37
#   http://qiita.com/items/12457815d5cee3723b97
brew install openssl curl-ca-bundle readline
cp \
 $HOME/local/bin/homebrew/Cellar/curl-ca-bundle/1.87/share/ca-bundle.crt \
 $HOME/local/etc/openssl/cert.pem

brew install rbenv
echo 'eval "$(rbenv init -)"' >> $HOME/.zshenv # or .bash_profile
exec $SHELL
brew install ruby-build

rbenv install 2.0.0-p0

# for pip and Python
# ref. http://conta.hatenablog.com/entry/2012/01/07/161026
brew install python
echo 'export PATH="$(brew --prefix python)/bin:$PATH"' >> .zshenv

# Vim 7.4
# ref. http://qiita.com/peroon/items/57bf22c0e32236752c5d
brew install vim --devel --with-lua
