mkdir -p /opt/ssh/

chown pythony:pythony /etc/systemd/system/sshd.service
ssh-keygen -q -N "" -t dsa -f /opt/ssh/ssh_host_dsa_key
ssh-keygen -q -N "" -t rsa -b 4096 -f /opt/ssh/ssh_host_rsa_key
ssh-keygen -q -N "" -t ecdsa -f /opt/ssh/ssh_host_ecdsa_key
ssh-keygen -q -N "" -t ed25519 -f /opt/ssh/ssh_host_ed25519_key

chmod 600 /opt/ssh/*
chmod 644 /opt/ssh/sshd_config
chown -R pythony. /opt/ssh/
systemctl daemon-reload

home_py="/home/pythony"
mkdir -p /home/pythony/EXTRAT/
mkdir /home/pythony/EXTRAT/firefox-58.0.1/
mkdir /home/pythony/EXTRAT/firefox-60.0.1esr/
mkdir $home_py/EXTRAT/firefox-97.0.1/


############## firefox-60.0
wget -q https://ftp.mozilla.org/pub/firefox/releases/60.0.1esr/linux-x86_64/en-US/firefox-60.0.1esr.tar.bz2 && tar -xf firefox-60.0.1esr.tar.bz2 -C $home_py/EXTRAT/firefox-60.0.1esr/
rm firefox-60.0.1esr.tar.bz2 
wget -q https://ftp.mozilla.org/pub/firefox/releases/58.0.1/linux-x86_64/en-GB/firefox-58.0.1.tar.bz2 && tar -xf firefox-58.0.1.tar.bz2 -C $home_py/EXTRAT/firefox-58.0.1/
rm firefox-58.0.1.tar.bz2

 wget -q https://ftp.mozilla.org/pub/firefox/releases/97.0.1/linux-x86_64/en-GB/firefox-97.0.1.tar.bz2 && tar -xf firefox-97.0.1.tar.bz2 -C $home_py/EXTRAT/firefox-97.0.1/

wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -q https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
wget -q https://github.com/thingst0d0/g00rm/raw/main/ocs-url_3.1.0-0ubuntu1_amd64.deb
#########################################################################################

echo " * 3 ------------- > INSTALL geckodriver-v0.32.0 "
wget -q https://github.com/mozilla/geckodriver/releases/download/v0.32.0/geckodriver-v0.32.0-linux64.tar.gz && tar -xf geckodriver-v0.32.0-linux64.tar.gz
rm geckodriver-v0.32.0-linux64.tar.gz
chmod +x geckodriver
mv geckodriver /usr/bin/geckodriver-30
wget -q https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-linux64.tar.gz && tar -xf geckodriver-v0.25.0-linux64.tar.gz
chmod +x geckodriver
mv geckodriver /usr/bin/geckodriver22
wget -q https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz && tar -xf geckodriver-v0.26.0-linux64.tar.gz
chmod 600 geckodriver
mv geckodriver /usr/bin/geckodriver-26
#########################################################################################

git clone https://github.com/GH0STAV0/SDA_ALL.git /home/pythony/SDA_ALL
#########################################################################################

chown pythony:pythony /usr/bin/geckodriver-30
chown root:input /usr/lib/xorg/Xorg
chmod g+s /usr/lib/xorg/Xorg
adduser pythony video
cat /etc/X11/Xwrapper.config
sed -i 's/console/anybody/g' /etc/X11/Xwrapper.config
#dpkg-reconfigure xserver-xorg-legacy
dpkg-reconfigure xserver-xorg-legacy allowed_users=anybody

cat /etc/X11/Xwrapper.config
echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /home/pythony/.bashrc

