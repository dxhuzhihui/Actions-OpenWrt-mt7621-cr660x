#!/bin/bash
#
# This Workflow file is based on P3TERX's Actions-OpenWrt:
# https://github.com/P3TERX/Actions-OpenWrt
# Thanks for his hard work!
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Add kenzok8's openwrt packages source to feeds.conf.default
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default