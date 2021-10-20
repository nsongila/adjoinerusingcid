#!/bin/bash
# CID (Closed In Directory) was written by Eduardo Moraes and his email address is: emoraes25@outlook.com
# Please donate to support his work and effort.
# It is a useful tool.
# I wrote this small script and added CID (Closed In Directory)
# Please share it and improve it if you can.
# Author: Patrick Nsongila
# October 10 2021
# (C) Concepta BizNet
# www.concepta-biz.net
# Contact: +353872821070
# Please run the script as root or sudo user
# We How to Hide All The User Accounts in Login Screen because it is a shared computer for security reasons
# This script will run for Debian/Ubuntu and Redhat/Fedora
function debianbase()
	{
	sudo apt update
	sudo apt upgrade
	sudo apt install resolvconf
	# Changing the computer name
		#Assign existing hostname to hostn
		hostn=(cat /etc/hostname)

		#Display existing hostname
		echo "Existing hostname is hostn"

		#Ask for new hostname newhost
		echo "Enter new hostname: "
		read newhost

		#change hostname in /etc/hosts & /etc/hostname
		sudo sed -i "s/hostn/$newhost/g" /etc/hosts
		sudo sed -i "s/hostn/$newhost/g" /etc/hostname

		#display new hostname
		echo "Your new hostname is newhost"
		# 192.168.1.253 is my AD IP, please replace it with your own information IP Address
		echo "Now Changing your DNS to 192.168.1.253, AD IP address"
		# add DNS name server to my AD
		# 192.168.1.253 is my AD IP, please replace it with your own information
		echo "nameserver 192.168.1.253" >> /etc/resolvconf/resolv.conf.d/head
		# Restart the resolvconf service.

		sudo service resolvconf restart
	sudo apt install acl attr cifs-utils cups-client cups-daemon iproute2 iputils-ping keyutils krb5-user libnss-winbind libpam-mount libpam-winbind passwd policykit-1 samba samba-common-bin samba-dsdb-modules samba-vfs-modules smbclient sudo systemd x11-xserver-utils zenity
	 ver=1.1.6
	 wget http://downloads.sf.net/c-i-d/cid-{ver}.tar.gz    
	 tar -xzf cid-{ver}.tar.gz
	 cd cid-{ver}
	 sudo ./INSTALL.sh
	 sudo cid-gtk 

	}
function ubuntu_mint_zor()
	{
        	
		# Updating OS first
		sudo apt update
		# Trying upgrading
		sudo apt upgrade
		#Allows you to ssh in to support the system.... as root

		#Install the resolvconf package for DNS change
		sudo apt install resolvconf

		# Changing the computer name
		#Assign existing hostname to hostn
		hostn=(cat /etc/hostname)

		#Display existing hostname
		echo "Existing hostname is hostn"

		#Ask for new hostname newhost
		echo "Enter new hostname: "
		read newhost

		#change hostname in /etc/hosts & /etc/hostname
		sudo sed -i "s/hostn/$newhost/g" /etc/hosts
		sudo sed -i "s/hostn/$newhost/g" /etc/hostname

		#display new hostname
		echo "Your new hostname is newhost"
		# 192.168.1.253 is my AD IP, please replace it with your own information IP Address
		echo "Now Changing your DNS to 192.168.1.253, AD IP address"
		# add DNS name server to my AD
		# 192.168.1.253 is my AD IP, please replace it with your own information
		echo "nameserver 192.168.1.253" >> /etc/resolvconf/resolv.conf.d/head
		# Restart the resolvconf service.

		sudo service resolvconf restart
		# This scrip will help you install CID (Closed In Directory)
		#CID (Closed In Directory) is a set of bash scripts for inserting and managing Linux computers in "Active Directory" domains. Modifications made to the system allow Linux to behave like a 		Windows computer within AD.
		sudo add-apt-repository ppa:emoraes25/cid
		sudo apt update
		sudo apt install cid cid-gtk
		clear 
		echo "Samba4/AD Joiner installation completed"
		# Now running CID (Closed In Directory) to allow you to join AD/Samba4
		echo "Please reboot the computer and run sudo cid-gtk to join the DOMAIN"
		# sudo cid-gtk 
		
	}
	
function fedora_rhel()
	{
		# Updating OS first
		sudo dnf update
		# Trying upgrading
		sudo dnf upgrade --refresh
		#Allows you to ssh in to support the system.... as root

		# add DNS name server to my AD
		# 192.168.1.253 is my AD IP, please replace it with your own information
		echo "DNS=192.168.1.253" >> /etc/systemd/resolved.conf
		# Restart the resolvconf service.
		sudo systemctl restart systemd-resolved.service
		#changing the hostname 
		hostn=(cat /etc/hostname)
		#Display existing hostname
		echo "Your existing computer name is : $hostn"
		echo "					"
		echo "Enter a new computer name : "
		read newhost
		echo "Please wait while we are changing your computer name to : $newhost"
		nmcli general hostname $newhost
		echo "Congratulations !!!!!!, your computer name is changed now to newhost"
		echo "Your new hostname is newhost"
		# CID (Closed In Directory)  Requirements below: 
		# installing the requirements for joining the Domain

		dnf install acl attr cifs-utils cups cups-client gvfs-smb iproute iputils keyutils krb5-workstation pam_mount samba samba-client samba-winbind samba-winbind-clients shadow-utils sudo systemd xhost zenity

		# CID (Closed In Directory)  installation
		# This scrip will help you install CID (Closed In Directory)
		#CID (Closed In Directory) is a set of bash scripts for inserting and managing Linux computers in "Active Directory" domains. Modifications made to the system allow Linux to behave like a 		Windows computer within AD.
		ver=1.1.6
		wget http://downloads.sf.net/c-i-d/cid-{ver}.tar.gz    
		tar -xzf cid-{ver}.tar.gz
		cd cid-{ver}
		sudo ./INSTALL.sh
		clear 
		echo "Samba4/AD Joiner installation completed"
		# Now running CID (Closed In Directory) to allow you to join AD/Samba4
		echo "Please reboot the computer and run sudo cid-gtk to join the DOMAIN"
		# sudo cid-gtk 
	}

function otherdistros()
	{
	  echo -n "Installing only CID, please make sure you added already your DNS IP and you named your computer based on your organisation Naming convetion"
    	  echo
          echo "Now installing CID for you."
          
          ver=1.1.6
 	  wget http://downloads.sf.net/c-i-d/cid-{ver}.tar.gz    
	  tar -xzf cid-{ver}.tar.gz
	  cd cid-{ver}
          sudo ./INSTALL.sh
          sudo cid-gtk 
	}
# Hide all usernames from the Logon page on gnome:
	xhost SI:localuser:gdm
	sudo -u gdm gsettings set org.gnome.login-screen disable-user-list true
        echo "================================================================"
        echo "#                                                               #"
        echo "#   CID (Closed In Directory) written by  Eduardo Moraes        #"
        echo "#   His email emoraes25@outlook.com                             #"
        echo "#   Please donate to support his work and effort                #"
        echo "#   This script is written by Patrick Nsongila                  #"
        echo "#   www.concepta-biz.net & +353 872821070                       #"
        echo "#   This script allows you:                                     #"
        echo "#     1. Change the computer name                               #"
        echo "#     2. Add your DNS IP                                        #"
        echo "#     3. Install CID on your Debian or Fedora Based Linux       #"  
        echo "#     4. Run CID in a user-friendly manner                      #" 
        echo "#                                                               #"      
        echo "================================================================"
	echo
	echo "1. Ubuntu Based Distribution"
	echo "2. Fedora Based Distribution"
	echo "3. Debian Based Distribution"
	echo "Any key for other distributions not based on Debian or Redhat and press Enter"
	echo
	echo "Enter your choice"
	read distro
	
case $distro in
    "1")
        ubuntu_mint_zor
        echo ;;
    "2")
        fedora_rhel
        echo ;;
    "3")
        debianbase
        echo ;;
     * )
        otherdistros
        echo ;; 
esac	

