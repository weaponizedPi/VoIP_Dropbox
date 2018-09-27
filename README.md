# VoIP_Dropbox
VoIP Dropbox config files

The following config files are provided to reproduce the VoIP Dropbox attack detailed in CactusCon's 2018 talk "Weaponizing Your Pi". Most of the tools used are standard on Kali. 

# Requirements
- Kali Linux for Raspberry Pi Zer0 W - https://images.offensive-security.com/arm-images/kali-linux-2018.3-rpi0w-nexmon.img.xz
- Cisco Lockbox With Key - https://www.amazon.com/Cisco-Locking-Wallmount-7900-Phones/dp/B000H34VKU
- USB Ethernet adapter - https://www.amazon.com/Plugable-Micro-B-Ethernet-Raspberry-AX88772A/dp/B00RM3KXAU
- USB POE Adapter - https://www.amazon.com/UCTRONICS-802-3af-Splitter-Ethernet-Raspberry/dp/B01MDLUSE7
- Hostapd - apt-get install hostapd

# Config

- hostapd.conf

   This is the configuration file used to create the accesspoint after boot. ssid=test and it uses WPA2 encryption, wpa_passphrase=testtest .. change as needed.  Also, I configured the AP to not broadcast the access point by setting ignore_broadcast_ssid=0. 
   
- Startup.sh

  This file will be called by /etc/rc.local during boot and will do the following things: 
  1. Disable network-manager
  2. Create a mon0 interface required for hostapd to run on the PiZeroW (dont ask me why...) 
  3. setup the wlan0 interface with IP 192.168.1.1
  4. Execute hostapd with hostapd.conf file above. 
  
  
# Boot

Update /etc/rc.local to point to the /root/startup.sh using: */bin/sh /root/startup.sh* 

Once booted, you will need to add the wireless network to your connecting device, since we are not broadcasting the device and configure the IP to be static, try 192.168.1.2. After connecting to the AP, ping 192.168.1.1 and attempt to SSH to your PiZero. 
 
