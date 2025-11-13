# WireGuard VPN Setup

This project originally started with OpenVPN using the `angristan/openvpn-install` script.  
Due to configuration difficulty and time constraints, the VPN was migrated to WireGuard.

## Installation

On the Azure VM:

```bash
sudo apt update
sudo apt install -y wireguard

[Interface]
Address = 10.8.0.1/24
ListenPort = 51820
PrivateKey = <SERVER_PRIVATE_KEY>
SaveConfig = true

# Example peer
#[Peer]
#PublicKey = <CLIENT_PUBLIC_KEY>
#AllowedIPs = 10.8.0.2/32

sudo systemctl enable --now wg-quick@wg0

sudo wg show
[Interface]
PrivateKey = <CLIENT_PRIVATE_KEY>
Address = 10.8.0.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = <SERVER_PUBLIC_KEY>
Endpoint = <VM_PUBLIC_IP>:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25

