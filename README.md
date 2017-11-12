# MediaTek_ApSoC_SDK_compile_env
This Dockerfile is for MTK_Ralink_ApSoC_SDK_4210_20140326.tar.bz2 compile.    
We have installed toolchain.    

## build docker images
docker build -t mt7620-compile https://github.com/lg0491986/MediaTek_ApSoC_SDK_compile_env.git

## run docker
docker run -idt --name compile -p 2222:22 --restart always --volume /home/data:/home MT7620-compile

## add user after enter ubuntu shell
docker exec -it compile /bin/bash

