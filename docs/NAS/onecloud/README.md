# 玩客云折腾记录

## docker

常用docker
``` shell
# debian
docker pull arm32v7/debian

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
```

## nginx+php
[phpapi-20151012](https://packages.debian.org/stretch/phpapi-20151012)

安装omv时，会由于pho7.4无法安装phpapi导致安装失败，此时导入清华OMV源即可安装成功

[清华OMV源](https://mirrors-i.tuna.tsinghua.edu.cn/help/openmediavault/)

## kodexplorer