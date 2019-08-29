# setup new comp
1. netinst debian stable
2. only system tools (and printer and/or ssh server)

# copy files
```
sudo mount /dev/sda1 /mnt
cp -pur /mnt/* ~/
```
