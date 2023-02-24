#!/bin/sh

set -e

DIR_TMP="$(mktemp -d)"

OS_type="$(uname -m)"
case "$OS_type" in
x86_64 | amd64)
    OS_type='x86_64'
    OS_type2='amd64'
    OS_type3='x86_64'
    OS_type4='amd64_static'
    OS_type5='i686-unknown-linux-musl'
    OS_type6='x86_64-unknown-linux-musl'
    ;;
aarch64 | arm64)
    OS_type='aarch64'
    OS_type2='arm64'
    OS_type3='arm64'
    OS_type4='arm64'
    OS_type5='aarch64-unknown-linux-gnu'
    OS_type6='aarch64-unknown-linux-gnu'
    ;;
*)
    echo 'OS type not supported'
    exit 2
    ;;
esac

# Install ouch
echo 'Installing ouch: Painless compression and decompression for your terminal'
wget -qO - https://github.com/ouch-org/ouch/releases/latest/download/ouch-${OS_type}-unknown-linux-musl.tar.gz | tar xz -C ${DIR_TMP}
install -m 755 ${DIR_TMP}/ouch*/ouch /usr/local/bin/ouch

# Install btop
echo 'Installing btop: A monitor of resources'
wget -qP ${DIR_TMP} https://github.com/aristocratos/btop/releases/latest/download/btop-${OS_type}-linux-musl.tbz
ouch d ${DIR_TMP}/btop* --dir ${DIR_TMP} -q
install -m 755 ${DIR_TMP}/btop*/bin/btop /usr/local/bin/btop

# Install tcping
echo 'Installing tcping: ping over a tcp connection'
wget -qO - https://github.com/wy580477/tcping/releases/download/v0.1.4/tcping-linux-${OS_type2}-v0.1.4@0e63df4736.tar.gz | tar xz -C ${DIR_TMP}
install -m 755 ${DIR_TMP}/linux*/tcping /usr/local/bin/tcping

# Install nexttrace
echo 'Installing nexttrace: An open source visual route tracking CLI tool'
wget -qO /usr/local/bin/nexttrace https://github.com/sjlleo/nexttrace/releases/latest/download/nexttrace_linux_${OS_type2}
chmod +x /usr/local/bin/nexttrace

# Install doggo
echo 'Installing doggo: Command-line DNS Client for Humans'
RELEASE_LATEST="$(wget -o - -O /dev/null https://github.com/mr-karan/doggo/releases/latest | grep -o 'v[0-9]*\..*' | tail -1)"
wget -qO - https://github.com/mr-karan/doggo/releases/download/${RELEASE_LATEST}/doggo_${RELEASE_LATEST#v}_linux_${OS_type2}.tar.gz | tar xz -C ${DIR_TMP}
install -m 755 ${DIR_TMP}/doggo /usr/local/bin/doggo

# Install speedtest
echo 'Installing speedtest-cli: Internet connection measurement'
wget -qO - https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-${OS_type}.tgz | tar xz -C ${DIR_TMP}
install -m 755 ${DIR_TMP}/speedtest /usr/local/bin/speedtest

# Install wormhole-william
echo 'Installing wormhole-william: End-to-end encrypted file transfer'
wget -qO /usr/local/bin/wormhole https://github.com/psanford/wormhole-william/releases/latest/download/wormhole-william-linux-${OS_type2}
chmod +x /usr/local/bin/wormhole

# Install duf
echo 'Installing duf: Disk Usage/Free Utility'
RELEASE_LATEST="$(wget -o - -O /dev/null https://github.com/muesli/duf/releases/latest | grep -o 'v[0-9]*\..*' | tail -1)"
wget -qO - https://github.com/muesli/duf/releases/download/${RELEASE_LATEST}/duf_${RELEASE_LATEST#v}_linux_${OS_type3}.tar.gz | tar xz -C ${DIR_TMP}
install -m 755 ${DIR_TMP}/duf /usr/local/bin/duf

# Install gdu
echo 'Installing gdu: Fast disk usage analyzer'
wget -qO - https://github.com/dundee/gdu/releases/latest/download/gdu_linux_${OS_type4}.tgz | tar xz -C ${DIR_TMP}
install -m 755 ${DIR_TMP}/gdu_linux_${OS_type4} /usr/local/bin/gdu

# Install fd
echo 'Installing fd: A simple, fast and user-friendly alternative to find'
RELEASE_LATEST="$(wget -o - -O /dev/null https://github.com/sharkdp/fd/releases/latest | grep -o 'v[0-9]*\..*' | tail -1)"
wget -qO - https://github.com/sharkdp/fd/releases/download/${RELEASE_LATEST}/fd-${RELEASE_LATEST}-${OS_type5}.tar.gz | tar xz -C ${DIR_TMP}
install -m 755 ${DIR_TMP}/fd*/fd /usr/local/bin/fd

# Install bat
echo 'Installing bat: A cat(1) clone with wings'
RELEASE_LATEST="$(wget -o - -O /dev/null https://github.com/sharkdp/bat/releases/latest | grep -o 'v[0-9]*\..*' | tail -1)"
wget -qO - https://github.com/sharkdp/bat/releases/download/${RELEASE_LATEST}/bat-${RELEASE_LATEST}-${OS_type6}.tar.gz | tar xz -C ${DIR_TMP}
install -m 755 ${DIR_TMP}/bat*/bat /usr/local/bin/bat

rm -rf ${DIR_TMP}

# echo Usage
echo ''
echo 'Decompression:                 ouch d <file>'
echo 'btop system monitor:           btop'
echo 'ping over tcp connection:      tcping 1.1.1.1 443'
echo 'network route tracking:        nexttrace <ip/domain>'
echo 'doggo DNS client:              doggo @udp://1.1.1.1 <domain> A AAAA --time'
echo 'speedtest-cli:                 speedtest'
echo 'encrypted file transfer:       wormhole send <file>'
echo 'Disk Usage/Free:               duf'
echo 'Directory storage usage:       gdu <path>'
echo 'find but user-friendly:        fd <string> <path>'
echo 'cat with syntax highlighting:  bat <file>'

