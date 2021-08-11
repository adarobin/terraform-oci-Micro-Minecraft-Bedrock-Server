#!/bin/bash

sudo apt update
sudo apt install -y curl git procps socat zip s3fs
git clone https://github.com/TapeWerm/MCscripts.git
cd MCscripts
sudo adduser --home /opt/MC --system mc
sudo cp *.{sed,sh} ~mc/
sudo chown -h mc:nogroup ~mc/*
sudo cp systemd/* /etc/systemd/system/
sudo mkdir ~mc/bedrock
echo Y | sudo su mc -s /bin/bash -c '~/mcbe_getzip.sh'
sudo ~mc/mcbe_autoupdate.sh ~mc/bedrock/MCBE
sudo chown -R mc:nogroup ~mc/bedrock
sudo touch /etc/.passwd-s3fs
sudo chmod 0600 /etc/.passwd-s3fs
sudo mkdir /opt/MC/backup_dir
echo "${bucket_access_key}:${bucket_secret_key}" | sudo tee /etc/.passwd-s3fs > /dev/null
echo "${bucket_name} /opt/MC/backup_dir fuse.s3fs _netdev,nomultipart,use_path_request_style,passwd_file=/etc/.passwd-s3fs,url=https://${bucket_namespace}.compat.objectstorage.ca-toronto-1.oraclecloud.com,uid=`id -u mc`,gid=`id -g mc`,allow_other" | sudo tee -a /etc/fstab > /dev/null
sudo mount -a
sudo systemctl enable mcbe@MCBE.socket mcbe@MCBE.service mcbe-backup@MCBE.timer mcbe-getzip.timer mcbe-autoupdate@MCBE.service --now
#sudo systemctl enable mcbe-rmbackup@MCBE.service --now
