netsh interface set interface "Ethernet" enabled
netsh interface set interface "Wi-Fi" disable
netsh interface set interface "Ethernet 2" disable
netsh interface set interface "Ethernet 3" disable

netsh interface ipv4 set address "Ethernet" static 10.10.99.150 255.255.255.0 10.10.99.254
