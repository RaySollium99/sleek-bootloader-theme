#!/bin/bash
ROOT_UID=0
THEME_DIR="/usr/share/grub/themes"
THEME_NAME="sleek"
MAX_DELAY=20


# Colors

CDEF=" \033[0m"                                     # default color
CCIN=" \033[0;36m"                                  # info color
CGSC=" \033[0;32m"                                  # success color
CRER=" \033[0;31m"                                  # error color
CWAR=" \033[0;33m"                                  # warning color
b_CDEF=" \033[1;37m"                                # bold default color
b_CCIN=" \033[1;36m"                                # bold info color
b_CGSC=" \033[1;32m"                                # bold success color
b_CRER=" \033[1;31m"                                # bold error color
b_CWAR=" \033[1;33m"  



# Echo like ...  with  flag type  and display message  colors
prompt () {
  case ${1} in
    "-s"|"--success")
      echo -e "${b_CGSC}${@/-s/}${CDEF}";;          # print success message
    "-e"|"--error")
      echo -e "${b_CRER}${@/-e/}${CDEF}";;          # print error message
    "-w"|"--warning")
      echo -e "${b_CWAR}${@/-w/}${CDEF}";;          # print warning message
    "-i"|"--info")
      echo -e "${b_CCIN}${@/-i/}${CDEF}";;          # print info message
    *)
    echo -e "$@"
    ;;
  esac
}

# Welcome message
  prompt -s "\n\t          ****************************\n\t          *  Sleek Bootloader Theme  *\n\t          ****************************\n"
prompt -s "\t GRUB Theme by Techsan, modded by RaySollium99 \n \n"   


 

# Checking command availability
function has_command() {
  command -v $1 > /dev/null
}


prompt -i "Press ENTER to begin installation${CDEF}(Will automatically install after 10s) ${b_CWAR}:${CDEF}"
read -t10  

# Checking for ROOT access
prompt -w "\nChecking for ROOT access..."
if [ "$UID" -eq "$ROOT_UID" ]; then
  # Create themes directory if not exists
  prompt -i "\nChecking for the existence of GRUB theme directory..."
  [[ -d ${THEME_DIR}/${THEME_NAME} ]] && rm -rf ${THEME_DIR}/${THEME_NAME}
  mkdir -p "${THEME_DIR}/${THEME_NAME}" 



# Copy theme
  prompt -i "\nInstalling Sleek theme...\n"
  cp -a ${THEME_NAME}/* ${THEME_DIR}/${THEME_NAME}
  
  
# Change title text
  prompt -w "Do you want to change the title text?"
  read -p "[y/n]: " un
  if [[ "$un" == "y" || "$un" = "Y" ]]; then
    read -p "Enter the text you want [GRUB Bootloader] : " username
    
    if [ ${#username} -gt 25 ]
      then 
        
        username=$(echo $username | cut -c1-25)
        
     fi
     prompt -i "Setting your text ......."
   
     sed -i "s/GRUB Bootloader/$username/g"  $THEME_DIR/$THEME_NAME/theme.txt
  fi
  
  
# Change accent color
  prompt -w "Do you want to change the accent color?"
  read -p "[y/n]: " un
  if [[ "$un" == "y" || "$un" = "Y" ]]; then
    read -p "Enter the HEX color you want [#E41B21] : " accentcolor

     prompt -i "Setting your color ......."
   
     sed -i "s/#E41B21/$accentcolor/g"  $THEME_DIR/$THEME_NAME/theme.txt
  fi
  
  
  # Set theme
  prompt -i "\nSetting Sleek as the default theme...\n"
  
  # Backup GRUB config
  cp -an /etc/default/grub /etc/default/grub.bak
  
  grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sed -i '/GRUB_THEME=/d' /etc/default/grub

  echo "GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"" >> /etc/default/grub




  


  prompt -i "\n Finalizing the Installation ......."
  # Update grub config
  echo -e "Updating GRUB Config..."
  if has_command update-grub; then
    update-grub
  elif has_command grub-mkconfig; then
    grub-mkconfig -o /boot/grub/grub.cfg
  elif has_command grub2-mkconfig; then
    if has_command zypper; then
      grub2-mkconfig -o /boot/grub2/grub.cfg
    elif has_command dnf; then
      grub2-mkconfig -o /boot/grub2/grub.cfg
    fi
  fi

  # Success message
  prompt -s "\n\t          ***********************************\n\t          *  Theme successfully installed!  *\n\t          ***********************************\n"

  

else

  # Error message
  prompt -e "\n [ Error! ] -> Run me as root  \n \n "

fi









