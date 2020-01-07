# Install NetworkManager for wifi support
# sudo xbps-install -S NetworkManager

sudo cp ./setup/00-repository-main.conf /etc/xbps.d/
sudo cp ./setup/10-repository-nonfree.conf /etc/xbps.d/

# sync
sudo xbps-install -Sy
# will likely update xbps
sudo xbps-install -Syu
# then update packages
sudo xbps-install -Syu

sudo xbps-install -Sy git zsh neovim rcm tmux ripgrep exa alacritty docker htop docker-compose which curl python3 python3-neovim xclip ranger bspwm sxhkd xorg picom firefox google-fonts-ttf font-symbola alsa-utils pulseaudio gst-libav polybar feh ImageMagick

# Dont forget to set helvetica in firefox for smoother fonts

# If an application needs alsa directly - add alsa-plugins-pulseaudio
# link the dbus for pulseaudio
ln -s /etc/sv/dbus /var/service

mkdir ~/.fonts
curl -L https://github.com/microsoft/cascadia-code/releases/download/v1911.21/Cascadia.ttf > ~/.fonts/Cascadia.ttf
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
ln -s /etc/sv/docker /var/service/

rcup

chsh -s $(which zsh)

# Install Graphics Driver
# Intel && intel media stuff
# xbps-install -S mesa-dri intel-video-accel
