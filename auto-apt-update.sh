#cron job

sudo echo " " >> /var/log/up.sh.log
sudo echo "started on $(date) " >> /var/log/up.sh.log

sudo echo "$(sudo apt-get update)" >> /var/log/up.sh.log && \
sudo echo "$(sudo apt-get upgrade -y)" >> /var/log/up.sh.log && \
sudo echo "$(sudo apt-get -y autoremove)" >> /var/log/up.sh.log && \

sudo echo "completed on $(date)" >> /var/log/up.sh.log
