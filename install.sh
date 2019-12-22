
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
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
rm ripgrep_11.0.2_amd64.deb

echo "> Discord"
curl -LO https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb
sudo dpkg -i discord-0.0.9.deb
rm discord-0.0.9.deb

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

echo "> Vim Plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "> Exa"
curl -LO https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
unzip exa-linux-x86_64-0.9.0.zip
sudo mv exa-linux-x86_64 /usr/bin/exa
rm -rf exa-linux-x86_64 exa-linux-x86_64-0.9.0.zip

echo "> Alacritty"
sudo apt install -y alacritty

echo "> Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   disco \
   stable"
sudo apt remove -y docker docker-engine docker.io containerd runc
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -aG docker $(whoami)

echo "> pCloud"
curl -LO https://p-def4.pcloud.com/cBZetST9hZtTO10SZN17cZZQ8t3N7Z2ZZ670ZkZVcA5VZAkZJFZL5ZqZlJZ5XZX0Z2JZpFZ6JZ9XZG5Z5kZg5Z1EnhkZMbAYkQQx9nYFXmFYhrkXofOerol7/pcloud
chmod +x pcloud
./pcloud </dev/null &>/dev/null &
rm pcloud

echo ">> LOG OUT AND IN FOR pCLOUD"

echo "> RCUP Dotfiles"
rcup

echo "> Changing shell to zsh"
chsh -s $(which zsh)
