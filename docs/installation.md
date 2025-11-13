### SafeTunnel Cloud Server – Installation Guide

This guide explains how to rebuild the SafeTunnel cloud server fr>

---

## 1. Create the Cloud VM (Azure)

1. Log into Azure Portal.
2. Create a new Virtual Machine.
3. Choose:
   - OS: Ubuntu 22.04 LTS
   - Size: B1s or B2s
   - Authentication: SSH
4. Open the following inbound ports:
   - 22/tcp (SSH)
   - 80/tcp (HTTP)
   - 443/tcp (HTTPS)
5. Deploy the VM and copy the public IP.

---

## 2. Connect to the VM

```bash
ssh username@YOUR_PUBLIC_IP
sudo apt update && sudo apt upgrade -y

## 3. Install Nginx

sudo apt install nginx -y
sudo systemctl enable --now nginx

## 4. Configure Nginx for SafeTunnel

nginx/nginx-safetunnel.conf

## 5. To activate it:

sudo cp nginx/nginx-safetunnel.conf
/etc/nginx/sites-available/safetunnel sudo ln -s
/etc/nginx/sites-available/safetunnel
/etc/nginx/sites-enabled/ sudo nginx -t sudo systemctl

## 6. reload nginx


## 7. Deploy SafeTunnel API

- Create your API service files here

## 8. Deploy SafeTunnel Web Dashboard

- Copy HTML files to /var/www/html

## 9. Testing the API (Scripts)

- Use the included API test script:

./scripts/api-tests.sh

Expected output:

VPN status

Stop action

Start action

## 10.  Systemd Configuration

(Your systemd unit files for safe API start/stop services)

## 11. Firewall Rules
sudo ufw allow OpenSSH
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable

### Rebuild Summary

You should now have:

Nginx running

SafeTunnel API endpoints working

Dashboard accessible

Scripts for testing available

Nginx config deployed

Cloud VM operational








