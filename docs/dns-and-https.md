### Domain Setup (NameSilo)

The domain safetunnel.icu was registered using NameSilo.

The following A-records were added in the NameSilo “DNS Records” panel:

| Type | Host | Value | Purpose |
|------|------|-------|---------|
| A    | @    | 74.162.57.96 | Root domain |
| A    | www  | 74.162.57.96 | Supports www.safetunnel.icu |


DNS propagation completed within a few minutes.
Proof: screenshots/dns-records.png

## Nginx Configuration

The Nginx configuration for the domain is stored in:

/etc/nginx/sites-available/safetunnel

# HTTPS Server Block (Port 443)
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name safetunnel.icu;

    # API Reverse Proxy (key hidden for security)
    location /api/ {
        proxy_pass http://127.0.0.1:80;
        proxy_set_header X-API-Key ********;
    }

    # Status Interfaces
    location = /status      { try_files /status.html =404; }
    location = /status.json { try_files /status.json =404; }

    # Static Dashboard Files
    location / {
        try_files $uri $uri/ =404;
    }

    # SSL Certificates (managed by Certbot)
    ssl_certificate /etc/letsencrypt/live/safetunnel.icu/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/safetunnel.icu/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
}


Proof: screenshots/nginx-https-block.png

## HTTP Redirect Block (Port 80)

Certbot created this block to force all http → https traffic:

server {
    if ($host = safetunnel.icu) {
        return 301 https://$host$request_uri;
    }

    listen 80;
    listen [::]:80;
    server_name safetunnel.icu;

    return 404; # managed by Certbot
}


Proof: screenshots/nginx-http-redirect.png

## Certbot Installation

HTTPS was configured using:

sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d safetunnel.icu


Certbot handled:

SSL certificate generation

Nginx integration

Automatic renewal

HTTP→HTTPS redirection

To verify certificates:

sudo certbot certificates

##Conclusion

DNS was successfully configured through NameSilo, and HTTPS was implemented using Certbot. The domain safetunnel.icu now loads securely with valid SSL certificates, and all traffic is correctly redirected from HTTP to HTTPS. This significantly improves reliability, security, and professionalism of the SafeTunnel system.

