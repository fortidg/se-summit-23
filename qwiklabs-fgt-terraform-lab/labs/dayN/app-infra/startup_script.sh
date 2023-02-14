apt update
apt install nginx -y
cd /var/www/html
curl "http://metadata.google.internal/computeMetadata/v1/instance/attributes/app-code" -H "Metadata-Flavor: Google" | base64 -d | tar -zxvf -