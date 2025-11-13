# wg-stats.sh – VPN Status Script

The `wg-stats.sh` script is used to collect statistics from the WireGuard VPN and export them as JSON for the SafeTunnel status page.

## Location

- Script path on server: `/usr/local/bin/wg-stats.sh`
- Output path: `/var/www/html/status.json`

## Purpose

The script:

1. Calls `wg show wg0` to read information about the WireGuard interface.
2. Counts how many peers are configured.
3. Counts how many clients are active in the last 180 seconds.
4. Sums the total bytes in and bytes out.
5. Writes all of this into a JSON file that can be served by Nginx.

## How to Run

On the VM:

```bash
sudo /usr/local/bin/wg-stats.sh
cat /var/www/html/status.json
output:
{
  "ok": true,
  "timestamp": "2025-11-13T12:34:56Z",
  "configured_peers": 3,
  "active_clients": 0,
  "bytes_in": 0,
  "bytes_out": 0
}


