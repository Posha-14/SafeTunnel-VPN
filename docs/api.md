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

