#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [username]"
    exit 1
fi

passwd

systemctl enable systemd-networkd-wait-online.service

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

useradd -m -G wheel -s /bin/bash $1
passwd $1
su -l $1

systemctl disable systemd-not
