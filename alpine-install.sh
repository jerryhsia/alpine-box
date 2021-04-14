#!/bin/sh

pwd

init() {
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
    apk add zsh git curl tree zip vim lsof wget sysstat strace tcpdump net-tools bind-tools
    apk add mariadb-client redis php php-fpm nginx go openjdk11
}

install_zsh() {
    echo "install_zsh start"

    git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh
    if [ ! -d "/root/.oh-my-zsh" ];then
        # retry
        git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh
    fi
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

    if [ ! -d "/root/.oh-my-zsh" ];then
        echo "build fail, not found dir [/root/.oh-my-zsh]"
        exit 1
    fi

    if [ ! -f "/root/.zshrc" ];then
        echo "build fail, not found file [/root/.zshrc]"
        exit 2
    fi

    sed -i 's/robbyrussell/maran/g' ~/.zshrc

    echo "install_zsh end"
}


install_rzsz() {
    echo "install_rzsz start"

    wget http://mirrors.aliyun.com/alpine/edge/testing/x86_64/lrzsz-0.12.20-r1.apk
    apk add lrzsz-0.12.20-r1.apk
    ln -s /usr/bin/lrz /usr/bin/rz
    ln -s /usr/bin/lsz /usr/bin/sz

    echo "install_rzsz end"
}

clean() {
    echo "clean start"

    apk cache clean
    rm -f *-install.sh
    rm -f *.apk
    rm -f /var/cache/apk/*.gz

    # rm -f /usr/bin/mysql_find_rows
    # rm -f /usr/bin/mysql_fix_extensions
    # rm -f /usr/bin/mysql_waitpid
    # rm -f /usr/bin/mysqlaccess
    # rm -f /usr/bin/mysqladmin
    # rm -f /usr/bin/mysqlcheck
    # rm -f /usr/bin/mysqldumpslow
    # rm -f /usr/bin/mysqlimport
    # rm -f /usr/bin/mysqlshow

    # rm -f /usr/bin/mariadb-access
    # rm -f /usr/bin/mariadb-admin
    # rm -f /usr/bin/mariadb-check
    # rm -f /usr/bin/mariadb-dumpslow
    # rm -f /usr/bin/mariadb-find-rows
    # rm -f /usr/bin/mariadb-fix-extensions
    # rm -f /usr/bin/mariadb-import
    # rm -f /usr/bin/mariadb-show
    # rm -f /usr/bin/mariadb-waitpid

    # rm -f /usr/bin/zipcloak
    # rm -f /usr/bin/zipgrep
    # rm -f /usr/bin/zipinfo
    # rm -f /usr/bin/zipnote
    # rm -f /usr/bin/zipsplit

    # rm -f /usr/bin/redis-benchmark
    # rm -f /usr/bin/redis-check-aof
    # rm -f /usr/bin/redis-check-rdb
    # rm -f /usr/bin/redis-sentinel
    # rm -f /usr/bin/redis-server

    # rm -f /usr/bin/tcpdump.4.99.0
    # rm -f /usr/bin/git-*
    # rm -f /usr/bin/myisam_ftdump
    # rm -f /bin/zsh-*

    echo "clean end"
}

init
install_zsh
install_rzsz
clean

echo "BUILD SUCCESS"
