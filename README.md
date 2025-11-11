# IP Location Brazil - MikroTik Address List

This repository contains IP address ranges for Brazil in MikroTik RouterScript (.rsc) format.

## Statistics

- **Total IP Ranges**: 22029
- **Last Updated**: Tue 11 Nov 2025 05:43:06 PM -03
- **Format**: MikroTik RouterScript (.rsc)

## Files

- `mikrotik-ip-brazil.rsc` - MikroTik script with Brazil IP ranges
- `mikrotik-ip-brazil-updater.rsc` - MikroTik script with schedule and update lists every 30 days

## Usage

### Import into MikroTik Router

1. Upload the `mikrotik-ip-brazil-updater.rsc` file to your MikroTik router
2. Import the script via terminal:
   ```
   /import file-name=mikrotik-ip-brazil-updater.rsc
   ```

### Using the Address List

After import, you can use the address list in firewall rules:

```
/ip firewall filter
add chain=forward src-address-list=IP2Location action=accept comment="Allow Brazil IPs"
```

## Notes

- All IP ranges are marked with comment "Brazil"
- The address list name is "IP2Location"

---

## List source
- https://www.ip2location.com/free/visitor-blocker

---

*Generated automatically on Tue 11 Nov 2025 05:43:06 PM -03*
