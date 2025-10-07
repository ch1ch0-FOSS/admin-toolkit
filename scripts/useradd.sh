#!/bin/bash
USER=$1; sudo useradd -m -s /bin/bash $USER
sudo passwd -d $USER
sudo mkdir -p /home/$USER/.ssh && sudo chown $USER:$USER /home/$USER/.ssh && sudo chmod 700 /home/$USER/.ssh
echo "Add pubkey to /home/$USER/.ssh/authorized_keys"
