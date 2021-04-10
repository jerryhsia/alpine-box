#!/bin/sh

sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

apk add zsh git curl

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# retry
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ ! -d "/root/.oh-my-zsh" ];then
    echo "build fail, not found dir [/root/.oh-my-zsh]"
    exit 2
fi

if [ ! -f "/root/.zshrc" ];then
    echo "build fail, not found file [/root/.zshrc]"
    exit 1
fi
sed -i 's/robbyrussell/maran/g' ~/.zshrc

apk add tree zip vim lsof wget sysstat strace tcpdump net-tools bind-tools mariadb-client
apk cache clean

echo "BUILD SUCCESS"

rm -f /*-install.sh

sleep 5