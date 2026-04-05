# trip-ls

TRIP Resurgence Embedded Linux Location Server Distribution

## Supported hardware

 - Raspberry Pi 3b

## Build

Uses buildroot

```
wget <buildroot.tar.xz>
tar xf <buildroot.tar.xz>
cd buildroot
make BR2_EXTERNAL=../external-tripls/ raspberrypi3_64_tripls_defconfig
make
```

## Emulate

```
qemu-system-aarch64 -M raspi3b -cpu cortex-a53 -append "rw loglevel=8 earlyprintk console=tty1 console=ttyAMA0,115200 earlycon=pl011,0x3f201000 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 verbosity=2 rootdelay=1" -dtb bcm2710-rpi-3-b.dtb -sd sdcard.img -kernel Image -m 1G -smp 4 -usb -device usb-mouse -device usb-kbd -netdev bridge,id=net0,br=virbr0,helper=/usr/lib/qemu/qemu-bridge-helper -device usb-net,netdev=net0
```


