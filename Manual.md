Steps to create our E-Swecha OS:
There are 8 steps, 9 commands Involved. Follow the detailed steps and also go through the following links for better understanding:
I wrote this manual based on the following manual https://code.swecha.org/debian/debian-distribution-build
 

Step 1: Install Debian 10

Step 2: Install wifi drivers and neccessary drivers if not installed* 

Step 3: Install required tools: 
   
       Install live-build
       sudo apt install live-build

       Install xorriso
       sudo apt install xorriso

       Install virtualbox 
       Follow this process: https://linuxize.com/post/how-to-install-virtualbox-on-debian-10/

Step 4: Go through this documentation to get a clear idea of the tools we will be using: 
        https://code.swecha.org/debian/debian-distribution-build

step 5: Start building the OS

Go to terminal to enter the following commands. (Don't enter the explaination part which is in brackets. Also don't copy spaces. All the commands are numbered for better understanding)

1.  `mkdir mylive`
2.  `cd mylive`
3.  `lb config `

  (Explaination: mkdir mylive will create a folder named mylive. 
   cd mylive will change the current directory to the folder you just created.
   lb config: Using lb config creates the config/ subdirectory creates some configuration files,and two additional folders named auto/ and local/.)

4.  `nano auto/config `
  (Explaination: this will start reading for default settings. You will give the settings in the next line)

5. (Copy the complete command below and paste. Note:Even the slight mistake in copying or copying extra spaces will result in an error.)  
#!/bin/bash

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
     --iso-volume "custom-os Live" \
     --security false \
     --updates true \
     --memtest memtest86 \
	"${@}"
 
(Save and exit the terminal)
(Explaination: #!/bin/bash is a command that tells the system that this file is a set of commands that need to be executed. set -e will ignore errors and will go to next command incase it gets any errors.  If noauto \ is not used, infinite recursion will occur. The rest of the commands are neccessary for easy building of the OS.)

6. `nano config/package-lists/my.list.chroot`

(This creates a new file called nano config/package-lists/my.list.chroot for the OS)

Step 6: Install required packages 

7. (Copy the following text from top to bottom. The following listed applications we will install in the OS. Note: We will be adding more applications) 

task-kde-desktop
debian-installer-launcher
git
iputils-ping
gparted
lvm2
htop
sudo
net-tools
cryptsetup
encfs
gpg
gnupg
curl
ufw
openssh-server
software-properties-common
apt-transport-https
build-essential
devscripts
wget
vim
emacs
apache2
python3-pip
kwin-addons
gimp
kdenlive
blender
vlc
  
(save and exit the terminal)

(To download more applications, we will follow this next steps)

8.1 `mkdir config/includes.chroot/opt/`          (<---Steps numbered 8.1 and 8.2 are optional. You can directly proceed to step 9)
(This will create a folder named opt)

(Now if we want to install any more applications other than the above list, download the file from browser and enter the following command)

8.2 `cp ~/Downloads/filename config/includes.chroot/opt/ `

(For example, if you want to install aurdino software, go to https://www.arduino.cc/en/main/software and download the linux file. It will be downloaded with the name arduino-*.tar.xz. Now in terminal enter the following command: cp ~/Downloads/arduino-*.tar.xz config/includes.chroot/opt/ 
App will be installed :D )


Step 7: Build the final ISO image (go to the mylive home directory path and enter this command)

9. `sudo lb build 2>&1 | tee build.log`

(That's it. An iso image will be generated. But this step will take a lot of time! Note: Do NOT shut down the system in this step no matter how much time it takes. Estimated time is 3 hours depending on your RAM.) 

Step 8: Use Virtual machine to test the OS we created.

Install a virtual machine and now install our OS in it. If you face any errors, keep trying this process until we create the perfect OS :)
