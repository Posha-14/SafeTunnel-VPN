#!/usr/bin/env bash

echo "=== SafeTunnel API Test Script ==="

echo
echo "[1] Checking VPN status..."
curl -i -s http://127.0.0.1/api/vpn/status || echo "Status request failed."

echo
echo "[2] Stopping VPN (if running)..."
curl -i -s -X POST http://127.0.0.1/api/vpn/stop || echo "Stop request failed."

echo
echo "[3] Starting VPN..."
curl -i -s -X POST http://127.0.0.1/api/vpn/start || echo "Start request failed."

echo
echo "=== API tests complete. ==="
