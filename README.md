📘 README.md
markdown
Copy
Edit
# 🚀 free-n8n-docker-compose-with-ngrok

Deploy a **self-hosted n8n** instance on AWS EC2 using **Docker Compose**, with **local folder persistence** and a **static ngrok URL**.

---

## 🗂️ Repository Structure

free-n8n-docker-compose-with-ngrok/
├── docker-compose.yml # Defines n8n + ngrok services
├── ngrok.yml # ngrok tunnel config (static domain)
├── .env # Store NGROK_TOKEN, NGROK_DOMAIN
├── setup-n8n.sh # Installs Docker, Docker Compose, ngrok, and sets up folders
└── README.md # This guide

yaml


---

## ✅ Prerequisites

- Ubuntu (e.g., AWS EC2)
- Git installed
- ngrok account with a **reserved domain** (e.g., `peacock-golden-swift.ngrok-free.app`)
- AWS security group: Port **5678** inbound

---

## 🚀 1. Clone the Repository & ⚙️ 2. Setup Script Docker & Docker Compose

```bash
git clone https://github.com/saineox/free-n8n-docker-compose-with-ngrok.git
cd free-n8n-docker-compose-with-ngrok
chmod +x setup-n8n.sh
./setup-n8n.sh
```

Creates n8n_data/ folder in repo root

🔐 3. Configure Environment
Create a .env file: in command add your Credentials 

```
echo -e "NGROK_TOKEN=your_ngrok_auth_token\nNGROK_DOMAIN=peacock-golden-swift.ngrok-free.app" > .env

```
