#!/bin/sh

set -e

# Install wget for dists that don't have it by default
if ! command -v wget >/dev/null 2>&1; then
    if command -v apt-get >/dev/null 2>&1; then
        apt-get update
        apt-get install -y wget
    elif command -v dnf >/dev/null 2>&1; then
        dnf install -y wget
    elif command -v yum >/dev/null 2>&1; then
        yum install -y wget
    elif command -v pacman >/dev/null 2>&1; then
        pacman -Sy --noconfirm wget
    elif command -v zypper >/dev/null 2>&1; then
        zypper install -y wget
    else
        echo 'Package manager not supported'
        exit 1
    fi
fi

DIR_TMP="$(mktemp -d)"

OS_type="$(uname -m)"
case "$OS_type" in
x86_64 | amd64)
    OS_type='x86_64'
    OS_type2='amd64'
    ;;
aarch64 | arm64)
    OS_type='aarch64'
    OS_type2='arm64'
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

rm -rf ${DIR_TMP}

# echo Usage
echo ''
echo 'Decompression:            ouch d <file>'
echo 'btop system monitor:      btop'
echo 'nexttrace route tracking: nexttrace <ip/domain>'
echo 'doggo DNS client:         doggo @udp://1.1.1.1 <domain> A AAAA --time'
echo 'speedtest-cli:            speedtest'
echo 'wormhole-william:         wormhole send <file>'

