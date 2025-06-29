#!/bin/bash

set -e

echo "📦 Updating package list..."
sudo apt update -y && sudo apt upgrade -y

echo "🐳 Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo "🐙 Installing Docker Compose..."
sudo apt install docker-compose -y

echo "🌐 Installing ngrok..."
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null

echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list

sudo apt update -y
sudo apt install ngrok -y

echo "📁 Creating n8n local data folder..."
mkdir -p ~/n8n_data

echo "✅ Setup complete! You can now place your docker-compose.yml inside ~/n8n-deployment and run:"
echo ""
echo "    cd ~/"
echo "    docker-compose up -d"
echo ""
echo "💡 Remember to run ngrok after that:"
echo ""
echo "    ngrok config add-authtoken Your-Secret-Token-From-Ngrok-Free"
echo ""
echo "    ngrok http 5678 --domain=Your-Domain-ngrok-free.app"
