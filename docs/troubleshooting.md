# Troubleshooting Guide

## Web Service Issue
- Check: `systemctl status httpd`
- Logs: `journalctl -u httpd -e`
- Firewall/Security: `firewall-cmd --list-all`, `getenforce`

## Disk Full
- `df -h`
- Cleanup: `journalctl --vacuum-time=7d`
