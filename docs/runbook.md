# Sysadmin Runbook

## Service Restart
1. `systemctl restart <service>`
2. `systemctl status <service>`
3. Check logs: `journalctl -u <service> -e`

## User Recovery
- Unlock: `sudo passwd -u <user>`
- Reset password, log event in access.md

## Patch and Update
- `dnf update --refresh`
- Audit: `rpm -qa --last | head`
