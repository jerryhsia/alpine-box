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

apk add tree zip vim lsof wget sysstat strace tcpdump net-tools bind-tools mariadb-client redis

wget http://mirrors.aliyun.com/alpine/edge/testing/x86_64/lrzsz-0.12.20-r1.apk
apk add lrzsz-0.12.20-r1.apk
ln -s /usr/bin/lrz /usr/bin/rz
ln -s /usr/bin/lsz /usr/bin/sz

apk cache clean
rm -f /*-install.sh
rm -f *.apk

echo "BUILD SUCCESS"


sleep 5
