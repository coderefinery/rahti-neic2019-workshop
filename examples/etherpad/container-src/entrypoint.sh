#!/bin/bash
set -eux

# Copy settings.json to the current directory
cp ../settings.json settings.json

# Configure settings.json
echo "Updating Settings File"
sed -i "s/DB_IP/${DB_IP}/" settings.json
sed -i "s/DB_PORT/${DB_PORT}/" settings.json
sed -i "s/DB_USERNAME/${DB_USERNAME}/" settings.json
sed -i "s/DB_PASSWORD/${DB_PASSWORD}/" settings.json
sed -i "s/DB_NAME/${DB_NAME}/" settings.json
sed -i "s/ADMIN_PASSWORD/${ADMIN_PASSWORD}/" settings.json

echo "Starting Etherpad..."
node node_modules/ep_etherpad-lite/node/server.js