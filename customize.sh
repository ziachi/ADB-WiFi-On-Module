#!/system/bin/sh
SKIPUNZIP=1

ui_print "- Installing ADB WiFi Always On module"
ui_print "- by ziachi"
ui_print "- https://github.com/ziachi/ADB-WiFi-On-Module"

# Extract files ke MODPATH
unzip -o "$ZIPFILE" 'service.sh' 'post-fs-data.sh' 'module.prop' -d "$MODPATH" >&2

# Set permissions
set_perm "$MODPATH/service.sh" root root 0755
set_perm "$MODPATH/post-fs-data.sh" root root 0755

ui_print "- Module installed successfully"
ui_print "- ADB WiFi will be enabled on next boot (port 5555)"
