#!/bin/bash

sudo apt update
sudo apt install -y curl git procps socat zip s3fs
curl -L https://github.com/TapeWerm/MCscripts/archive/refs/heads/master.zip -o /tmp/master.zip
unzip /tmp/master.zip -d /tmp
sudo /tmp/MCscripts-master/install.sh
sudo mkdir /s3fs
sudo touch /etc/.passwd-s3fs
sudo chmod 0600 /etc/.passwd-s3fs
echo "${bucket_access_key}:${bucket_secret_key}" | sudo tee /etc/.passwd-s3fs > /dev/null
echo "${bucket_name} /s3fs fuse.s3fs _netdev,nomultipart,use_path_request_style,passwd_file=/etc/.passwd-s3fs,url=https://${bucket_namespace}.compat.objectstorage.ca-toronto-1.oraclecloud.com,uid=`id -u mc`,gid=`id -g mc`,allow_other" | sudo tee -a /etc/fstab > /dev/null
sudo mount -a
sudo ln -snf /s3fs ~mc/backup_dir
echo Y | sudo ~mc/mcbe_setup.sh MCBE
sudo systemctl enable mcbe@MCBE.socket mcbe@MCBE.service mcbe-backup@MCBE.timer --now
sudo systemctl enable mcbe-getzip.timer mcbe-autoupdate@MCBE.service --now
sudo systemctl enable mcbe-rmbackup@MCBE.service --now
