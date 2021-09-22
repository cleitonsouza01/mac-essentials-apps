#!/bin/bash

##############################################################################
# Install system packages                                                    #
##############################################################################
echo
echo -e "*** ESSENTIALS PACKAGE INSTALLATION SCRIPT ***"
echo
read -r -p "This will install many essentials apps Continue? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        echo Starting...
        ;;
    *)
        echo Aborting...
        exit 1
        ;;
esac


xcode-select --install
echo Follow xcode installation screen then back here and hit return to Continue
pause
pause


# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install extra taps
brew tap caskroom/fonts
brew tap neovim/neovim

# install core tools 
brew install p7zip
brew install htop
brew install gpg
brew install pwgen
brew install tree
brew install git
brew install git-cola

# install tools 
brew install youtube-dl 
brew install ffmpeg
brew install ack
brew install autojump
brew install ctags
brew install hadolint
brew install neovim
brew install pandoc
brew install pyenv
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper
brew install shellcheck
brew install the_silver_searcher
brew install thefuck
brew install tmux
brew install tmate
brew install xz

# install zsh and plugins
brew install zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# install GUI utilities
brew install firefox
brew install font-fira-code
brew install google-chrome
brew install google-drive
brew install ibettercharge
brew install iterm2
brew install keybase
brew install markright
brew install obs
brew install spotify
brew install telegram
brew install torbrowser
brew install zoomus
brew install visual-studio-code
brew install open-in-code
brew install xmind
brew install macpass
brew install notion
brew install evernote
brew install sublime
brew install kindle
brew install send-to-kindle

# clean up
brew cleanup -s
brew cask cleanup
brew prune
rm -rfv `brew --cache`

##############################################################################
# Install Python 3 via pyenv                                                 #
##############################################################################

eval "$(pyenv init - bash)"
pyenv install 3.9.6
pyenv install 2.7.18
pyenv global 3.9.6

##############################################################################
# Install pip packages                                                       #
##############################################################################

python -m pip install getgist
python -m pip install ipython
python -m pip install pipenv
python -m pip install proselint
python -m pip install vim-vint
python -m pip install virtualenv
python -m pip install virtualenvwrapper
python -m pip install yamllint

##############################################################################
# Install oh-my-zsh                                                          #
##############################################################################

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

##############################################################################
# Dotfiles                                                                   #
##############################################################################

export GETGIST_USER=`whoami`
cd ~
getmy .vimrc -y
getmy .gitconfig -y
getmy .gitignore_global -y
getmy .bash_profile -y
getmy .zshrc -y
getmy .profile -y
#ln -s ~/.vim ~/.config/nvim
#ln -s ~/.vimrc ~/.config/nvim/init.vim
