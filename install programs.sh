#!/bin/bash

## stow
sudo apt-get -y install stow

## dot files
rm .bashrc .profile
cd dotfiles
stow $(find . -maxdepth 1  -not -name "julia" -type d  -printf '%P\n')
cd

## base system
sudo apt-get -y install xorg i3 git neovim ranger htop bash-completion ncdu cmake gparted screen stow xarchiver csh xorg-dev dunst libnotify-bin

## tools
sudo apt-get -y install i3blocks inkscape gimp texlive-full zathura parallel pdftk imagemagick ffmpeg dcraw beets feh mpv r-base hdf5-tools bibtex2html taskwarrior mutt keepassx firefox-esr blueproximity tar transmission simplescreenrecorder jabref arandr npm awscli rsync

## diverse
sudo apt-get -y install mesa-utils libxrandr-dev libxinerama-dev libxcursor-dev libglfw3 ffmpegthumbnailer

## nvidia driver
sudo apt-get -y install nvidia-driver

## fuse
sudo apt-get -y install libfuse-dev fuse pkg-config 
# sudo vi /var/lib/dpkg/info/fuse.postins
# and changed line 34 from:
# udevadm test --action -p  $(udevadm info -q path -n /dev/fuse)
# to
# udevadm test --action add  $(udevadm info -q path -n /dev/fuse)

# ## borg ← does not work due to errors installing fuse...
sudo apt-get -y install python3 python3-dev python3-pip python-virtualenv libssl-dev openssl libacl1-dev libacl1 build-essential
sudo apt-get -y install borgbackup 

# udiskie
sudo apt-get -y install udiskie

## reveal-md
### try this first
sudo npm install -g reveal-md --unsafe-perm=true --allow-root
### otherwise, go for this:
# sudo npm install -g puppeteer reveal-md --unsafe-perm=true --allow-root

## dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
sudo ln -s ~/.dropbox-dist/dropboxd /usr/local/bin/dropbox

## nvim
nvim +PlugInstall +PlugUpdate +qall

## ranger
mkdir ~/.Trash

## julia 1.2
wget -c https://julialang-s3.julialang.org/bin/linux/x64/1.2/julia-1.2.0-linux-x86_64.tar.gz -O - | tar -xz -C /home/yakir/bin/
sudo ln -s /home/yakir/bin/julia-1.2.0/bin/julia /usr/local/bin/julia

### spawn julia, update it, thus creating the .julia folder
julia -e 'using Pkg; Pkg"up"; exit()'
cd dotfiles
### now that there is a julia folder we can add our configurations
stow julia

## julia 1.3
wget -c https://julialang-s3.julialang.org/bin/linux/x64/1.3/julia-1.3.0-rc1-linux-x86_64.tar.gz -O - | tar -xz -C /home/yakir/bin/
sudo ln -s /home/yakir/bin/julia-1.3.0-rc1/bin/julia /usr/local/bin/julia1.3

## firefox
### this kind of works, but I still need to go to settings in GUI firefox and change things.
firefoxsettings=$(find .mozilla/firefox/ -maxdepth 2 -name "*default*" -type d)
echo 'user_pref("browser.download.dir", "/home/yakir/downloads");' > $firefoxsettings/user.js
