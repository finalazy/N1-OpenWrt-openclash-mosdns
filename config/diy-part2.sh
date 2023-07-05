# Modify some code adaptation
#sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.2/g' package/base-files/files/bin/config_generate

#修改密码
sed -i 's/^root:.*:/root:$1$KVHNuqbv$4X2BPbtsXn2AApknHIn38.:0:0:99999:7:::/g' package/base-files/files/etc/shadow

#docker 修改start--------------------------->
# 查找并分区 U 盘
U_DISK=""
while read -r line; do
    if [[ $line == *"/dev/sd"* ]]; then
        size=$(echo "$line" | awk '{print $4}')
        if (( ${size%G} >= 20 )); then
            U_DISK=$(echo "$line" | awk '{print $1}')
            break
        fi
    fi
done < <(lsblk -o NAME,SIZE,MOUNTPOINT)

if [ -n "$U_DISK" ]; then
    (
    echo o
    echo n
    echo p
    echo 1
    echo
    echo
    echo w
    ) | fdisk "$U_DISK"

    mkfs.ext4 "${U_DISK}1"
fi

# 修改 /etc/docker/daemon.json 文件中的 data-root 参数
sed -i 's/"data-root": "\(.*\)"/"data-root": "\/opt\/docker\/"/' /etc/docker/daemon.json

# 修改 /etc/config/dockerd 文件中的 auto_start 参数
sed -i 's/option auto_start .*/option auto_start '\''1'\''/' /etc/config/dockerd

#docker 修改end--------------------------->

# => 阿里云web dav
git clone https://github.com/messense/aliyundrive-webdav.git package/luci-app-aliyundrive-webdav
# => alist
#rm -rf feeds/packages/lang/golang
#svn export https://github.com/sbwml/packages_lang_golang/branches/19.x feeds/packages/lang/golang
#git clone https://github.com/sbwml/luci-app-alist package/alist

# => 阿里ddns
git clone https://github.com/chenhw2/luci-app-aliddns.git package/luci-app-aliddns

# => dockerman
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman

# => openclash
git clone https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# => passwall2
#git clone https://github.com/xiaorouji/openwrt-passwall.git -b packages package/passwall_package
#git clone https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2

# => 删除默认argon主题
rm -rf feeds/luci/themes/luci-theme-argon

#主题
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile
