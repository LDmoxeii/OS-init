echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

useradd -m -G wheel -s /bin/bash moxeii

passwd moxeii

su moxeii

# Arch.exe config --default-user moxeii