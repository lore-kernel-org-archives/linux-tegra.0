From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [cbootimage-configs PATCH] Update README to describe tegrarcm readbct command
Date: Thu,  3 Oct 2013 13:10:16 -0600
Message-ID: <1380827416-9774-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Recent versions of tegrarcm now have the capability to read the BCT from the
device without requiring any HW-specific binaries, nor code already installed
on the device. Mention this in the README, since it discusses ways to extract
a BCT from a device.

Also, fix a typo in the Linux MMC block device name that contains the BCT.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README.txt | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/README.txt b/README.txt
index dfb97e2..9f742cf 100644
--- a/README.txt
+++ b/README.txt
@@ -15,33 +15,46 @@ using the following process:
 
 Extract the BCT from the existing device. Various methods exist to do this:
 
+1a)
+
+Recent versions of tegrarcm now have the capability to read the BCT from the
+device without requiring any HW-specific binaries, nor code already installed
+on the device:
+
+    tegrarcm --bct board.bct readbct
+
+1b)
+
 If you have access to Linux running on the device already, then you can use
 dump the memory device directly:
 
-# For devices which boot from eMMC:
-dd if=/dev/mmcblk0boot1 of=bct.bin bs=65536 count=1
+For devices which boot from eMMC:
+
+    dd if=/dev/mmcblk0boot0 of=bct.bin bs=65536 count=1
+
+For devices which boot from SPI:
+
+    dd if=/dev/mtd0ro of=bct.bin bs=65536 count=1
 
-# For devices which boot from SPI:
-dd if=/dev/mtd0ro of=bct.bin bs=65536 count=1
+1c)
 
 If you have a working nvflash for your device, then this can also extract the
 BCT:
 
-nvflash --bl fastboot.bin --getbct --bct board.bct
+    nvflash --bl fastboot.bin --getbct --bct board.bct
 
 If that doesn't work, you could try reading the content of the BCT partition
 or the start of the raw device, then extracting the BCT:
 
-nvflash --bl fastboot.bin --read 2 board.bct
+    nvflash --bl fastboot.bin --read 2 board.bct
 
 or:
 
-nvflash --bl fastboot.bin --rawdeviceread 0 128 board.bct
+    nvflash --bl fastboot.bin --rawdeviceread 0 128 board.bct
 
-Note that all of the above commands, except the nvflash --getbct command,
-extract many more bytes of data that is strictly required. However, this
-avoids updating these instructions for each new chip; Tegra20's BCT is just
-under 4KiB, Tegra30's around 6KiB, etc.
+Note that some of the above commands extract many more bytes of data that is
+strictly required. However, this avoids updating these instructions for each
+new chip; Tegra20's BCT is just under 4KiB, Tegra30's around 6KiB, etc.
 
 2)
 
-- 
1.8.1.5
