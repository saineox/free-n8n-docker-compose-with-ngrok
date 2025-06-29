# free-n8n-docker-compose-with-ngrok
Here is a complete `README.md` file tailored for your GitHub repository that deploys **n8n on an AWS EC2 instance** using **Docker Compose**, **local storage**, and a **static ngrok domain**.

---

## 📘 `README.md`

````md
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
````

---

### 2. 🛠️ Run the Setup Script

```bash
chmod +x setup-n8n.sh
./setup-n8n.sh
```

This script installs:

* Docker
* Docker Compose
* ngrok
* Creates local storage folder for n8n

---

### 3. 📁 Confirm Folder Structure

After running the script, make sure you're in the correct directory:

```bash
cd ~/n8n-deployment
```

You should have:

```
n8n-deployment/
├── docker-compose.yml
├── n8n_data/
└── setup-n8n.sh
```

---

### 4. 🐳 Start n8n with Docker Compose

```bash
docker-compose up -d
```

Check it's running:

```bash
docker ps
```

It should show `n8n` running on port `5678`.

---

### 5. 🌍 Start Ngrok with Static Domain

```bash
ngrok http 5678 --domain=peacock-golden-swift.ngrok-free.app
```

---

### 6. ✅ Access n8n

Visit your static ngrok URL:

```
https://peacock-golden-swift.ngrok-free.app
```

You should see the n8n editor interface.

---

## 🛑 Stop / Restart

```bash
# Stop n8n
docker-compose down

# Restart
docker-compose restart

# Logs
docker-compose logs -f
```

---

## 📌 Tips

* Add `.env` file if you want to customize n8n with credentials or database config.
* Ensure EC2 security group allows traffic on port `5678`.
* Use [ngrok reserved domains](https://ngrok.com/docs) if needed.

---

## 👏 You're Done!

You now have a self-hosted, public, persistent instance of n8n running on EC2 via Docker and ngrok.

```

---

Would you like me to also include the `docker-compose.yml` and the `setup-n8n.sh` in this repo layout, so it's plug-and-play for GitHub upload?
```
