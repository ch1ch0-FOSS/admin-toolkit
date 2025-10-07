# Linux Professional CLI Reference

A curated cheatsheet of core Linux, admin, audit, and troubleshooting commands.  
For quick lookup, onboarding, and operational mastery.

---

## User & Access Management

| Purpose                  | Command                                                      |
|--------------------------|-------------------------------------------------------------|
| List all users           | `awk -F: '{print $1}' /etc/passwd`                          |
| Add new user             | `sudo useradd -m -s /bin/bash <user>`                       |
| Lock/unlock user         | `sudo passwd -l <user>` / `sudo passwd -u <user>`           |
| Add sudo privileges      | `sudo usermod -aG wheel <user>`                             |
| Check sudo rights        | `sudo -l -U <user>`                                         |
| List ssh keys            | `cat /home/<user>/.ssh/authorized_keys`                     |

---

## Service Management (systemd)

| Purpose                | Command                                |
|------------------------|----------------------------------------|
| Check status           | `systemctl status <service>`           |
| Start/stop/restart     | `systemctl start|stop|restart <svc>`   |
| Enable/disable at boot | `systemctl enable|disable <service>`   |
| View logs              | `journalctl -u <service> -e`           |
| List failed            | `systemctl --failed`                   |

---

## Package Management

| Purpose               | Fedora/RHEL                      | Ubuntu/Debian                  |
|-----------------------|----------------------------------|---------------------------------|
| List packages         | `rpm -qa`                        | `dpkg -l`                       |
| Last installed        | `rpm -qa --last | head`          | `apt list --installed | head`   |
| Update all packages   | `sudo dnf update --refresh`      | `sudo apt update && apt upgrade`|

---

## Filesystem & Storage

| Purpose                     | Command                                             |
|-----------------------------|----------------------------------------------------|
| Disk usage, all             | `df -h`                                            |
| Directory usage             | `du -sh /path/*`                                   |
| List mounted volumes        | `lsblk -f` / `mount`                               |
| Find largest files          | `find . -type f -exec du -h {} + | sort -rh | head`|

---

## Networking

| Purpose                | Command                                  |
|------------------------|------------------------------------------|
| List interfaces        | `ip a`                                   |
| Network routes         | `ip route`                               |
| Connectivity test      | `ping <host>`                            |
| HTTP test              | `curl -I <url>`                          |
| Show open ports        | `ss -tuln`                               |
| Show listening procs   | `lsof -i -P -n | grep LISTEN`            |

---

## Security & Audit

| Purpose                | Command                                   |
|------------------------|-------------------------------------------|
| SELinux status         | `getenforce`                              |
| AppArmor status (Ubuntu)| `sudo aa-status`                         |
| List sudoers           | `getent group wheel` (or `sudoers`)       |
| Last auth logins       | `last -a | head`                          |

---

## Backup & Data Safety

| Purpose                | Command                                  |
|------------------------|------------------------------------------|
| Tar directory          | `tar -czvf backup.tar.gz /directory`     |
| Rsync copy             | `rsync -aAX source/ dest/`               |
| MariaDB/MySQL dump     | `mysqldump -u <user> <db> > file.sql`    |
| Restore dump           | `mysql -u <user> <db> < file.sql`        |

---

## System Info & Health

| Purpose                | Command                                  |
|------------------------|------------------------------------------|
| Uptime                 | `uptime`                                 |
| Kernel version         | `uname -a`                               |
| Hardware (RAM, CPU)    | `free -h`, `lscpu`, `lsmem`              |
| Top processes          | `htop` / `top`                           |

---

_Note: Replace placeholders `<user>`, `<db>`, `<service>`, `<host>`, `<url>` with actual values. Intended for secure, audit-ready systems (SELinux, firewalld, key-auth enforced)._
