#!/bin/sh

set -e

PORT="${PORT:-10000}"

sed -i "s/\"port\": 10000/\"port\": ${PORT}/" /etc/xray/config.json

echo "================================="
echo "Xray VLESS gRPC"
echo "Listening: 0.0.0.0:${PORT}"
echo "gRPC service: vpn"
echo "================================="

exec /usr/local/bin/xray run -config /etc/xray/config.json