# setup new comp
1. netinst debian stable
2. only system tools (and printer and/or ssh server)
3. sudo apt-get install firmware-iwlwifi 

# copy files
```
sudo mount /dev/sda1 /mnt
cp -pur /mnt/* ~/
```
