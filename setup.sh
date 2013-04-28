#! /bin/sh

# ref. https://gist.github.com/kaosf/5471662
echo 'export PATH=$HOME/local/bin:$PATH' >> $HOME/.zshenv # or .bashrc
exec $SHELL
mkdir -p $HOME/local/bin
cd $HOME/local/bin
git clone https://github.com/mxcl/homebrew --depth 1
ln -s $HOME/local/bin/homebrew/bin/brew

# GCC
echo 'export PATH=$HOME/local/bin/homebrew/Library/ENV/4.3:$PATH' >> $HOME/.zshenv # or .bashrc
exec $SHELL

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
echo 'eval "$(rbenv init -)"' >> $HOME/.zshenv # or .bashrc
exec $SHELL
brew install ruby-build

RUBY_CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-openssl-dir=`brew --prefix openssl`" rbenv install 2.0.0-p0
