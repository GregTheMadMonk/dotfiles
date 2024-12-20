sudo ip tuntap add mode tun dev socks0
sudo ip add add 192.168.69.1/15 dev socks0
sudo ip link set dev socks0 up

sudo ip route del 192.168.0.0/15
sudo ip route add 192.168.0.0/15 via 192.168.69.1 dev socks0
