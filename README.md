# 🐱 SIMPLE-ER-DE-PE 🐱

```text
 /\_/\  
( o.o ) 
 > ^ <  [ SCRIPT SETUP VPS INSTANT - PAKE DNF AJA ]
```

[![OS](https://img.shields.io/badge/OS-AlmaLinux%20%7C%20CentOS%20%7C%20RHEL-orange?style=for-the-badge&logo=redhat)](https://github.com/BertyAisyah4/SIMPLE-ER-DE-PE)
[![Docker](https://img.shields.io/badge/Docker-Enabled-blue?style=for-the-badge&logo=docker)](https://github.com/BertyAisyah4/SIMPLE-ER-DE-PE)
[![Cloudflare](https://img.shields.io/badge/Cloudflare-Tunnel-yellow?style=for-the-badge&logo=cloudflare)](https://github.com/BertyAisyah4/SIMPLE-ER-DE-PE)

**SIMPLE-ER-DE-PE** adalah script otomatisasi sakti mandraguna khusus untuk distro berbasis **DNF** (AlmaLinux, CentOS, Rocky Linux, RHEL). Hanya dengan satu kali eksekusi, VPS kamu langsung ganteng, aman, dan siap tempur lengkap dengan Docker, Portainer, Cloudflare Tunnel, dan VNC Desktop!

---

## 🚀 Fitur Utama
* **Auto Update & EPEL Repo** – Sistem langsung up-to-date.
* **UFW Firewall Auto-Lock** – Mengamankan port penting (`22`, `80`, `9000`, `9443`, `6080`).
* **Docker CE Engine** – Instalasi Docker terbaru anti ribet via DNF plugins.
* **Cloudflare Tunnel** – Ekspos aplikasi lokal ke internet dengan aman tanpa buka port publik.
* **Portainer CE** – Manajemen container Docker via Web UI yang intuitif.
* **Ubuntu LXDE VNC Desktop** – Dilengkapi dengan Shared Memory (SHM) **2GB** buat performa rendering GUI yang smooth.

---

## 🛠️ Cara Pakai (Usage)

### ⚡ Wget Instant (Siap Crot)
Tinggal copas perintah di bawah ini ke terminal VPS kamu, lalu tekan `Enter`. Script akan otomatis mendownload, memberi izin eksekusi, dan langsung menjalankan proses installasi sampai selesai.

```bash
wget -O start.sh [https://raw.githubusercontent.com/BertyAisyah4/SIMPLE-ER-DE-PE/main/start.sh](https://raw.githubusercontent.com/BertyAisyah4/SIMPLE-ER-DE-PE/main/start.sh) && chmod +x start.sh && ./start.sh
```

---

## 📑 Langkah Manual

Jika kamu ingin mendownloadnya terlebih dahulu atau melakukan kustomisasi token Cloudflare di dalam file `start.sh`:

1. **Clone atau Download File Script:**
```bash
   wget -O start.sh [https://raw.githubusercontent.com/BertyAisyah4/SIMPLE-ER-DE-PE/main/start.sh](https://raw.githubusercontent.com/BertyAisyah4/SIMPLE-ER-DE-PE/main/start.sh)
   ```

2. **Beri Izin Eksekusi (Executable Permission):**
```bash
   chmod +x start.sh
   ```

3. **Jalankan Script:**
```bash
   ./start.sh
   ```

---

## 🌐 Akses Layanan Setelah Install
Setelah proses installasi sukses, kamu bisa langsung mengakses layanan melalui browser dengan URL berikut:

* **Portainer Dashboard:** `http://IP_VPS_KAMU:9000` atau `https://IP_VPS_KAMU:9443`
* **VNC Desktop (Web):** `http://IP_VPS_KAMU:6080`

---

## 🐾 Catatan Tambahan
* Pastikan kamu sudah mengubah `CLOUDFLARED_TOKEN` di dalam file `start.sh` dengan token tunnel milikmu sendiri agar Cloudflare Tunnel bisa berjalan dengan semestinya.
* Script ini didesain khusus menggunakan package manager `dnf`.

---
Dibuat dengan ❤️ dan 🐾 untuk efisiensi setup server.  
