#!/system/bin/sh
# Enable USB ADB
setprop persist.service.adb.enable 1
setprop persist.service.debuggable 1
setprop persist.sys.usb.config mtp,adb
