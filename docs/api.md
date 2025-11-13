# SafeTunnel API Documentation

This document describes the internal REST API used by the SafeTunnel Cloud VPN Server.  
The API exposes simple HTTP endpoints that allow the server to:

- Check VPN status  
- Stop the VPN  
- Start the VPN  

These API endpoints are connected to systemd commands on the VM and return structured JSON responses for easy monitoring and scripting.

---

# 1. Base URL

### On the local VM:
### If exposed publicly (optional):
# 2. GET /status

### **Endpoint**
### **Purpose**
Checks whether the VPN (WireGuard or OpenVPN) is currently active.

### **Typical Response**
```json
{
  "active": true,
  "ok": true,
  "service": "wireguard"
}

POST /start
Endpoint
POST /api/vpn/start

Purpose

Starts the VPN service through systemd.

Backend Action
sudo systemctl start wg-quick@wg0     # for WireGuard


OR

sudo systemctl start openvpn-server@server

Typical Response
{
  "active": true,
  "ok": true
}

4. POST /stop
Endpoint
POST /api/vpn/stop

Purpose

Stops the VPN service safely.

Backend Action
sudo systemctl stop wg-quick@wg0


or

sudo systemctl stop openvpn-server@server

Typical Response
{
  "active": false,
  "ok": true
}

5. How the API Works Internally

The API is powered by your backend script/service, which converts HTTP calls into Linux commands.

It works like this:

Nginx receives the request

Nginx routes /api/vpn/ to the backend script

The backend executes systemctl or wg commands

The output is converted to JSON

The JSON gets returned to the user

Example Nginx block (from your repo):
location /api/vpn/ {
    proxy_pass http://127.0.0.1:8000/;
}

6. Testing the API

The repo includes a helper script:

scripts/api-tests.sh

Run it:
./scripts/api-tests.sh


It will:

Call /status

Call /stop

Call /start

Display JSON output

This script satisfies the "develop a script" requirement for the ICT171 assignment.

7. Example Manual Testing with curl
Check status:
curl http://127.0.0.1/api/vpn/status

Start VPN:
curl -X POST http://127.0.0.1/api/vpn/start

Stop VPN:
curl -X POST http://127.0.0.1/api/vpn/stop
