# Simple_VPS_Tools

VPS 简单实用命令行工具一键安装脚本：压缩/解压缩、系统资源监视、路由追踪、DNS 查询、Speedtest 测试、加密文件传输

支持 x86_64 和 aarch64 架构，理论上适用各种 linux 主流发行版 （没有精力详细测试）。

此脚本内工具均为独立执行文件，安装至 /usr/local/bin 目录下。

只有安装过程依赖 wget，如系统无 wget 命令请自行安装。

## 安装

```console
wget -O - 'https://raw.githubusercontent.com/wy580477/Simple_VPS_Tools/main/install.sh' | sh
```

如需更新，重新执行安装命令即可。

## 卸载
```console
rm -f /usr/local/bin/ouch /usr/local/bin/btop /usr/local/bin/nexttrace /usr/local/bin/doggo /usr/local/bin/speedtest /usr/local/bin/wormhole
```

## 鸣谢

- [ouch-org/ouch](https://github.com/ouch-org/ouch) 简单易用压缩/解压缩工具，再也不怕忘记解压缩命令了。
- [aristocratos/btop](https://github.com/aristocratos/btop) 炫酷系统资源监视工具
- [sjlleo/nexttrace](https://github.com/sjlleo/nexttrace) 可视化路由追踪工具
- [mr-karan/doggo](https://github.com/mr-karan/doggo) DNS 查询工具，支持 UDP/TCP/TLS/DOH 多种协议
- [Speedtest CLI](https://www.speedtest.net/apps/cli) 来自 speedtest.net 的网络测试工具
- [psanford/wormhole-william](https://github.com/psanford/wormhole-william) 非常易用的端到端加密文件传输工具，使用一次性的接收码

