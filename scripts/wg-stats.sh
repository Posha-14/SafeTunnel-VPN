#!/usr/bin/env bash
OUT="/var/www/html/status.json"
ts=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
peers=$(wg show wg0 peers 2>/dev/null | wc -l)
active=$(wg show wg0 latest-handshakes 2>/dev/null | awk -v now=$(date +%s) '{ if (now-$2 < 180) c++ } END{print c+0}')
read rx tx < <(wg show wg0 transfer 2>/dev/null | awk '{rx+=$2; tx+=$3} END{print (rx+0) " " (tx+0)}')
cat >"$OUT".tmp <<JSON
{"ok":true,"timestamp":"$ts","configured_peers":$peers,"active_clients":$active,"bytes_in":${rx:-0},"bytes_out":${tx:-0},"note":"wireguard"}
JSON
mv "$OUT".tmp "$OUT"; chmod 644 "$OUT"
