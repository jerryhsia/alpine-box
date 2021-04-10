#!/bin/sh


yum install -y zsh tree zip net-tools vim iotop lsof curl wget git sysstat strace mysql bind-utils telnet
yum clean all

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ ! -d "/root/.oh-my-zsh" ];then
    echo "build fail, not dir file [/root/.oh-my-zsh]"
    exit 2
fi

if [ ! -f "/root/.zshrc" ];then
    echo "build fail, not found file [/root/.zshrc]"
    exit 1
fi


sed -i 's/robbyrussell/maran/g' ~/.zshrc

echo "BUILD SUCCESS"

rm -f /install.sh

sleep 5