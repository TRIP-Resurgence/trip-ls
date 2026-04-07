# trip-ls

TRIP Resurgence Embedded Linux Location Server Distribution

## Supported hardware

 - Raspberry Pi 3b

## Build

Uses buildroot

```
wget <buildroot.tar.xz>
tar xf <buildroot.tar.xz>
cd buildroot*
make BR2_EXTERNAL=../external-tripls/ raspberrypi3_64_tripls_defconfig
make -j$(nproc)
```

## Flash

```
dd if=output/images/sdcard.img of=/dev/mmcblk0 bs=4k status=progress
```

## Emulate

```
qemu-system-aarch64 -M raspi3b -cpu cortex-a53 -append "rw root=/dev/mmcblk0p2 rootdelay=1" -dtb bcm2710-rpi-3-b.dtb -sd sdcard.img -kernel Image -m 1G -smp 4 -usb -device usb-kbd -netdev bridge,id=net0,br=virbr0,helper=/usr/lib/qemu/qemu-bridge-helper -device usb-net,netdev=net0
```

## Usage

Connect to serial port as console (primary UART0, 115200 8N1)

Shell is normal bash. Editor is vim.

### Configuration

 - network: `/etc/network/interfaces`
 - tripd: `/etc/tripd.conf`

### Service management

init.d (/etc/init.d/S\*) scripts (start, stop, restart, reload)

 - rsyslogd
 - sshd
 - ntpd
 - tripd

