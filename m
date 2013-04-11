From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] cbootimage-configs: add README, with BCT extraction instructions
Date: Thu, 11 Apr 2013 11:56:02 -0600
Message-ID: <1365702962-31528-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Create a README.txt file for cbootimage-configs. This mainly describes
how to obtain/extract equivalent config files for boards that are not
yet supported by the project.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README.txt |   63 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 README.txt

diff --git a/README.txt b/README.txt
new file mode 100644
index 0000000..dfb97e2
--- /dev/null
+++ b/README.txt
@@ -0,0 +1,63 @@
+The cbootimage-configs project contains cbootimage configuration files for
+many Tegra boards, both those designed by NVIDIA, and various third-parties.
+
+The directory hierarchy is first by chip/SoC, then by vendor, then by board
+name. For example, tegra20/nvidia/harmony.
+
+If you wish to use cbootimage with a board that is not yet supported by this
+project, you might try contacting the vendor of the board to see if they'd be
+willing to contribute configuration files to this project.
+
+If that doesn't work out, you may create the required configuration files
+using the following process:
+
+1)
+
+Extract the BCT from the existing device. Various methods exist to do this:
+
+If you have access to Linux running on the device already, then you can use
+dump the memory device directly:
+
+# For devices which boot from eMMC:
+dd if=/dev/mmcblk0boot1 of=bct.bin bs=65536 count=1
+
+# For devices which boot from SPI:
+dd if=/dev/mtd0ro of=bct.bin bs=65536 count=1
+
+If you have a working nvflash for your device, then this can also extract the
+BCT:
+
+nvflash --bl fastboot.bin --getbct --bct board.bct
+
+If that doesn't work, you could try reading the content of the BCT partition
+or the start of the raw device, then extracting the BCT:
+
+nvflash --bl fastboot.bin --read 2 board.bct
+
+or:
+
+nvflash --bl fastboot.bin --rawdeviceread 0 128 board.bct
+
+Note that all of the above commands, except the nvflash --getbct command,
+extract many more bytes of data that is strictly required. However, this
+avoids updating these instructions for each new chip; Tegra20's BCT is just
+under 4KiB, Tegra30's around 6KiB, etc.
+
+2)
+
+Convert the BCT to a cbootimage configuration file:
+
+bct_dump board.bct > board.bct.cfg
+
+This will de-compile the extracted BCT binary into a text configuration file
+suitable for later use by cbootimage.
+
+To follow the same structure as the rest of the configuration files in this
+project, it's then best to split up board.bct.cfg into separate board.bct.cfg
+(DevType, DeviceParam, and SDRAM lines), and board.img.cfg (all other header
+parameters). Use the existing configuration files as a guide.
+
+Once you have performed these steps, you will have configuration files
+suitable for your personal use. We don't accept contributions to this project
+that were derived in this fashion.  We encourage you to contact the vendor
+and request them to submit their own configuration files.
-- 
1.7.10.4
