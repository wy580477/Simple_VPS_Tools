# Simple_VPS_Tools

VPS 简单实用命令行工具一键安装脚本, 包括：

压缩/解压缩、系统资源监视、TCP/HTTP/HTTPS Ping、路由追踪、DNS 查询、Speedtest 测试、加密文件传输、磁盘和目录占用空间查看、更容易使用的 find 命令、有代码高亮功能的 cat 命令。

支持 x86_64 和 aarch64 架构，理论上适用各种 linux 主流发行版 （没有精力详细测试）。

此脚本内工具均为独立执行文件，安装至 /usr/local/bin 目录下，大概占用 60MB 左右磁盘空间。

安装过程依赖 wget，如系统无 wget 命令请自行安装。Alpine Linux 使用 wormhole 需要安装 gcompat: "apk add gcompat"。

## 安装

```console
wget -O - 'https://raw.githubusercontent.com/wy580477/Simple_VPS_Tools/main/install.sh' | sh
```

如需更新，重新执行安装命令即可。

## 卸载
```console
rm -f /usr/local/bin/ouch /usr/local/bin/btop /usr/local/bin/tcping /usr/local/bin/nexttrace /usr/local/bin/q /usr/local/bin/nali /usr/local/bin/speedtest /usr/local/bin/wormhole /usr/local/bin/duf /usr/local/bin/gdu /usr/local/bin/fd /usr/local/bin/bat
```
```
## 命令示例
```console
# 解压缩:            
ouch d <文件>
# btop 系统资源监视:
btop
# TCP/HTTP/HTTPS Ping:
tcping 1.1.1.1 443
tcping [2606:4700::1111] 443
tcping http://www.google.com
tcping https://www.google.com
# 路由追踪:   
nexttrace <ip/域名>'
# IP 地理信息查询:
nali 1.1.1.1
# DNS 查询:
q <domain> A AAAA @1.1.1.1 -S
q <domain> A AAAA @tcp://1.1.1.1 -S
q <domain> A AAAA @tls://1.1.1.1 -S
q <domain> A AAAA @https://1.1.1.1/dns-query -S
# speedtest 网速测试:
speedtest
# 端到端加密文件传输:
wormhole send <文件/目录>
# 磁盘空间使用情况查看
duf
# 目录占用空间分析
gdu <path>
# 更容易使用的 find 命令
fd <字符串> <路径>
# 有代码高亮功能的 cat 命令
bat <文件>
```

## 鸣谢

- [ouch-org/ouch](https://github.com/ouch-org/ouch) 简单易用压缩/解压缩工具，再也不怕忘记解压缩命令了。
- [aristocratos/btop](https://github.com/aristocratos/btop) 炫酷系统资源监视工具
- [sjlleo/nexttrace](https://github.com/sjlleo/nexttrace) 可视化路由追踪工具
- [zu1k/nali](https://github.com/zu1k/nali) IP 地理信息查询工具
- [natesales/q](https://github.com/natesales/q) DNS 查询工具，支持 UDP/TCP/TLS/DOH 多种协议
- [Speedtest CLI](https://www.speedtest.net/apps/cli) 来自 speedtest.net 的网络测试工具
- [psanford/wormhole-william](https://github.com/psanford/wormhole-william) 非常易用的端到端加密文件传输工具，使用一次性的接收码
- [muesli/duf](https://github.com/muesli/duf) 简单易用的磁盘使用空间查看工具，比 df 命令更直观
- [dundee/gdu](https://github.com/dundee/gdu) 简单易用可互动的目录占用空间分析工具，比 du 命令更直观
- [sharkdp/fd](https://github.com/sharkdp/fd) 更容易使用的 find 命令
- [sharkdp/bat](https://github.com/sharkdp/bat) 有代码高亮功能的 cat 命令
- [cloverstd/tcping](https://github.com/cloverstd/tcping) TCP/HTTP/HTTPS Ping 工具
