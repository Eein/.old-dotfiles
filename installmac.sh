# Install Homebrew and dependencies
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
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
brew install reattach-to-user-namespace

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

# Node Junk
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 8
nvm use --delete-prefix v8
nvm alias default 8
brew install yarn --without-node

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
