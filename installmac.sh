# Install Homebrew and dependencies
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew tap caskroom/fonts && brew cask install font-source-code-pro
brew cask install iterm2
brew cask install discord
brew install rbenv
brew install ruby-build
brew install python
brew install nvm
brew install zsh
brew cask install slack
brew cask install deezer
brew cask install docker
brew cask install microsoft-office
brew install neovim
brew tap thoughtbot/formulae
brew install rcm
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install node@8
brew link node@8 --force
brew install yarn --without-node
brew install reattach-to-user-namespace

curl https://raw.githubusercontent.com/arcticicestudio/nord-iterm2/develop/src/xml/Nord.itermcolors > nord.itermcolors
# NVIM config
echo "Install Vim-Plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Dotfiles / Nvim config
echo "Getting Dotfiles"
git clone https://github.com/Eein/.dotfiles.git
rcup

# Create keys
if [ ! -f $HOME/.ssh/id_rsa ]; then
    echo "Creating SSH Key"
    ssh-keygen -t rsa -b 4096 -C "me@williamvolin.com" -f $HOME/.ssh/id_rsa -N ''
fi

# Install Neovim Helpers
pip3 install neovim
sudo gem install neovim

# Create Directories
mkdir ~/code
touch ~/.keys

echo "----------------------------------------------"
echo " Dont Forget:                                 "
echo " Install LastPass                             "
echo " Install OhMyZSH                              "
echo " :PlugInstall                                 "
echo " Update your SSH keys!       			            "
echo " Install Ruby 2.3.7          			            "
echo "----------------------------------------------"
