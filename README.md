# 🚀 Self-Hosted n8n on AWS EC2 with Persistent Storage & Static URL

[![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)](https://www.docker.com) 
[![n8n](https://img.shields.io/badge/n8n-000000?logo=n8n&logoColor=white)](https://n8n.io) 
[![AWS EC2](https://img.shields.io/badge/AWS_EC2-FF9900?logo=amazonaws&logoColor=white)](https://aws.amazon.com/ec2/) 
[![ngrok](https://img.shields.io/badge/ngrok-1F1E37?logo=ngrok&logoColor=white)](https://ngrok.com)

Deploy a **production-ready n8n workflow automation** server with:
- 💾 Persistent storage for workflows
- 🔄 Unlimited executions (free!)
- 🌐 Static HTTPS URL via ngrok
- 🐳 One-command Docker setup
- 🔒 Optional basic authentication

## 📖 What is n8n?
n8n is an open-source alternative to Zapier/Make.com that lets you:
- Connect 300+ apps without coding
- Create complex workflows visually
- Self-host for full data control
- Avoid cloud service limits

## 🛠️ Prerequisites
- AWS EC2 Ubuntu instance (t2.micro works)
- ngrok account with [reserved domain](https://dashboard.ngrok.com/cloud-edge/domains)
- Port 5678 open in security group

Deploy a **self-hosted n8n** instance on AWS EC2 using **Docker Compose**, with **local folder persistence** and a **static ngrok URL**.

---

## 🗂️ Repository Structure

free-n8n-docker-compose-with-ngrok/<br>
├── docker-compose.yml # Defines n8n + ngrok services <br>
├── ngrok.yml # ngrok tunnel config (static domain)<br>
├── .env # Store NGROK_TOKEN, NGROK_DOMAIN <br>
├── setup-n8n.sh # Installs Docker, Docker Compose, ngrok, and sets up folders <br>
└── README.md # This guide <br>


## 🚀 Quick Deployment

```bash
# 1. Connect to EC2
ssh -i "your-key.pem" ubuntu@ec2-ip
```

# 2. Clone and setup
```bash
git clone https://github.com/saineox/free-n8n-docker-compose-with-ngrok.git
cd free-n8n-docker-compose-with-ngrok
chmod +x setup-n8n.sh
./setup-n8n.sh
```
## 📝 Step 3 : Create ngrok Account
1. Go to [ngrok Signup Page](https://dashboard.ngrok.com/signup)
2. Sign up with email/GitHub/Google
3. Verify your email address
4. Get your free **authtoken** from [Dashboard](https://dashboard.ngrok.com/get-started/your-authtoken)
   
🔐 4. Configure Environment
Create a .env file: in command add your Credentials 

```
echo -e "NGROK_TOKEN=your_ngrok_auth_token\nNGROK_DOMAIN=peacock-golden-swift.ngrok-free.app" > .env

```
▶️ 6. Start Services
Spin up containers:
```
docker compose up -d

ngrok http --domain=peacock-golden-swift.ngrok-free.app 5678
```




n8n runs locally at port 5678

ngrok exposes it under your reserved domain

🌐 7. Access n8n
Visit in your browser:
```
https://${NGROK_DOMAIN}
You should see the n8n editor interface securely exposed.
```
🛑 8. Manage Services
```
# Stop

docker-compose down

# Restart
docker-compose restart

# View logs
docker-compose logs -f

```



ℹ️ Notes & Troubleshooting
Ensure security groups allow inbound traffic on port 5678.

If ngrok shows errors, verify your static domain is properly reserved in the ngrok dashboard.

For dynamic URLs (free plan), omit domain: from ngrok.yml and re-run.
