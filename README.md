# SafeTunnel VPN — ICT171 Cloud Server Project

**Student:** Posha Akaliza  
**Student ID:** 35770803  

## Project Overview

SafeTunnel VPN is a secure VPN gateway running on an Azure Ubuntu 24.04 IaaS virtual machine.  
It uses **WireGuard** for the VPN tunnel and **Nginx** to serve a custom HTML website.

The website, accessible via the VM public IP (`http://74.162.57.96>`), provides:

- A **dashboard** page with:
  - Active VPN clients
  - Bytes in / bytes out (read from a JSON status file)
- A **project proposal** page describing the SafeTunnel VPN concept and motivation
- A **status** page that shows the pretty JSON output from a custom Bash script.
- A **JSON** page that shows the raw JSON output from a custom Bash script

The project originally started with OpenVPN using the `angristan/openvpn-install` script.  
Due to configuration difficulty and time constraints, it was migrated to WireGuard, which is simpler and lighter.  
The documentation in `docs/` explains this setup.

## Server Stack

- **Cloud Provider:** Microsoft Azure (IaaS)
- **OS:** Ubuntu Server 24.04 LTS
- **Web Server:** Nginx
- **VPN:** WireGuard (`wg-quick@wg0`)
- **Script:** `wg-stats.sh` – exports WireGuard stats to `/var/www/html/status.json`
- **Access URL:** `http://74.162.57.96>` (no DNS / HTTPS configured)

DNS and HTTPS are described as future improvements.

## Repository Layout

- `docs/` – step-by-step documentation
  - `01-architecture.md` – high-level design and components
  - `02-azure-vm-setup.md` – VM creation and firewall rules
  - `03-wireguard-vpn-setup.md` – WireGuard configuration and testing
  - `05-vpn-status-script.md` – script purpose, usage and sample output
- `scripts/`
  - `wg-stats.sh` – Bash script that generates `status.json`
- `screenshots/` – evidence (VM, VPN, website pages, JSON output)
- `LICENSE` – MIT License

## Video Explainer

Video link: **[ADD VIDEO LINK HERE]**

The video demonstrates:

1. The Azure VM and network configuration
2. WireGuard running on the server
3. The Nginx website (dashboard, proposal, status pages)
4. The `wg-stats.sh` script and the JSON status file

## License

This project is released under the **MIT License**, allowing others to reuse and extend the configuration with attribution.
