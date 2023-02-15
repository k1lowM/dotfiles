netsh interface set interface "Ethernet" disable
netsh interface set interface "Wi-Fi" enabled
netsh interface set interface "Ethernet 2" enabled
netsh interface set interface "Ethernet 3" enabled

netsh wlan connect name="SPWN_H36_394C85"
rem netsh interface ipv4 set address "Ethernet" static 10.10.99.150 255.255.255.0 10.10.99.254

