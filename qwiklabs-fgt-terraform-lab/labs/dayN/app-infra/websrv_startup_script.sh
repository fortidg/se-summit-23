apt update
apt install nodejs npm -y
cd /opt
git clone https://github.com/bartekmo/xperts2022-dayapptf.git
cd xperts2022-dayapptf/app
npm install
TODAY=Tuesday node .
