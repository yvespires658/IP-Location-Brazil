# IP Location Brazil - MikroTik Address List

This repository contains IP address ranges for Brazil in MikroTik RouterScript (.rsc) format.

## Statistics

- **Total IP Ranges**: 21840
- **Last Updated**: Tue 02 Sep 2025 03:37:52 PM -03
- **Format**: MikroTik RouterScript (.rsc)

## ?? Files

- `mikrotik-ip-brazil.rsc` - MikroTik script with Brazil IP ranges
- `firewall.txt` - Source file with raw firewall entries

## Usage

### Import into MikroTik Router

1. Upload the `mikrotik-ip-brazil.rsc` file to your MikroTik router
2. Import the script via terminal:
   ```
   /import file-name=mikrotik-ip-brazil.rsc
   ```

### Using the Address List

After import, you can use the address list in firewall rules:

```
/ip firewall filter
add chain=forward src-address-list=IP2Location action=accept comment="Allow Brazil IPs"
```

## Address List Structure

The imported address list will be named `IP2Location` and contains IP ranges with the comment `Brazil`.

## Notes

- All IP ranges are marked with comment "Brazil"
- The address list name is "IP2Location"
- Compatible with MikroTik RouterOS v6 and v7

---

*Generated automatically on Tue 02 Sep 2025 03:37:52 PM -03*
