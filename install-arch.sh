# Install NetworkManager for wifi support
# sudo xbps-install -S NetworkManager

# sync
sudo pacman -Syu

sudo pacman -Sy git base-devel zsh neovim tmux ripgrep exa alacritty docker htop docker-compose which curl python-neovim python3 xclip ranger bspwm sxhkd firefox polybar feh imagemagick

sudo pip3 install neovim
# Dont forget to set helvetica in firefox for smoother fonts

mkdir ~/.local/share/fonts
curl -L https://github.com/microsoft/cascadia-code/releases/download/v1911.21/Cascadia.ttf > ~/.local/share/fonts/Cascadia.ttf
fc-cache -fv

# if bluetooth is needed
# sudo xbps-install -S bluez
# ln -s /etc/sv/bluetoothd /var/service
# usermod -a -G bluetooth $USER
# sv restart dbus

# Hides bitmaps, so things look nice in browser
# sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6

mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo usermod -aG docker $(whoami)

# start docker
systemctl enable docker && systemctl start docker

cd /tmp/
git clone https://aur.archlinux.org/rcm.git
cd rcm
makepkg -si


echo 'install shell with chsh -s $(which zsh)'
echo "dont forget to rcup"

# Install Graphics Driver
# Intel && intel media stuff
# xbps-install -S mesa-dri intel-video-accel

# STEAM
# If you're installing void - you need to enable dbus via
