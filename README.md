# Docker container stack: hostap + dhcp server

This container starts wireless access point (hostap) and dhcp server in docker
container. It supports both host networking and network interface reattaching
to container network namespace modes (host and guest).

## Requirements

On the host system install required wifi drivers, then make sure your wifi adapter
supports AP mode:

```
# iw list
...
        Supported interface modes:
                 * IBSS
                 * managed
                 * AP
                 * AP/VLAN
                 * WDS
                 * monitor
                 * mesh point
...
```

Set country regulations, for example, for Spain set:

```
# iw reg set ES
country ES: DFS-ETSI
        (2400 - 2483 @ 40), (N/A, 20), (N/A)
        (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR
        (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
        (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
        (57000 - 66000 @ 2160), (N/A, 40), (N/A)
```

## Run using docker-compose

Copy the `docker-compose.yml.example` to make `docker-compose.yml`

```
$ cp docker-compose.yml.example docker-compose.yml
```

Now, edit the environment variables to match your preference.
See below what each of those variables mean.

## Environment variables

* **INTERFACE**: name of the interface to use for wifi access point (default: wlan0)
* **OUTGOING**: outgoing network interface (default: eth0)
* **CHANNEL**: WIFI channel (default: 6)
* **SUBNET**: Network subnet (default: 192.168.254.0)
* **AP_ADDR**: Access point address (default: 192.168.254.1)
* **SSID**: Access point SSID (default: docker-ap)
* **WPA_PASSPHRASE**: WPA password (default: passw0rd)
* **HW_MODE**: WIFI mode to use (default: g)
* **DRIVER**: WIFI driver to use (default: nl80211)
* **HT_CAPAB**: WIFI HT capabilities for 802.11n (default: [HT40-][SHORT-GI-20][SHORT-GI-40])
* **MODE**: Mode to run in guest/host (default: host)

## License

MIT

## Author

Sri Vishnu Totakura <srivishnu@totakura.in>

Inspired from https://github.com/sdelrio/rpi-hostap,
https://github.com/offlinehacker/docker-ap, and
https://github.com/EmbeddedAndroid/docker-ap
