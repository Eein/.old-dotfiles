
#!/usr/bin/env sh
# ---------------------------------
# Quiet Installation/Update for Debian Based Linux Distro
# ---------------------------------
echo "---------------------------------------------------------------------"
echo "|                       Installing Linux!                           |"
echo "---------------------------------------------------------------------"
echo "> Updating Apt and installing wget and build-essential..."
sudo apt-get -qq update
sudo apt-get -qq install curl wget git build-essential

echo "> Installing Neovim..."
sudo apt install -y neovim

echo "> RipGrep for maximum grep power..."
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb
sudo dpkg -i ripgrep_11.0.1_amd64.deb
rm ripgrep_11.0.1_amd64.deb

echo "> RCM for dotfile management... Say OK..."
wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list > /dev/null
sudo apt-get -qq update
sudo apt-get -qq install rcm

echo "> ZSH"
sudo apt-get -qq install zsh

echo "> Zplugin"
mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin

echo "> ASDF"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.4

echo "> TMUX"
sudo apt-get -qq install tmux

echo "> Changing shell to zsh"
chsh -s $(which zsh)
