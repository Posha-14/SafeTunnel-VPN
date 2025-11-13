 SafeTunnel VPN – Architecture Overview

SafeTunnel VPN is a cloud-hosted VPN gateway and web dashboard running on an Azure IaaS virtual machine.

## Components

- **Azure VM (Ubuntu 24.04 LTS)**  
  Runs both the WireGuard VPN service and the Nginx web server.

- **WireGuard VPN (wg0)**  
  Provides an encrypted tunnel between the client and the server.  
  Clients use a WireGuard configuration to connect and route their traffic securely via the VM.

- **Nginx Web Server**  
  Serves a custom HTML website with:
  - A dashboard page
  - A project proposal page
  - A status page that reads preety JSON from a file
  - A status page that reads Raw JSON from a file

- **wg-stats.sh Script**  
  A Bash script that reads WireGuard stats (`wg show wg0`) and exports them as JSON to `/var/www/html/status.json`.  
  The status page and dashboard can display:
  - Number of configured peers
  - Number of active clients
  - Total bytes in and out

## Data Flow

1. WireGuard runs as interface `wg0` on the VM.
2. The `wg-stats.sh` script calls `wg show` and calculates:
   - How many peers are configured
   - How many are active in the last 180 seconds
   - Total bytes received and sent
3. The script writes this data to `/var/www/html/status.json`.
4. The Nginx website exposes this file through a status page, so users can see current VPN statistics.
5. Regular web traffic (HTTP) is served directly from Nginx using static HTML files in `/var/www/html/`.

