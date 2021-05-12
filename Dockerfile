# Default release is 18.04
ARG BASE_IMAGE_RELEASE=18.04
# Default base image 
ARG BASE_IMAGE=ubuntu:18.04

FROM abcdesktopio/openbox:${BASE_IMAGE_RELEASE} AS openbox

# use FROM BASE_IMAGE
# define FROM befire use ENV command
FROM ${BASE_IMAGE}

# define ARG 
ARG BASE_IMAGE_RELEASE
ARG BASE_IMAGE

LABEL maintainer="Alexandre DEVELY"

LABEL vcs-type "git"
LABEL vcs-url  "https://github.com/abcdesktopio/oc.ubuntu.18.04"
LABEL vcs-ref  "master"
LABEL release  "5"
LABEL version  "1.2"
LABEL architecture "x86_64"

# correct debconf: (TERM is not set, so the dialog frontend is not usable.)
ENV DEBCONF_FRONTEND noninteractive
ENV TERM linux

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update && apt-get install -y  --no-install-recommends \
        apt-utils                   	\
	dialog 				\
    	debconf-utils 			\
    	software-properties-common 	\
	locales				\		
    && apt-get clean


RUN apt-get update && apt-get install -y --no-install-recommends \
	language-pack-en		\
	language-pack-fr		\
	&& locale-gen			\
	&& apt-get clean

# RUN dpkg-reconfigure locales
# RUN locale-gen fr_FR.UTF-8
#    locale-gen C.UTF-8 
#    /usr/sbin/update-locale LANG=C.UTF-8
#ENV LC_ALL C.UTF-8



# python-software-properties is use for add-apt-repository
RUN  apt-get update && apt-get install -y --no-install-recommends \
    	software-properties-common 	\
   	net-tools 			\
    	libgtk-3-0 			\
    	libgtk-3-bin 			\
    	sudo 				\
    	curl 				\
    && apt-get clean
	


# Suppress warning about accessibility bus
# WARNING **: Couldn't connect to accessibility bus:
RUN echo "NO_AT_BRIDGE=1" >> /etc/environment

## Applications
# x11 libs
# supervisor 
# xsettings 
# xdotools 
# wmctrl 
RUN   apt-get update && apt-get install -y --no-install-recommends \
	x11-utils 		\
	supervisor 		\
	x11-xserver-utils 	\
	xsettingsd		\
	xdotool 		\
	xdg-utils 		\
        wmctrl 			\
    && apt-get clean

	
## 
# install fonts and themes
RUN  apt-get update && apt-get install -y --no-install-recommends \
	xfonts-base		\
        xfonts-encodings        \
        xfonts-utils            \
	fonts-noto 		\
	fonts-roboto 		\
	fonts-ubuntu 		\
	fonts-freefont-ttf 	\
	fonts-wine 		\
	ttf-ubuntu-font-family 	\
    && apt-get clean

#
# install themes
RUN apt-get update && apt-get install -y --no-install-recommends \
        gnome-icon-theme                \
        gnome-icon-theme-symbolic       \
        gnome-font-viewer               \
    && apt-get clean


RUN apt-get update && apt-get install -y --no-install-recommends\
	pulseaudio 			\
	pulseaudio-utils 		\
    && apt-get clean

# add numix theme
RUN apt-get update && apt-get install -y --no-install-recommends \
	numix-gtk-theme 	\
	numix-icon-theme	\
 && apt-get clean

# X11
# openbox
# python-xdg python-xdgapp for autostart in openbox
# obconf for openbox 
#  
RUN apt-get update && apt-get install -y --no-install-recommends  \
	python3-xdg 		\
        obconf 			\
	x11-apps 		\
        lxappearance-obconf 	\
        lxappearance 		\
        gtk2-engines 		\
	gtk2-engines-pixbuf 	\ 
	gettext 		\
	autocutsel 		\
    && apt-get clean


# cups-pdf: pdf printer support
# scrot: screenshot tools
# smbclient need to install smb printer
# cups: printer support
RUN  apt-get update && apt-get install -y --no-install-recommends \
        smbclient	\
	cups-pdf 	\
	scrot  		\
        cups		\
    && apt-get clean

COPY --from=openbox *.deb  /tmp

RUN cd /tmp && \
    dpkg -i libobt*.deb 	&& \
    dpkg -i libobrender*.deb    && \
    dpkg -i openbox_3.6.1*.deb  && \
    rm -rf /tmp/*.deb
    
