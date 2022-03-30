#!/usr/bin/env bash
set -e

echo "Install TigerVNC server"
workdir=$(cd $(dirname $0); pwd)
echo $workdir
echo $workdir/tigervnc-1.8.0.x86_64.tar.gz
# echo on
ls $workdir

# tar xz $1 --strip 1 -C /
tar xvf $workdir/tigervnc-1.8.0.x86_64.tar.gz --strip 1 -C /
# wget -qO- http://tigervnc.bphinz.com/nightly/xc/x86_64/tigervnc-1.12.80-20220324gita97e9b11.x86_64.tar.gz | tar xz --strip 1 -C /

