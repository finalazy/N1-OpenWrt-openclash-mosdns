# Modify some code adaptation
#sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile
# Modify default IP
sed -i 's/192.168.1.1/192.168.5.2/g' package/base-files/files/bin/config_generate

# Add luci-app-amlogic
#svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
# 1.Set the download repository of the OpenWrt files to your github.com
#sed -i "s|https.*/OpenWrt|https://github.com/cjlhll/N1-OpenWrt|g" package/luci-app-amlogic/root/etc/config/amlogic
# 2.Set the keywords of Tags in your github.com Releases
#sed -i "s|ARMv8|openwrt|g" package/luci-app-amlogic/root/etc/config/amlogic

# => 阿里云web dav
git clone https://github.com/messense/aliyundrive-webdav.git package/luci-app-aliyundrive-webdav
# => 阿里ddns
git clone https://github.com/chenhw2/luci-app-aliddns.git package/luci-app-aliddns
# => dockerman
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
# => passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git -b packages package/passwall_package
git clone https://github.com/xiaorouji/openwrt-passwall.git -b luci package/passwall

# => 更换默认argon主题
rm -rf feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile
