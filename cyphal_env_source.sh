#!/usr/bin/bash
export CYPHAL_PATH="$HOME/.cyphal:$CYPHAL_PATH"
export UAVCAN__CAN__IFACE='socketcan:slcan0'
export UAVCAN__CAN__MTU=8
export UAVCAN__NODE__ID=60

if ! [ -e /sys/class/net/slcan0 ]; then
    # Install this script to your PATH: https://gist.github.com/pavel-kirienko/32e395683e8b7f49e71413aebf5e1a89
    sudo setup_slcan -r /dev/serial/by-id/usb-Zubax*Babel*
fi

export UAVCAN__CAN__IFACE='socketcan:slcan0'

if [ -e /sys/class/net/slcan1 ]; then
    export UAVCAN__CAN__IFACE="$UAVCAN__CAN__IFACE socketcan:slcan1"
fi

export UAVCAN__CAN__MTU=8
export UAVCAN__CAN__BITRATE='1000000 1000000'  # Arbitration and data segment bit rates.
export UAVCAN__NODE__ID=$(y accommodate)

