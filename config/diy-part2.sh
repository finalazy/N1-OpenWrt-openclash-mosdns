# Modify some code adaptation
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.3.101/g' package/base-files/files/bin/config_generate

# Add haproxy
rm -f package/feeds/packages/haproxy
svn co https://github.com/nantayo/Haproxy/trunk package/feeds/packages/haproxy

# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk package/luci-app-amlogic

# Add luci-app-dnsfilter
svn co https://github.com/kiddin9/luci-app-dnsfilter/trunk package/luci-app-dnsfilter

# Add luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk package/openwrt-passwall

git clone https://github.com/vernesong/OpenClash.git package/lean/luci-app-openclash

