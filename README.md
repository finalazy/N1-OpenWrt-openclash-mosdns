![固件预览](https://raw.githubusercontent.com/cjlhll/N1-OpenWrt/master/preview.png)  
固件适配情况：  
&emsp;&emsp;本固件目前专为N1的网关服务器(旁路由)模式适配，已添加必要的iptables规则并进行了较大力度的精简。  
>本固件默认只支持IPV4，且不能进行PPPOE拨号。
    
插件与说明：  
&emsp;&emsp;仅包含openclash(科学上网)，阿里ddns(远程访问)，阿里云盘webDav，adguard home。  
&emsp;&emsp;主题：只有默认的argon
&emsp;&emsp;网络加速：turboacc等插件只适用于主路由模式，做网关服务器并不需要。
>本固件不会加入过多功能，需要高大全版本的朋友请用flippy大佬发布的固件。
  
内核与更新：  
&emsp;&emsp;每天凌晨2点更新，每年将内核切换到最新的6年LTS版本。
>目前使用的是5.15系列内核 https://github.com/breakings/OpenWrt/tree/main/opt/kernel
  
个性化定制：  
&emsp;&emsp;Fork后参考[固件个性化定制说明](https://github.com/ophub/amlogic-s9xxx-openwrt/blob/main/router-config/README.cn.md)编辑.config文件即可。  
  
flippy最新恩山论坛帖子：  
&emsp;&emsp;https://www.right.com.cn/forum/thread-4076037-1-1.html
