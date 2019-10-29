# Install Homebrew and dependencies
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# install fonts
brew tap homebrew/cask-fonts && brew cask install font-cascadia
brew tap caskroom/fonts && brew cask install font-source-code-pro

# install zplugin
mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin

# asdf deps
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.4
brew install \
  coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl

# install term utils
brew tap thoughtbot/formulae && brew install rcm
brew install ripgrep
brew install neovim
brew install exa
brew install ranger
brew install zsh
brew cask install alacritty

# install apps
brew cask install discord
brew cask install visual-studio-code

# additional tasks
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

cd ~/.dotfiles
rcup

