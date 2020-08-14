sudo apt install live-build
sudo apt install xorriso
mkdir eswecha
cd eswecha
lb config -b iso --cache true --apt-recommends true -a amd64 --binary-images iso --debian-installer live --linux-flavours amd64 --mode debian --debian-installer-gui true --archive-areas "main contrib non-free" --security true --win32-loader false --interactive shell --updates true
lb build
sudo apt install task-gnome-desktop
sudo apt install build-essential debian-installer-launcher git iputils-ping gparted lvm2 htop sudo net-tools cryptsetup encfs gpg gnupg curl ufw openssh-server software-properties-common apt-transport-https devscripts wget vim emacs apache2  python3-pip kwin-addons gimp kdenlive vlc
cd ~


