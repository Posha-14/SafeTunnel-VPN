Week 1 – VM and OpenVPN Setup & Verification

## Virtual Machine and Firewall Setup

- **VM Name:** SafeTunnel  
- **OS:** Ubuntu 24.04 LTS (Azure VM)  
- **Firewall (ufw) ports opened:** 22 (SSH), 80 (HTTP), 443 (HTTPS), 1194 (UDP OpenVPN)

### Verification Summary
- Verified Azure VM is running and reachable.  
- Public IP confirmed via Azure portal.  
- UFW rules show all four ports set to **ALLOW Anywhere**.  


---

## OpenVPN Setup and Verification

### Environment
- **OS:** Ubuntu 24.04 (Azure VM)
- **Installation Script:** [angristan/openvpn-install](https://github.com/angristan/openvpn-install)

### Configuration Details
- Client profile generated: `/home/Posha/SafeTunnel-VPN.ovpn`  
- Connected successfully on my laptop.  
- Verified the server status log at `/var/log/openvpn-status.log` shows active client.  
- OpenVPN service confirmed running even after disconnect.  
- VPN setup and connection successful ✅

### Verification Evidence
Command used: 
sudo tail -n 40 /var/log/openvpn/status.log
