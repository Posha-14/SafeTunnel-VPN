Week 1 – VM and   Firewall setup
# Azure VM Setup

This document describes how the SafeTunnel VM was created and prepared.

## VM Creation

- **Provider:** Microsoft Azure
- **Image:** Ubuntu Server 24.04 LTS
- **Size:** Small general-purpose VM
- **Authentication:** SSH username and password

After creation, the VM was assigned a public IP address.  
This IP address is used to SSH into the server and to access the website with `http://74.162.57.96`.

## Firewall / Networking

### Azure Network Security Group (NSG)

The following inbound rules were allowed:

- **SSH:** TCP 22
- **HTTP:** TCP 80
- **WireGuard:** UDP 51820 (or the configured WireGuard port)

### UFW on Ubuntu

On the VM:

```bash
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 51820/udp
sudo ufw enable

sudo apt update
sudo apt install -y nginx
