重要说明——2022.1.6：  
目前v2ray最新的5.0.2和前一版5.0.1是开发者预览版，它们存在某些莫名的适应性bug，可能导致passwall的tcp/udp无法使用等问题。  
当你使用其它版本的v2ray内核遇到问题时,请在 https://github.com/v2fly/v2ray-core/releases/tag/v4.44.0 下载 v2ray-linux-arm64-v8a.zip  
解压后只需要里面名称为v2ray 的文件，然后用winscp等工具将N1的/usr/bin目录下的 v2ray 这个文件手动替换成4.44.0版本文件。  
不建议使用开发者预览版的v2ray内核！请过一段时间后再考虑更新到新的正式版本！  
注：本段说明将在v2ray最新版切换到正式版本后删除。  

![固件预览](https://raw.githubusercontent.com/nantayo/N1-OpenWrt/master/preview.jpg)  
固件适配情况：  
&emsp;&emsp;本固件目前专为N1的网关服务器(旁路由)模式适配，已添加必要的iptables规则并进行了较大力度的精简。  
>本固件默认只支持IPV4，且不能进行PPPOE拨号。
    
插件与说明：  
&emsp;&emsp;仅包含passwall(科学上网)和dnsfilter(去广告)。  
&emsp;&emsp;主题：只有默认的bootstrap，想必纯翻墙用的固件应该没人在意主题罢(无关心  
&emsp;&emsp;科学上网：ssr+，passwall，clash三大插件当中，clash分流更精细，但性能需求明显更高，S905D性能比较一般，不建议使用。另两者当中，passwall可以很简单的配置负载均衡，廉价机场的使用体验更有保障，于是最终决定使用passwall。  
&emsp;&emsp;去广告：ADGH体积大，配置繁琐，考虑到路由器端去广告只能从域名层次入手，不像浏览器可以更精细的屏蔽页面元素，所以轻量的dnsfilter就足够了。  
&emsp;&emsp;网络加速：turboacc等插件只适用于主路由模式，做网关服务器并不需要。
>本固件不会加入过多功能，需要高大全版本的朋友请用flippy大佬发布的固件。
  
内核与更新：  
&emsp;&emsp;每月1日更新，每年将内核切换到最新的6年LTS版本。内核版本更新前会先测试U盘和EMMC启动，均正常使用才会更新。
>目前使用的是5.10系列内核。
  
个性化定制：  
&emsp;&emsp;Fork后参考[固件个性化定制说明](https://github.com/ophub/amlogic-s9xxx-openwrt/blob/main/router-config/README.cn.md)编辑.config文件即可。  
  
flippy最新恩山论坛帖子：  
&emsp;&emsp;https://www.right.com.cn/forum/thread-4076037-1-1.html
