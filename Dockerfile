FROM ubuntu

# MAINTAINER Marco de Jong

## INSTALLATION OF ESSENTIALS

RUN	apt-get update --fix-missing \
&& 	apt-get -y install build-essential git autoconf automake libboost-all-dev libtool sphinx-doc python3-dev python3-pip \
&& 	apt-get autoremove -y \
&& 	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## INSTALLATION

RUN	python3 -m pip install --upgrade pip \
&&	python3 -m pip install numpy \
&&	python3 -m pip install matplotlib \
&&	python3 -m pip install scipy

WORKDIR /opt

RUN 	git clone https://github.com/TGAC/KAT \
&&	cd /opt/KAT \
&&	./autogen.sh \
&&	./configure \
&&	make -j 4 install

##Finishing and Cleaning BUILD

RUN	apt-get autoremove -y \
&& 	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /mnt/output
