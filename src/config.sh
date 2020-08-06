cd mylive-test
echo "#!/bin/bash

set -e


#add your mirror
custom_os="http://debianmirror.nkn.in/debian"
dist="buster"

lb config noauto \
     --architectures amd64 \
     --archive-areas "main contrib non-free" \
     --interactive shell \
     --debian-installer true  \
     --debian-installer-gui true \
     --mirror-bootstrap "$custom_os" \
     --mirror-debian-installer "$custom_os" \
     --distribution "$dist" \
     --debian-installer-distribution "$dist" \
     --iso-application "custom-os" \
     --iso-publisher "mvs" \
     --iso-volume "custom-os Desktop" \
     --security false \
     --updates true \
     --memtest memtest86 \
	"${@}"
" >> auto/config

cd ..
