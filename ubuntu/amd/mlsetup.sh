#! /bin/bash

sudo apt update
ssudo apt upgrade

sudo apt install ocl-icd-opencl-dev

#Create a new usergroup called video and append the current user to it by typing the following:
sudo usermod -a -G video $LOGNAME

sudo reboot

#Install the AMD drivers by typing the following:
sudo mkdir ~/Downloads
cd ~/Downloads
sudo wget --referer=http://support.amd.com https://www2.ati.com/drivers/linux/ubuntu/amdgpu-pro-17.30-458935.tar.xz

sudo tar -Jxvf amdgpu-pro-17.30-458935.tar.xz

cd amdgpu-pro-17.30-458935

sudo ./amdgpu-pro-install -y

sudo ./amdgpu-pro-install --px

sudo reboot

#Test drivers are loaded and install by trying out mining

