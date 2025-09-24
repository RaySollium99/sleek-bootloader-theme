# sleek-bootloader-theme
A sleek, simple GRUB Bootloader theme
Originally made by @sandesh236 (Techsan), modded by RaySollium99.

## Install

1. Clone this repository
```
git clone https://github.com/RaySollium99/sleek-bootloader-theme
```

2. Change directory into the cloned repo
``` 
cd sleek-bootloader-theme
```
3. Run the install script and follow the instructions
```
sudo ./install.sh
```

```
raysollium99@thinkpad:~/Projects/sleek-bootloader-theme$ sudo ./install.sh
[sudo] password for raysollium99:               
  
	          ****************************
	          *  Sleek Bootloader Theme  *
	          ****************************
 
  	 GRUB Theme by Techsan, modded by RaySollium99 
 
 
  Press ENTER to begin installation (Will automatically install after 10s)  :  

  
Checking for ROOT access... 
  
Checking for the existence of GRUB theme directory...
  
Installing Sleek theme...
 
Do you want to change the title text? 
[y/n]: y

Enter the text you want [GRUB Bootloader] : Ray's ThinkPad T480
  
Setting your text .......

Do you want to change the accent color? 
[y/n]: y

Enter the HEX color you want [#E41B21] : #E41B21

Setting your color .......
  
Setting Sleek as the Default Theme...
  
Finalizing the Installation .......
 
Updating GRUB Config...

	          ***********************************
	          *  Theme successfully installed!  *
	          ***********************************
```

## Uninstall

Run and follow the ``uninstall.sh`` script
```
sudo ./uninstall.sh
```

```
raysollium99@thinkpad:~/Projects/sleek-bootloader-theme$ sudo ./uninstall.sh
[sudo] password for raysollium99:               
  
	          ****************************
	          *  Sleek Bootloader Theme  *
	          ****************************
 
  	 GRUB Theme by Techsan, modded by RaySollium99 
 
 
  Press ENTER to begin uninstallation (Will automatically uninstall after 10s)  :  

  
Checking for ROOT access... 
  
Deleting Theme directory... 
  
Finalizing the Uninstallation....... 
Updating GRUB Config...

  
	          ******************************
	          *  Successfully uninstalled  *
	          ******************************
```