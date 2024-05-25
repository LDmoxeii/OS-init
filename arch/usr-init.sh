echo "enter username: "
read username

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

useradd -m -G wheel -s /bin/bash $user_name

passwd $username

su $username

# Arch.exe config --default-user moxeii