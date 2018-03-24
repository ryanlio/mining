



INSTALL SCRIPT SETUP.sh

sudo mkdir mining

create file 
sudo nano ./mlsetup.sh

********************* copy paste below

#!/bin/bash

#

# Do a Desktop GUI and NV driver setup on top of Ubuntu server

#

##############

# VARIABLES: #

##############

# DESKTOP -- Ubuntu desktop to install

# ubuntu-desktop

# kubuntu-desktop

# ubuntu-gnome-desktop

# ubuntu-mate-desktop

# xubuntu-desktop 

# DESKTOP='ubuntu-mate-desktop'



# NVDRIVER -- NVIDIA driver version from ppa:graphics-drivers/ppa

NVDRIVER='nvidia-387'



# EXTRAS -- Extra packages (your taste may vary)

EXTRAS="build-essential dkms synaptic emacs ssh gdebi"



# Do system Updates

apt-get update

apt-get -y dist-upgrade



# Desktop environment install

# tasksel install $DESKTOP



# Extra programs

# apt-get install -y $EXTRAS 



# NVIDIA driver

add-apt-repository -y ppa:graphics-drivers/ppa

apt-get update

apt-get install -y $NVDRIVER



# Move manual network config that happened from server install to NetworkManager control

# This sed line comments out the primary nic interface 

# sed -i '/The primary network interface/,/^$/ s/^/#/' /etc/network/interfaces

# This line enables NetworkManager for everything

# sed -i 's/managed=false/managed=true/' /etc/NetworkManager/NetworkManager.conf


#end of script -- return 0

exit 0

************************ up till above ****************************

#run script

sudo bash ./mlsetup.sh


#Boot into console
sudo systemctl set-default multi-user.target

# Edit GRUB for bootup time to 3 sec
# sudo nano /etc/grub

# OTHERS1 - each GPU insert will change NIC interface
sudo lshw -C network
# look for NIC name, edit NIC interface
sudo nano /etc/network/interfaces


#REBOOT SERVER

sudo shutdown -r now

# GPUs and Desktop should be working
nvidia-smi

INSTALL DOCKER

wget -qO- https://get.docker.com/ | sh

sudo usermod -aG docker ryanlio



# Install Nvidia-Docker
** DO NOT USE THIS METHOD 1. USE METHOD 2
# If you have nvidia-docker 1.0 installed: we need to remove it and all existing GPU containers

sudo docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f

sudo apt-get purge -y nvidia-docker



# Add the package repositories

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -

curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu16.04/amd64/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update



# Install nvidia-docker2 and reload the Docker daemon configuration

#sudo apt-get install -y nvidia-docker2

#sudo pkill -SIGHUP dockerd

******
# METHOD 2

wget https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb

sudo dpkg -i nvidia-docker*.deb

sudo -b nohup nvidia-docker-plugin > /tmp/nvidia-docker.log
Enter Cntl+C

sudo apt-get install nvidia-modprobe





#REBOOT

#sudo shutdown -r now

# Test nvidia-smi with the latest official CUDA image

#nvidia-docker run --rm nvidia/cuda nvidia-smi





#Run Miner

#nvidia-docker run --name zcash -itd -e username=t1ZTjtBGMtc2xpDZkTJ5nSQVLfi4p4busXz.ml-xx servethehome/zec_flypool_ewbf:cuda


