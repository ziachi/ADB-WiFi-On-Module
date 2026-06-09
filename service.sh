#!/system/bin/sh
# Enable USB ADB
setprop persist.service.adb.enable 1
setprop persist.service.debuggable 1
setprop persist.sys.usb.config mtp,adb

# Enable ADB over WiFi port 5555
setprop service.adb.tcp.port 5555
stop adbd
start adbd
