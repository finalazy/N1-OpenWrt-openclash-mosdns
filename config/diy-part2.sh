# Modify some code adaptation
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.2/g' package/base-files/files/bin/config_generate

sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# Add haproxy
rm -f package/feeds/packages/haproxy
#svn co https://github.com/nantayo/Haproxy/trunk package/feeds/packages/haproxy

# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk package/luci-app-amlogic

# Add luci-app-dnsfilter
#svn co https://github.com/kiddin9/luci-app-dnsfilter/trunk package/luci-app-dnsfilter

# Add luci-app-passwall
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk package/openwrt-passwall

svn co https://github.com/vernesong/OpenClash.git package/lean/luci-app-openclash


svn co https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
svn co https://github.com/chenhw2/luci-app-aliddns.git package/feeds/luci-app-aliddns

sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile
