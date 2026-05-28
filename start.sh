#!/bin/bash

# =================================================================
# SCRIPT INSTALLASI OTOMATIS (KHUSUS DNF - ALMALINUX/CENTOS/RHEL)
# =================================================================

set -e

# --- KONFIGURASI ---
CLOUDFLARED_TOKEN="UBAH TOKET"

# --- UPDATE & INSTALL UFW ---
echo "[1/7] Update system & Install UFW..."
sudo dnf update -y
sudo dnf install epel-release -y
sudo dnf install ufw -y

echo "[2/7] Konfigurasi Firewall..."
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 9000/tcp
sudo ufw allow 9443/tcp
sudo ufw allow 6080/tcp
sudo ufw --force enable

# --- INSTALL DOCKER ---
echo "[3/7] Install Docker CE..."
if ! command -v docker >/dev/null 2>&1; then
    echo "Menambahkan Repo Docker dan menginstall Docker CE..."
    sudo dnf install -y dnf-plugins-core
    sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo dnf install -y docker-ce docker-ce-cli containerd.io
else
    echo "Docker sudah ada."
fi

# --- SERVICE START ---
echo "[4/7] Menjalankan Docker..."
sudo systemctl enable docker
sudo systemctl start docker

# --- SETUP DOCKER ENV ---
echo "[5/7] Membuat Docker Network & Volume..."
sudo docker network create tunnel 2>/dev/null || true
sudo docker volume create portainer_data 2>/dev/null || true

# --- RUN CONTAINERS ---
echo "[6/7] Menjalankan Cloudflare Tunnel..."
sudo docker rm -f cloudflared 2>/dev/null || true
sudo docker run -d --name cloudflared --network tunnel --restart=always cloudflare/cloudflared:latest tunnel --no-autoupdate run --token "$CLOUDFLARED_TOKEN"

echo "[7/7] Menjalankan Portainer & VNC (SHM 2GB)..."
sudo docker rm -f portainer 2>/dev/null || true
sudo docker run -d --name portainer --network tunnel --restart=always -p 9000:9000 -p 9443:9443 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

sudo docker rm -f vnc 2>/dev/null || true
sudo docker run -d --name vnc --network tunnel --restart=always --shm-size=2g -p 6080:80 dorowu/ubuntu-desktop-lxde-vnc

echo "------------------------------------------------"
echo "INSTALLASI BERHASIL!"
echo "Portainer : http://$(curl -s ifconfig.me):9000"
echo "VNC Desk  : http://$(curl -s ifconfig.me):6080"
echo "------------------------------------------------"
