#!/usr/bin/env bash

# 启动aria2下载服务器
aria2c --enable-rpc \
       --rpc-listen-all \
       --save-session=$HOME/Downloads/session.txt \
       --input-file=$HOME/Downloads/session.txt \
       -x16 \
       -s16 \
       -k1M \
       --dir=$HOME/Downloads \
       > /dev/null 2>&1 &
