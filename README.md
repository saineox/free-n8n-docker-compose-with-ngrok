📘 README.md
md
Copy
Edit
# ⚙️ Self-Hosted n8n on AWS EC2 using Docker Compose + Ngrok

This repository provides everything you need to deploy [n8n](https://n8n.io/) on an AWS EC2 instance using Docker Compose, with local storage for persistence and ngrok to expose your instance via a secure public URL.

---

## 📦 What's Inside

- ✅ Docker Compose file for `n8n`
- ✅ Persistent local storage
- ✅ Ngrok static domain setup
- ✅ One-click bash script to install Docker, Docker Compose, and ngrok

---

## 🚀 Quick Start Guide

### 1. 🔁 Clone the Repository

```bash
git clone https://github.com/yourusername/n8n-ec2-docker.git
cd n8n-ec2-docker
2. 🛠️ Run the Setup Script
bash
Copy
Edit
chmod +x setup-n8n.sh
./setup-n8n.sh
This script installs:

Docker

Docker Compose

ngrok

Creates local storage folder for n8n

3. 📁 Confirm Folder Structure
After running the script, make sure you're in the correct directory:

bash
Copy
Edit
cd ~/n8n-deployment
You should have:

arduino
Copy
Edit
n8n-deployment/
├── docker-compose.yml
├── n8n_data/
└── setup-n8n.sh
4. 🐳 Start n8n with Docker Compose
bash
Copy
Edit
docker-compose up -d
Check it's running:

bash
Copy
Edit
docker ps
It should show n8n running on port 5678.

5. 🌍 Start Ngrok with Static Domain
bash
Copy
Edit
ngrok http 5678 --domain=peacock-golden-swift.ngrok-free.app
6. ✅ Access n8n
Visit your static ngrok URL:

arduino
Copy
Edit
https://peacock-golden-swift.ngrok-free.app
You should see the n8n editor interface.

🛑 Stop / Restart
bash
Copy
Edit
# Stop n8n
docker-compose down

# Restart
docker-compose restart

# Logs
docker-compose logs -f
📌 Tips
Add .env file if you want to customize n8n with credentials or database config.

Ensure EC2 security group allows traffic on port 5678.

Use ngrok reserved domains if needed.

👏 You're Done!
You now have a self-hosted, public, persistent instance of n8n running on EC2 via Docker and ngrok.

yaml
Copy
Edit

---

Would you like me to also include the `docker-compose.yml` and the `setup-n8n.sh` in this repo layout, so it's plug-and-play for GitHub upload?







You said:
https://github.com/saineox/free-n8n-docker-compose-with-ngrok analyse this folder structure up kitab directory and modify the readily file accordingly.


ChatGPT said:

Thought for 4 seconds
I couldn't find the exact GitHub repository saineox/free-n8n-docker-compose-with-ngrok—perhaps it was renamed, deleted, or private. However, I did locate a close alternative with a similar structure in the public repo Joffcom/n8n-ngrok 
youtube.com
+9
github.com
+9
architjn.com
+9
. I can use that to guide your modifications. Let's:

1. Outline an improved folder structure
sql
Copy
Edit
free-n8n-docker-compose-with-ngrok/
├── docker-compose.yml
├── ngrok.yml
├── .env
├── setup-n8n.sh
└── README.md
2. Update the README.md accordingly
Here's a modified version tailored to your setup, replacing Joffcom/n8n-ngrok structure and integrating your specifics:

md
Copy
Edit
# 🚀 free-n8n-docker-compose-with-ngrok

Deploy **n8n** with Docker Compose on AWS (or any Linux) using **local storage** and a **reserved ngrok domain**.

---

## 📂 Repository Structure

├── docker-compose.yml # Orchestrates ‘n8n’ and ‘ngrok’ services
├── ngrok.yml # Ngrok tunnel configuration & reserved domain
├── .env # Contains NGROK_TOKEN and NGROK_DOMAIN
├── setup-n8n.sh # Installs Docker, Docker Compose, ngrok, and sets up folder
└── README.md # This guide

yaml
Copy
Edit

---

## 🔧 Prerequisites

- Linux host (e.g., AWS EC2 Ubuntu/Debian)
- Docker & Docker Compose
- ngrok account with a **reserved domain** (e.g., `peacock-golden-swift.ngrok-free.app`)

---

## 🛠️ 1. Clone the Repository

```bash
git clone https://github.com/saineox/free-n8n-docker-compose-with-ngrok.git
cd free-n8n-docker-compose-with-ngrok
👷 2. Set Up Install Script
Make the install script executable and run it:

bash
Copy
Edit
chmod +x setup-n8n.sh
./setup-n8n.sh
This will install Docker, Docker Compose, ngrok, and create the n8n_data/ folder.

🔐 3. Configure Environment Variables
Create .env in root folder:

env
Copy
Edit
NGROK_TOKEN=your_ngrok_auth_token
NGROK_DOMAIN=peacock-golden-swift.ngrok-free.app
📄 4. Configure ngrok.yml
Define your tunnel:

yaml
Copy
Edit
version: 2
tunnels:
  n8n:
    proto: http
    addr: n8n:5678
    domain: ${NGROK_DOMAIN}
🐳 5. Review docker-compose.yml
You can adapt this structure (based on Joffcom repo):

yaml
Copy
Edit
version: '3.8'

services:
  n8n:
    image: n8nio/n8n:latest
    container_name: n8n
    ports:
      - "5678:5678"
    volumes:
      - ./n8n_data:/home/node/.n8n
    environment:
      - N8N_COMMUNITY_PACKAGE_ALLOW_LIST=true
      - N8N_EDITOR_BASE_URL=https://${NGROK_DOMAIN}
      - WEBHOOK_URL=https://${NGROK_DOMAIN}
      - WEBHOOK_TUNNEL_URL=https://${NGROK_DOMAIN}
      - N8N_DEFAULT_BINARY_DATA_MODE=filesystem
      - TZ=Etc/UTC
    restart: always

  ngrok:
    image: wernight/ngrok
    depends_on:
      - n8n
    volumes:
      - ./ngrok.yml:/etc/ngrok.yml:ro
    environment:
      - NGROK_AUTHTOKEN=${NGROK_TOKEN}
      - NGROK_CONFIG=/etc/ngrok.yml
    restart: always
▶️ 6. Start Services
bash
Copy
Edit
docker-compose up -d
n8n runs on port 5678 locally

ngrok uses your custom domain to expose n8n

🌐 7. Access n8n
Go to:

perl
Copy
Edit
https://${NGROK_DOMAIN}
Enjoy the n8n UI powered by Docker and ngrok!

🛑 8. Stop Services
bash
Copy
Edit
docker-compose down
📌 Notes & Tips
Make sure port 5678 is open in your firewall/security-group.

The ngrok reserved domain must be set up from your ngrok dashboard 

If using a dynamic ngrok URL (free plan), edit .env and re-deploy (no ngrok.yml needed).
