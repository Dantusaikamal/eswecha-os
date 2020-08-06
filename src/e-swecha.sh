sudo apt install live-build
sudo apt install xorriso
mkdir mylive-test
cd mylive-test
lb config
touch auto/config
cd ..
sh config.sh
sh my-chroot-list.sh
cd mylive-test
mkdir config/includes.chroot/opt/

sudo lb build 2>&1 | tee build.log
