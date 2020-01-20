#! /bin/sh

# Install Xcode

# Install "Command Line Tools for Xcode"
# Open Xcode > Xcode > Open Developer Tool > More Developer Tools...

PROFILE=$HOME/.zshenv
#PROFILE=$HOME/.profile

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install zsh and set to default
brew install zsh
chsh -s /bin/zsh

# coreutils
brew install coreutils
echo 'PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"' >> $PROFILE
echo 'MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"' >> $PROFILE

# findutils
brew install findutils
ln -s $HOME/local/bin/gxargs $HOME/local/bin/xargs

# gnu-sed
brew install gnu-sed

# Install some applications
brew install git tmux wget

# Install tig
brew install homebrew/dupes/ncurses
brew link ncurses --force --overwrite
brew install tig
# For Japanese font
echo 'export LANG=en_US.UTF-8' >> ~/.bash_profile
echo 'export LANG=en_US.UTF-8' >> ~/.zshenv
# ref. http://www.lancard.com/blog/2012/02/08/cui-%E3%81%AA-git-%E3%83%96%E3%83%A9%E3%82%A6%E3%82%B6-tig-%E3%82%92-homebrew-%E3%81%A7%E5%85%A5%E3%82%8C%E3%81%A6%E3%81%BF%E3%81%9F/

# for pip and Python
# ref. http://conta.hatenablog.com/entry/2012/01/07/161026
brew install python
echo 'export PATH="$(brew --prefix python)/bin:$PATH"' >> $PROFILE

# Vim 7.4
# ref. http://qiita.com/peroon/items/57bf22c0e32236752c5d
brew install vim --devel --with-lua
echo 'alias vim=/usr/local/bin/vim' >> $PROFILE
if [ ! -d $HOME/.vim/bundle ]
then
  mkdir -p $HOME/.vim/bundle
fi
if [ ! -d $HOME/.vim/bundle/neobundle.vim ]
then
  git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
fi
git config --global core.editor /usr/local/bin/vim

# golang
brew install go

# peco
# ref. https://github.com/peco/peco#mac-os-x--homebrew
brew tap peco/peco
brew install peco

# anyenv
brew install anyenv
echo 'eval "$(anyenv init -)"' >> $PROFILE

# Ruby
anyenv install rbenv
rbenv install 2.7.0

# Node.js
anyenv install nodenv
nodenv install v13.6.0

# Yarn
brew install yarn
