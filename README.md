# SafeTunnel VPN — ICT171 Cloud Server Project

**Student:** Posha Akaliza  
**Student ID:** 35770803  

## Project Overview

SafeTunnel VPN is a secure VPN gateway hosted on an Azure Ubuntu 24.04 IaaS virtual machine.
It uses **WireGuard** for VPN connectivity and **Nginx** to serve a custom-built web dashboard.

The website, accessible via the VM public IP (`https://safetunnel.icu)`), provides:

- A **dashboard** page with:
  - Active VPN clients
  - Bytes in / bytes out (read from a JSON status file)
- A **project proposal** page describing the SafeTunnel VPN concept and motivation
- A **status** page that shows the pretty JSON output from a custom Bash script.
- A **JSON** page that shows the raw JSON output from a custom Bash script

The project originally started with OpenVPN using the `angristan/openvpn-install` script.  
Due to configuration difficulty, it was migrated to WireGuard, which is simpler and lighter.  
The documentation in `docs/` explains this setup.

## Server Stack

- **Cloud Provider:** Microsoft Azure (IaaS)
- **OS:** Ubuntu Server 24.04 LTS
- **Web Server:** Nginx
- **VPN:** WireGuard (`wg-quick@wg0`)
- **Script:** `wg-stats.sh` – exports WireGuard stats to `/var/www/html/status.json`
- **Domain:** safetunnel.icu (from NameSilo)
- **Access URL:** `https://safetunnel.icu`
- **SSL / HTTPS:** Let’s Encrypt (Certbot)

## Repository Layout

- `docs/` – step-by-step documentation
  - `01-architecture.md` – high-level design and components
  - `02-azure-vm-setup.md` – VM creation and firewall rules
  - `03-wireguard-vpn-setup.md` – WireGuard configuration and testing
  - `05-vpn-status-script.md` – script purpose, usage and sample output
  - `dns-and-https.md`
- `scripts/`
  - `wg-stats.sh` – Bash script that generates `status.json`
  - `www`- HTML for the website
- `screenshots/` – evidence (VM, VPN, website pages, JSON output)
- `LICENSE` – MIT License
  

## Video Explainer

Video link: ** .......**

## License

This project is released under the **MIT License**, allowing others to reuse and extend the configuration with attribution.
