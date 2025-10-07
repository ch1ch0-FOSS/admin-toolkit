# Admin Standard Workflows

A quick-reference for repeatable, critical admin and DevOps operations.

---

## Routine Patch & Reboot

1. Notify users (as needed): `wall "System update in 10 minutes"`
2. Snapshot key data: `cp -a /etc /backup/etc-$(date +%F)`
3. Update:
   - Fedora/RHEL: `sudo dnf update --refresh`
   - Ubuntu:      `sudo apt update && sudo apt upgrade`
4. Reboot (if needed): `sudo reboot`
5. Post-check: `uptime`, verify services (`systemctl --failed`)

---

## New User Onboarding

1. Add user: `sudo useradd -m -s /bin/bash <user>`
2. Add SSH key: `echo "<key>" > /home/<user>/.ssh/authorized_keys && chown -R <user>:<user> /home/<user>/.ssh`
3. Add to sudo: `sudo usermod -aG wheel <user>`
4. Document in `access.md`

---

## Backup & Restore

- **Backup All:**
  1. `sudo rsync -aAX --delete /data/ /backups/data-$(date +%F)/`
  2. DB dump: `mysqldump -u root <db> > /backups/<db>-$(date +%F).sql`
  3. Log outcome in `logs/changelog.md`

- **Restore:**
  1. Restore files: `rsync -aAX backup/ data/`
  2. Restore DB: `mysql -u root <db> < <db>-DATE.sql`

---

## Incident Response: Service Down

1. `systemctl status <service>`
2. `journalctl -u <service> -e`
3. Check disk/SELinux/firewall
4. Attempt restart: `systemctl restart <service>`
5. If unresolved, escalate and document in `logs/sessions-logs`

---

## Security Audit

1. Validate packages: `rpm -Va | less`
2. Check SELinux/AppArmor: `getenforce` or `aa-status`
3. List SUID files: `find / -perm -4000 -type f`
4. Confirm only key-auth allowed: `grep PasswordAuthentication /etc/ssh/sshd_config`

---

## Monthly Compliance/Health Check

- Review all sudoers/groups: `getent group wheel` and `/etc/sudoers`
- Inventory package changes: `rpm -qa --last | head`
- Check disk usage: `df -h`
- Rotate/churn logs if needed: `journalctl --vacuum-time=14d`
- Test and document backup restore

---

_All workflows and checks should be logged in changelog or relevant doc. This ensures full traceability & repeatability._
