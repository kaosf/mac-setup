#! /bin/sh

# Install Xcode

# Install "Command Line Tools for Xcode"
# Open Xcode > Xcode > Open Developer Tool > More Developer Tools...

PROFILE=$HOME/.zshenv
#PROFILE=$HOME/.profile

# Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# coreutils
brew install coreutils
echo 'PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"' >> $PROFILE
echo 'MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"' >> $PROFILE

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
echo 'eval "$(rbenv init -)"' >> $PROFILE
exec $SHELL
brew install ruby-build

rbenv install 2.1.4

# for pip and Python
# ref. http://conta.hatenablog.com/entry/2012/01/07/161026
brew install python
echo 'export PATH="$(brew --prefix python)/bin:$PATH"' >> $PROFILE

# Vim 7.4
# ref. http://qiita.com/peroon/items/57bf22c0e32236752c5d
brew install vim --devel --with-lua
if [ ! -d $HOME/.vim/bundle ]
then
  mkdir -p $HOME/.vim/bundle
fi
if [ ! -d $HOME/.vim/bundle/neobundle.vim ]
then
  git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
fi
git config --global core.editor /usr/local/bin/vim
