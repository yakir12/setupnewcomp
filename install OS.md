# setup new comp
netinst debian stable
system tools and printer server
no swap

# copy files
sudo mount /dev/sda1 /mnt
cp -pur /mnt/* /home/yakir/
