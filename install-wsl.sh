
#!/usr/bin/env sh
# ---------------------------------
# Quiet Installation/Update for Debian Based Linux Distro
# ---------------------------------
echo "---------------------------------------------------------------------"
echo "|                       Installing Linux!                           |"
echo "---------------------------------------------------------------------"
echo "> Updating Apt and installing wget and build-essential..."
sudo apt-get -qq update
sudo apt-get -qq install curl wget git build-essential > /dev/null

echo "> Installing Neovim..."
sudo apt install -y neovim > /dev/null 2>&1 

echo "> RipGrep for maximum grep power..."
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb > /dev/null 2>&1
sudo dpkg -i ripgrep_11.0.1_amd64.deb > /dev/null 2>&1
rm ripgrep_11.0.1_amd64.deb

echo "> RCM for dotfile management... Say OK..."
wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list > /dev/null 2>&1
sudo apt-get -qq update
sudo apt-get -qq install rcm
