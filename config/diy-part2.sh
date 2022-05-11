# Modify some code adaptation
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.2/g' package/base-files/files/bin/config_generate

# Modify default root's password（FROM 'password'[$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.] CHANGE TO 'your password'）
#sed -i 's/root::0:0:99999:7:::/root:$1$yMQfLKxB$gtGxa4n2QGmgIKjUB7q3m.:0:0:99999:7:::/g' /etc/shadow

#这代表是哪一天设置的密码，openssh要检查这个，dropbear不检查
#secs=$(date +%s)
#days=$((secs / 86400))
#sed -e "s/:0:0:99999:/:${days}:0:99999:/g"  -i /etc/shadow

#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk package/luci-app-amlogic

svn co https://github.com/vernesong/OpenClash.git package/lean/luci-app-openclash

svn co https://github.com/chenhw2/luci-app-aliddns.git package/feeds/luci-app-aliddns

rm -rf feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile
git clone https://github.com/kenzok8/small-package/tree/main/luci-app-ssr-plus package/luci-app-ssr-plus
