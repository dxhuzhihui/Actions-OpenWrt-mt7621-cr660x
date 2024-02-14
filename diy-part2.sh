#!/bin/bash
#
# This Workflow file is based on P3TERX's Actions-OpenWrt:
# https://github.com/P3TERX/Actions-OpenWrt
# Thanks for his hard work!
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# Modify Default Timezone 
sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate

# Modify Default hostname
sed -i 's/OpenWrt/CR6609/g' package/base-files/files/bin/config_generate

# Modify Default WiFi ssid
sed -i 's/ImmortalWrt/SakuraNyan_CR6609/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Replace Lean's OpenWrt Argon Theme
rm -rf feeds/luci/themes/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config && git clone https://github.com/jerrykuku/luci-app-argon-config.git feeds/luci/applications/luci-app-argon-config

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/lean/default-settings/files/zzz-default-settings
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt-SakuraNyan '/g" package/lean/default-settings/files/zzz-default-settings
echo "DISTRIB_SOURCECODE='lean-lede'" >> package/base-files/files/etc/openwrt_release

# Remove Extra Source
sed -i "s/#ln -sf \/sbin\/ip \/usr\/bin\/ip/sed\ -i\ \'\/kenzok\/d\' \/etc\/opkg\/distfeeds.conf/g" package/lean/default-settings/files/zzz-default-settings

# Replace Argon Theme Default Background
cp -f $GITHUB_WORKSPACE/background.jpg feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# Replace Banner
cp -f $GITHUB_WORKSPACE/banner package/base-files/files/etc/banner

# Set "luci-theme-argon" theme to default theme
sed -i 's/bootstrap/argon/g' ./feeds/luci/modules/luci-base/root/etc/config/luci

# Modify Argon Theme Settings
sed -i 's/#5e72e4/#4f719e/g' feeds/luci/applications/luci-app-argon-config/root/etc/config/argon
sed -i 's/#483d8b/#4f719e/g' feeds/luci/applications/luci-app-argon-config/root/etc/config/argon
sed -i 's/bing/none/g' feeds/luci/applications/luci-app-argon-config/root/etc/config/argon
