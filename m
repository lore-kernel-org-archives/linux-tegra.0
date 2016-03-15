From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] Manual page cleanups and expansion
Date: Tue, 15 Mar 2016 11:24:47 -0600
Message-ID: <1458062687-12876-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Expand documentation of --pkc, --gen-signed-msgs, and
--download-signed-msgs.

Clean up various capitalization issues.

Fix a typo, in the code too.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c        |  2 +-
 src/tegrarcm.1.in | 66 ++++++++++++++++++++++++++++++++++++-------------------
 2 files changed, 45 insertions(+), 23 deletions(-)

diff --git a/src/main.c b/src/main.c
index f20ab3a98729..b1111e7fb60e 100644
--- a/src/main.c
+++ b/src/main.c
@@ -429,7 +429,7 @@ int main(int argc, char **argv)
 		if (entryaddr == 0) {
 			entryaddr = loadaddr;
 		}
-		printf("booloader file: %s\n", blfile);
+		printf("bootloader file: %s\n", blfile);
 		printf("load addr 0x%x\n", loadaddr);
 		printf("entry addr 0x%x\n", entryaddr);
 	}
diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index b7cba7f062fe..fdf43ccae64f 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -1,20 +1,42 @@
 .TH tegrarcm 1 "29 November 2012" "tegrarcm-VERSION" "NVIDIA Tegra Firmware Download Tool"
 .IX tegrarcm
 .SH NAME
-tegrarcm \- tegra firmware download utility
+tegrarcm \- Tegra firmware download utility
 .SH SYNOPSIS
 .B tegrarcm
 [
 .I options
 ]
 .SH DESCRIPTION
-This program is used to send code to a Tegra device in recovery mode.
-It also supports locked devices with pkc private key, such as Jetson
-tk1 board. It is not capable of flashing firmware to a device, but can
-be used to download firmware that is then capable of flashing.  For
-example in ChromeOS tegrarcm is used to download a special build of
-u-boot to the target Tegra device with a payload that it then flashes
-to the boot device.
+This program is used to send code to a Tegra device in recovery mode. It
+supports both unlocked devices, and those locked with a PKC (private key). It
+is not capable of flashing firmware to a device, but can be used to download
+firmware that is then capable of flashing.  For example in ChromeOS tegrarcm is
+used to download a special build of U-Boot to the target Tegra device with a
+payload that it then flashes to the boot memory device.
+
+Devices with PKC enabled may be handled in two different ways:
+
+.IP 1.
+Data may be signed on-the-fly, during communication with the Tegra device, by
+providing the \-\-pkc options. This method is the simplest, but requires access
+to the device's PKC during the download process.
+
+.IP 2.
+The signing and download steps may be separated. Signed data may first be
+prepared offline, without requiring access to a Tegra device, using the
+\-\-gen\-signed\-msgs option. The signed data may later be sent to a Tegra
+device using the \-\-download\-signed\-msgs option.
+
+Both of these steps require use of the \-\-gen\-signed\-msgs option to indicate
+where to write/read the signed messages. This option provides a base filename,
+to which various extensions will be appended, to form the final filenames for
+the various signed data/messages.
+
+This method is more complex, but allows separation of the download and signing
+processes. For example, a highly secure signing machine could generate the
+signed messages and pass them to a factory system for download to the Tegra
+device.
 
 .SS Platforms supported
 .IP \(bu
@@ -35,7 +57,7 @@ depending on the target board.
 Find the appropriate BCT file for your board.  For reference boards,
 BCT files can be found in the L4T distribution from NVIDIA.
 .IP \(em
-Build some firmware for your device (such as u-boot)
+Build some firmware for your device (such as U-Boot)
 .IP \(em
 Run tegrarcm to download the firmware
 
@@ -48,7 +70,7 @@ Read the BCT from the target device and write it to \fIbctfile\fP.
 .TP
 .B \-\-bct \fIbctfile\fP
 Specify the BCT file to download to the Tegra device.  This file contains
-memory configuation information for the board.  BCT files can be
+memory configuration information for the board.  BCT files can be
 obtained through the NVIDIA L4T distribution or generated with
 cbootimage and a proper configuration file.
 .TP
@@ -86,7 +108,7 @@ Specify the physical USB port path of the Tegra device to control.
 Specify the key file for secured devices. The private key should be in DER format.
 .TP
 .B \-\-gen\-signed\-msgs
-Generate signed messages for pkc secured devices.
+Generate signed messages for PKC secured devices.
 .TP
 .B \-\-signed\-msgs\-file \fImsg_file_prefix\fP
 Specify messages file name prefix.
@@ -134,8 +156,7 @@ fi
 Then, to determine the USB port path, do one of:
 
 .IP 1.
-
-Execute udevmadm on the USB device, and look for the DEVPATH entry. The
+Execute udevadm on the USB device, and look for the DEVPATH entry. The
 final component in the path is the USB port path:
 
 .nf
@@ -148,7 +169,6 @@ E: DEVPATH=/devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10.4
 .fi
 
 .IP 2.
-
 Look at all the sub-directories of /sys/bus/usb/devices/* that do not
 contain either ":" or "usb". Each of these will contain a busnum and
 devnum file. Find the directory which matches the lsusb output, and use
@@ -172,12 +192,12 @@ connections are physically changed, so you can use it over and over
 without repeating the steps above.
 
 .SH EXAMPLES
-1) To download unsigned u-boot firmware to a Tegra20 seaboard:
+1) To download U-Boot to Seaboard, with no PKC enabled:
 
 .nf
 $ sudo tegrarcm --bct seaboard.bct --bootloader u-boot.bin --loadaddr 0x108000
 bct file: seaboard.bct
-booloader file: u-boot.bin
+bootloader file: u-boot.bin
 load addr 0x108000
 entry addr 0x108000
 device id: 0x7820
@@ -213,12 +233,12 @@ device id: 0x7820
 reading BCT from system, writing to ventana.bct...done!
 .fi
 
-3) To download with auto-signing u-boot.bin to jetson-tk1 target:
+3) To download U-Boot to Jetson TK1, with PKC enabled, in one step:
 
 .nf
 $ sudo tegrarcm --bct=jetson-tk1.bct --bootloader=u-boot.bin --loadaddr=0x83d88000 --pkc=rsa_priv.der
 bct file: jetson-tk1-bct.bct
-booloader file: u-boot.bin
+bootloader file: u-boot.bin
 load addr 0x83d88000
 entry addr 0x83d88000
 device id: 0x7140
@@ -245,11 +265,12 @@ sending file: u-boot.bin
 u-boot.bin sent successfully
 .fi
 
-4) To generate signed messages for jetson-tk1 target:
+4) To generate signed messages that will allow later downloading of U-Boot to
+Jetson TK1 with PKC enabled:
 
 .nf
 $ sudo tegrarcm --gen-signed-msgs --signed-msgs-file rel_1001.bin --bootloader=u-boot.bin --loadaddr 0x83d88000 --soc 124 --pkc rsa_priv.der
-booloader file: u-boot.bin
+bootloader file: u-boot.bin
 load addr 0x83d88000
 entry addr 0x83d88000
 Create file rel_1001.bin.qry...
@@ -258,12 +279,13 @@ Create file rel_1001.bin.bl...
 .fi
 
 
-5) To download signed messages to jetson-tk1 target:
+5) To download previously-generated signed messages to Jetson TK1 with PKC
+enabled:
 
 .nf
 $ sudo tegrarcm --download-signed-msgs --signed-msgs-file rel_1001.bin --bct=jetson-tk1-bct.bct --bootloader=u-boot.bin --loadaddr 0x83d88000
 bct file: jetson-tk1-bct.bct
-booloader file: u-boot.bin
+bootloader file: u-boot.bin
 load addr 0x83d88000
 entry addr 0x83d88000
 device id: 0x7140
-- 
2.7.3
