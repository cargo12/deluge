#!/bin/bash

dry_run=true

#################
# Prerequisites #
#################
 # 1. Download lubuntu
 # 2. Install git
 # 3. Git clone the repo

# Set colors as vars
rstclr="\e[0m"
grn="\e[32m"
ylw="\e[33m"
cyn="\e[36m"
lghrd="\e[91m"

# Set commands as vars
# Update Upgrade Install
cmd1="apt-get update"
cmd2="apt-get -y upgrade"
cmd3="apt-get -y install curl deluged deluge-console deluge-web git openvpn"
# Static IP
cmd4="mv /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml.orig"
cmd5="cp ./01-netcfg.yaml /etc/netplan/"
# OpenVPN conf
cmd6="cp ./auth.txt /home/roger/"
cmd7="cp ./porcia.ovpn /home/roger"
# Deluge user
cmd8="adduser --system  --gecos \"Deluge Service\" --disabled-password --group --home /var/lib/deluge deluge"
cmd9="adduser roger deluge"
cmd10="update-rc.d deluge-daemon remove"
# Deluged
cmd11="cp ./deluged.service /etc/systemd/system/"
cmd12="systemctl enable /etc/systemd/system/deluged.service"
cmd13="systemctl stop deluged"
cmd14="systemctl start deluged"
# Deluge-web
cmd15="cp ./deluge-web.service /etc/systemd/system/"
cmd16="systemctl enable /etc/systemd/system/deluge-web.service"
cmd17="systemctl stop deluge-web"
cmd18="systemctl start deluge-web"
# Deluged - Deluge-web status
cmd19="systemctl status deluged"
cmd20="systemctl status deluge-web"
# Copy start-stop scripts
cmd21="cp ./start-deluge.sh /home/roger/"
cmd22="cp ./stop-deluge.sh /home/roger/"
# Configure crontab for openvpn & deluged auto-start
cmd23="crontab -l > crontab.lst"
cmd24="printf \"@reboot sudo /home/roger/start-deluge.sh\" >> crontab.lst" # Ne fonctionne pas, a coder en dur
cmd25="crontab crontab.lst"
# Reboot
cmd26="reboot"


echo -e "$ylw This script installs and configures openvpn, deluged & deluge-web for lubuntu 18.04 $rstclr"
echo
sleep 3

echo -e "$ylw It runs the following commands: $rstclr"
echo -e "1.$cyn $cmd1 $rstclr"
echo -e "2.$cyn $cmd2 $rstclr"
echo -e "3.$cyn $cmd3 $rstclr"
echo -e "4.$cyn $cmd4 $rstclr"
echo -e "5.$cyn $cmd5 $rstclr"
echo -e "6.$cyn $cmd6 $rstclr"
echo -e "7.$cyn $cmd7 $rstclr"
echo -e "8.$cyn $cmd8 $rstclr"
echo -e "9.$cyn $cmd9 $rstclr"
echo -e "10.$cyn $cmd10 $rstclr"
echo -e "11.$cyn $cmd11 $rstclr"
echo -e "12.$cyn $cmd12 $rstclr"
echo -e "13.$cyn $cmd13 $rstclr"
echo -e "14.$cyn $cmd14 $rstclr"
echo -e "15.$cyn $cmd15 $rstclr"
echo -e "16.$cyn $cmd16 $rstclr"
echo -e "17.$cyn $cmd17 $rstclr"
echo -e "18.$cyn $cmd18 $rstclr"
echo -e "19.$cyn $cmd19 $rstclr"
echo -e "20.$cyn $cmd20 $rstclr"
echo -e "21.$cyn $cmd21 $rstclr"
echo -e "22.$cyn $cmd22 $rstclr"
echo -e "23.$cyn $cmd23 $rstclr"
echo -e "24.$cyn $cmd24 $rstclr"
echo -e "25.$cyn $cmd25 $rstclr"
echo -e "26.$cyn $cmd26 $rstclr"
echo

read -p "Ok for you? ('y' to continue...) " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]] # (if 'answer' != 'y')
  then
    echo
    echo -e "$grn Exiting... $rstclr"
	echo
	[[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
  else
	echo
	echo -e "1. Running '$cyn $cmd1 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd1; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "2. Running '$cyn $cmd2 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd2; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "3. Running '$cyn $cmd3 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd3; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "4. Running '$cyn $cmd4 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd4; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "5. Running '$cyn $cmd5 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd5; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "6. Running '$cyn $cmd6 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd6; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "7. Running '$cyn $cmd7 $rstclr'"
	sleep 3;
	if [[ "$dry_run" = false ]] ; then $cmd7; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "8. Running '$cyn $cmd8 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd8; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "9. Running '$cyn $cmd9 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd9; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "10. Running '$cyn $cmd10 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd10; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "11. Running '$cyn $cmd11 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd11; sleep 1;	fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "12. Running '$cyn $cmd12 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd12; sleep 1;	fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "13. Running '$cyn $cmd13 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd13; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "14. Running '$cyn $cmd14 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd14; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "15. Running '$cyn $cmd15 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd15; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "16. Running '$cyn $cmd16 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd16; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "17. Running '$cyn $cmd17 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd17; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "18. Running '$cyn $cmd18 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd18; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "19. Running '$cyn $cmd19 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd19; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "20. Running '$cyn $cmd20 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd20; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "21. Running '$cyn $cmd21 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd21; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "22. Running '$cyn $cmd22 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd22; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "23. Running '$cyn $cmd23 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd23; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "24. Running '$cyn $cmd24 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then printf "@reboot sudo /home/roger/start-deluge.sh\n" >> crontab.lst >> crontab.lst; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "25. Running '$cyn $cmd25 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd25; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo

	
	echo -e "26. Running '$cyn $cmd26 $rstclr'"
	sleep 3
	read -p "The system needs to reboot. Ready? ('y' to reboot...) " -n 1 -r
		if [[ ! $REPLY =~ ^[Yy]$ ]]
			then
				echo
				echo -e "$grn Exiting... $rstclr"
				echo
				[[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
		else
			echo
			echo
			echo -e "$ylw The system is going to reboot... $rstclr"
			echo
			sleep 5
			if [[ "$dry_run" = false ]] ; then $cmd26; fi
		fi
fi

