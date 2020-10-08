FROM alpine

MAINTAINER Jaka Hudoklin <offlinehacker@users.noreply.github.com>

RUN apk add --no-cache bash hostapd iptables dhcp docker iproute2 iw
ADD wlanstart.sh /bin/wlanstart.sh

ENTRYPOINT [ "/bin/wlanstart.sh" ]
