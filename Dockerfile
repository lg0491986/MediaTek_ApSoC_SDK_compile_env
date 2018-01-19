FROM       ubuntu
MAINTAINER lg0491986 "https://github.com/lg0491986/MediaTek_ApSoC_SDK_compile_env.git"
  
COPY buildroot-gcc342-backup-for-compie-docker.tgz /home

RUN tar xzvf /home/buildroot-gcc342-backup-for-compie-docker.tgz -C / \
    && rm /home/buildroot-gcc342-backup-for-compie-docker.tgz
	
RUN dpkg --add-architecture i386 \
	&& apt-get -y update \
	&& apt-get -y dist-upgrade \
	&& apt-get install -y gcc-multilib g++-multilib \
	&& apt-get install -y lib32ncurses5 lib32z1 \
	&& apt-get install -y openssh-server \
	&& mkdir /var/run/sshd \
	&& echo 'root:123.com' |chpasswd \
	&& sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
	&& sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
	&& apt-get install -y vim \
	gcc g++ binutils patch bzip2 flex bison make cpio xz-utils \
	autoconf gettext texinfo unzip sharutils libncurses5-dev ncurses-term zlib1g-dev gawk liblzma-dev \
	git-core cmake \
	&& rm -fr /var/lib/apt/lists/* 
	
EXPOSE 22  
CMD    ["/usr/sbin/sshd", "-D"]  
