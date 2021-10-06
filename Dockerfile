ARG TARGETPLATFORM
ARG BUILDPLATFORM
# Default release is 18.04
ARG BASE_IMAGE_RELEASE=18.04
# Default base image 
ARG BASE_IMAGE=ubuntu:18.04

# use as source for openbox debian package 
FROM abcdesktopio/openbox:${BASE_IMAGE_RELEASE} AS openbox
ARG TARGETPLATFORM
ARG BUILDPLATFORM


#
# Dockerfile oc.ubuntu  
# use FROM BASE_IMAGE
# define FROM before use ENV command
FROM ${BASE_IMAGE}

# define ARG 
ARG BASE_IMAGE_RELEASE
ARG BASE_IMAGE

LABEL maintainer="Alexandre DEVELY"
LABEL vcs-type "git"
LABEL vcs-url  "https://github.com/abcdesktopio/oc.ubuntu.${BASE_IMAGE_RELEASE}"
LABEL vcs-ref  "main"

# correct debconf: (TERM is not set, so the dialog frontend is not usable.)
ENV DEBCONF_FRONTEND noninteractive
ENV TERM linux

# set debconf to Noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# 
RUN apt-get update && apt-get install -y  --no-install-recommends \
	dialog 				\
    	debconf-utils 			\
    	software-properties-common 	\
	locales				\		
    && apt-get clean			\
    && rm -rf /var/lib/apt/lists/*



RUN apt-get update && apt-get install -y --no-install-recommends \
	language-pack-en		\
	language-pack-fr		\
	&& locale-gen			\
	&& apt-get clean 		\
    	&& rm -rf /var/lib/apt/lists/*


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
    && apt-get clean			\
    && rm -rf /var/lib/apt/lists/*

	


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
    && apt-get clean		\
    && rm -rf /var/lib/apt/lists/*


	
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
    && apt-get clean	 	\
    && rm -rf /var/lib/apt/lists/*

#
# install themes
RUN apt-get update && apt-get install -y --no-install-recommends \
        gnome-icon-theme                \
        gnome-icon-theme-symbolic       \
	numix-gtk-theme 	\
	numix-icon-theme	\
    && apt-get clean			\
    && rm -rf /var/lib/apt/lists/*

# add pulse audio utils
# add cupds client
RUN apt-get update && apt-get install -y --no-install-recommends\
	pulseaudio-utils 		\
	cups-client			\
    && apt-get clean  			\
    && rm -rf /var/lib/apt/lists/*

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
    && apt-get clean  		\
    && rm -rf /var/lib/apt/lists/*

# install the abcdesktop openbox package
COPY --from=openbox *.deb  /tmp/
RUN ls -la /tmp
WORKDIR /tmp
RUN dpkg -i libobt*.deb
RUN dpkg -i libobrender*.deb
RUN dpkg -i openbox_3.6.1*.deb
RUN rm -rf /tmp/*.deb
    
