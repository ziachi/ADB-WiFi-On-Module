# 📡 ADB-WiFi-On-Module

> 🚀 Automatically enables **Developer Options**, **USB Debugging**, and **ADB over Wi-Fi (TCP/IP Port 5555)** on every boot.

Perfect for:

* 📺 Android TV Boxes
* 🚗 Android Head Units
* 🖥️ Embedded Android Devices
* 🔧 Remote Debugging
* 📱 Broken Touchscreen Devices
* 🪞 Wireless scrcpy Usage

---

# ✨ Features

✅ Automatically enables ADB over Wi-Fi after boot

✅ Automatically configures ADB debugging properties

✅ Compatible with Magisk, KernelSU, and KernelSU-Next

✅ Flashable via TWRP and most custom recoveries

✅ Supports Android 10 – Android 16

✅ Ideal companion for scrcpy and remote management

---

# 🔑 How to Push an ADB Authorization Key (Tested on Windows)

If your device cannot display the ADB authorization popup (broken touchscreen, Android TV box, head unit, kiosk system, etc.), you can manually push your computer's public ADB key and authorize ADB access without user interaction.

## 📋 Requirements

1. Install the appropriate USB driver for your device.
2. Download Android Platform Tools:

```text
https://developer.android.com/tools/releases/platform-tools
```

3. Extract the Platform Tools archive.
4. Open Command Prompt inside the extracted `platform-tools` folder.
5. Boot your device into TWRP or another recovery that provides ADB access.

---

## 🛠 Steps

### 1️⃣ Verify Device Connection

```bash
adb devices
```

### 2️⃣ Create the adb_keys File

```cmd
copy "%USERPROFILE%\.android\adbkey.pub" adb_keys
```

> 💡 If `adbkey.pub` does not exist yet, connect to a device once and accept the ADB authorization popup, or install the module first and trigger the authorization process.

### 3️⃣ Push the Key to the Device

```bash
adb push adb_keys /data/misc/adb/adb_keys
```

### 4️⃣ Verify the File

```bash
adb shell ls -l /data/misc/adb/adb_keys
```

### 5️⃣ Reboot the Device

```bash
adb reboot
```

### 6️⃣ Verify Authorization

```bash
adb devices
```

Expected:

```text
device
```

Not:

```text
unauthorized
```

---

# 🎉 Bonus: Install the Module Without a Touchscreen

Perfect for Android TV Boxes, Head Units, kiosks, and other devices without touchscreen input.

### 1️⃣ Push the Module to Device Storage

If the ZIP file is already inside your `platform-tools` folder:

```bash
adb push ADB-WiFi-On-Module.zip /sdcard/
```

Or specify the full path:

```bash
adb push "C:\path\to\ADB-WiFi-On-Module.zip" /sdcard/
```

### 2️⃣ Install the Module from TWRP

```bash
adb shell twrp install /sdcard/ADB-WiFi-On-Module.zip
```

### 3️⃣ Reboot

```bash
adb reboot
```

### ✅ Done!

After boot, the module should automatically:

* Enable ADB Debugging
* Enable ADB over Wi-Fi
* Start TCP Port 5555
* Allow remote management via ADB
* Work with scrcpy without requiring USB access

---

# 📦 Standard Installation Method (Boring XD)

## 📱 Method 1 — Magisk / KernelSU (Recommended)

1. Download `ADB-WiFi-On-Module.zip`
2. Open Magisk or KernelSU Manager
3. Navigate to:

```text
Modules → Install from Storage
```

4. Select the ZIP file
5. Reboot

---

## 🔧 Method 2 — TWRP / Custom Recovery

1. Copy ZIP to device storage
2. Boot into Recovery
3. Tap **Install**
4. Select ZIP
5. Swipe to Flash
6. Reboot

---

# 🚀 Usage

After installation and reboot:

✅ ADB over Wi-Fi starts automatically

✅ TCP Port 5555 is enabled

✅ No additional configuration required

---

## 📡 Connect via ADB

> 💡 Tip:
>
> If your device has no touchscreen, you may need scrcpy to interact with the system after the first boot.
>
> Repository:
>
> https://github.com/Genymobile/scrcpy
>
> Once connected through ADB, scrcpy can be used for full remote control and screen mirroring.

Find your device IP:

```bash
adb shell ip route
```

Connect:

```bash
adb connect 192.168.1.100:5555
```

Verify:

```bash
adb devices
```

Disconnect:

```bash
adb disconnect 192.168.1.100:5555
```

---

# 🪞 Using with scrcpy

Perfect for:

* 📱 Broken Touchscreens
* 📺 Android TV Boxes
* 🚗 Head Units
* 🖥️ Embedded Devices

Connect first:

```bash
adb connect 192.168.1.100:5555
```

Launch scrcpy:

```bash
scrcpy --serial 192.168.1.100:5555
```

Example:

```bash
scrcpy --serial 192.168.1.100:5555 --max-size 1024 --bit-rate 2M
```

---

# 🛡️ Security Notice

> ⚠️ Warning
>
> This module exposes ADB over TCP/IP on your local network.

## Recommended Practices

* 🔒 Use only on trusted networks
* 🌐 Avoid public Wi-Fi
* 📴 Disable the module when not needed
* 🛡️ Use a firewall if available
* ⚙️ Consider changing the default port
* 🔄 Keep Android updated
* 🔐 Use a VPN for remote access

---

# 📱 Compatibility

## Android Versions

| Version    | Supported |
| ---------- | --------- |
| Android 10 | ✅         |
| Android 11 | ✅         |
| Android 12 | ✅         |
| Android 13 | ✅         |
| Android 14 | ✅         |
| Android 15 | ✅         |
| Android 16 | ✅         |

---

## Supported Root Solutions

* ✅ Magisk
* ✅ KernelSU
* ✅ KernelSU-Next

---

## Supported Recovery Environments

* ✅ TWRP
* ✅ OrangeFox
* ✅ Most ZIP-capable recoveries

---

## Supported Devices

* 📱 Smartphones
* 📲 Tablets
* 📺 Android TV Boxes
* 🚗 Automotive Head Units
* 🖥️ Embedded Android Devices
* 🤖 IoT Systems

---

# 🎯 Use Cases

## 📺 Android TV Boxes

Control devices remotely without a USB cable.

## 🚗 Android Head Units

Manage and debug automotive Android systems.

## 🖥️ Embedded Android Devices

Maintain kiosk and industrial deployments.

## 👨‍💻 Development & Testing

* Wireless Logcat
* Remote App Testing
* File Transfer
* Device Automation
* Screen Mirroring via scrcpy

---

# 🔧 Troubleshooting

## Cannot Connect via ADB

Check TCP port:

```bash
adb shell getprop service.adb.tcp.port
```

Expected:

```text
5555
```

Check listening socket:

```bash
adb shell ss -tln | grep 5555
```

Restart ADB:

```bash
adb kill-server
adb start-server
```

---

## Module Not Loading

1. Verify root access
2. Ensure the module is enabled
3. Reboot the device
4. Check logs:

```bash
adb logcat | grep -i adb
```

---

# ⚙️ Change Default Port

Edit `service.sh`:

```bash
# Default
setprop service.adb.tcp.port 5555

# Custom Port
setprop service.adb.tcp.port 5556
```

Reboot after modification.

---

# 📝 Changelog

## v1.0.0 (2026-06-09)

🎉 Initial Public Release

* Automatic ADB over Wi-Fi on boot
* Magisk Support
* KernelSU Support
* KernelSU-Next Support
* Recovery Flashable Package
* Android 10–16 Compatibility
* Documentation Improvements
* Security Recommendations

---

# 🤝 Contributing

Contributions, bug reports, and feature requests are welcome.

Feel free to submit:

* 🐛 Issues
* 🔧 Pull Requests
* 💡 Feature Requests

---

# 📜 License

Released under the MIT License.

See the LICENSE file for details.

---

# ⚠️ Disclaimer

This software is provided **"AS IS"** without warranty of any kind.

The developer shall not be held responsible for:

* Data loss
* Security issues
* Device malfunction
* Any direct or indirect damages resulting from the use of this software.

Use at your own risk.
