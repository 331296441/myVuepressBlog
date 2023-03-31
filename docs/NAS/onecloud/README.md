# 玩客云折腾记录


## 源
``` shell
# debian替换中科大源
sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# ubuntu替换中科大源
sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list

# centos7替换中科大源
sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.ustc.edu.cn/centos|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-Base.repo

# centos更新缓存
yum makecache


# openwrt替换中科大源
sed -i 's/downloads.openwrt.org/mirrors.ustc.edu.cn\/openwrt/g' /etc/opkg/distfeeds.conf
```


## docker

常用docker
``` shell
# debian
docker pull arm32v7/debian

# debian能使用systemctl
docker run -itd --name centos-systemd -p 40080:80 --restart=no --privileged=true arm32v7/centos:7.9.2009 /usr/sbin/init

# docker内安装必要工具
apt update && apt install -y net-tools apt-utils wget curl vim systemctl tmux neofetch

# nextcloud
docker pull arm32v7/nextcloud

# mysql 
docker pull biarms/mysql
## 为树莓派准备的mysql也能用
docker run --name mysql -e MYSQL_ROOT_PASSWORD=123456 -d -p 3306:3306 hypriot/rpi-mysql

# openwrt
docker pull chinkiang/onecloud_openwrt

# jellyfin
docker pull jellyfin/jellyfin

# centos7
docker pull arm32v7/centos:7.9.2009

# redis
docker pull arm32v7/redis

# phpmyadmin
docker pull arm32v7/phpmyadmin:latest
```

## nginx+php
[phpapi-20151012](https://packages.debian.org/stretch/phpapi-20151012)

安装omv时，会由于pho7.4无法安装phpapi导致安装失败，此时导入清华OMV源即可安装成功

[清华OMV源](https://mirrors-i.tuna.tsinghua.edu.cn/help/openmediavault/)

替换成清华源
``` shell
cat <<EOF > /etc/apt/sources.list.d/openmediavault.list
deb https://mirrors.tuna.tsinghua.edu.cn/OpenMediaVault/public shaitan main
deb https://mirrors.tuna.tsinghua.edu.cn/OpenMediaVault/packages shaitan main
## Uncomment the following line to add software from the proposed repository.
# deb https://mirrors.tuna.tsinghua.edu.cn/OpenMediaVault/public shaitan-proposed main
# deb https://mirrors.tuna.tsinghua.edu.cn/OpenMediaVault/packages shaitan-proposed main
## This software is not part of OpenMediaVault, but is offered by third-party
## developers as a service to OpenMediaVault users.
# deb https://mirrors.tuna.tsinghua.edu.cn/OpenMediaVault/public shaitan partner
# deb https://mirrors.tuna.tsinghua.edu.cn/OpenMediaVault/packages shaitan partner
EOF
```

## kodexplorer