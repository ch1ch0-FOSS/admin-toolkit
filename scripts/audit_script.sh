#!/bin/bash
echo "User Audit:"; awk -F: '$3 >= 1000 {print $1}' /etc/passwd
echo "Sudo/Wheel:"; getent group wheel
echo "Last 10 RPMs:"; rpm -qa --last | head -10
echo "SELinux:"; getenforce
echo "Firewall:"; firewall-cmd --list-all
