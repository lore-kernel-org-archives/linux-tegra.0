From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 4/4] Provide progress messages
Date: Thu,  5 Dec 2013 15:13:02 -0700
Message-ID: <1386281582-18561-4-git-send-email-swarren@wwwdotorg.org>
References: <1386281582-18561-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386281582-18561-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Print messages to the U-Boot console while executing the flashing
process. For NAND and SPI at least, IO operations can be quite slow,
and it's useful to know the U-Boot is executing what may be a long-
running operation.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index bd8af7caa888..87b87697c027 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -55,22 +55,32 @@ def run(dir, cmd):
 def gen_flashcmd_mmc(flash_image_addr, readback_addr, flash_img_size):
     flash_id = config['flash-id-uboot']
     flash_img_size_sectors = flash_img_size / 512
-    flashcmd = 'mmc dev %d 1 ; ' % flash_id
+    flashcmd = 'echo >>> Selecting MMC device... ; '
+    flashcmd += 'mmc dev %d 1 ; ' % flash_id
+    flashcmd += 'echo >>> Writing image to MMC... ; '
     flashcmd += 'mmc write 0x%08x 0 0x%x ; ' % (flash_image_addr, flash_img_size_sectors)
+    flashcmd += 'echo >>> Reading image back from MMC... ; '
     flashcmd += 'mmc read 0x%08x 0 0x%x ; ' % (readback_addr, flash_img_size_sectors)
     return flashcmd
 
 def gen_flashcmd_nand(flash_image_addr, readback_addr, flash_img_size):
-    flashcmd = 'nand erase.chip ; '
+    flashcmd = 'echo >>> Erasing NAND... ; '
+    flashcmd += 'nand erase.chip ; '
+    flashcmd += 'echo >>> Writing image to NAND... ; '
     flashcmd += 'nand write 0x%08x 0 0x%08x ; ' % (flash_image_addr, flash_img_size)
+    flashcmd += 'echo >>> Reading image back from NAND... ; '
     flashcmd += 'nand read 0x%08x 0 0x%08x ; ' % (readback_addr, flash_img_size)
     return flashcmd
 
 def gen_flashcmd_spi(flash_image_addr, readback_addr, flash_img_size):
     flash_id = config.get('flash-id-uboot', '0')
-    flashcmd = 'sf probe %s ; ' % flash_id
+    flashcmd = 'echo >>> Selecting SPI device... ; '
+    flashcmd += 'sf probe %s ; ' % flash_id
+    flashcmd += 'echo >>> Erasing SPI... ; '
     flashcmd += 'sf erase 0 0x%08x ; ' % config['flash-erase-size']
+    flashcmd += 'echo >>> Writing image back to SPI... ; '
     flashcmd += 'sf write 0x%08x 0 0x%08x ; ' % (flash_image_addr, flash_img_size)
+    flashcmd += 'echo >>> Reading image back from SPI... ; '
     flashcmd += 'sf read 0x%08x 0 0x%08x ; ' % (readback_addr, flash_img_size)
     return flashcmd
 
@@ -182,11 +192,14 @@ def func_flash():
         run(workdir, cmd)
 
         bootcmd = ''
+        bootcmd += 'echo >>> Verifying image in RAM... ; '
         bootcmd += 'crc32 0x%08x 0x%08x 0x%08x ; ' % (flash_image_addr, flash_img_size, soc['ram-base'])
         bootcmd += 'if itest.l *0x%08x != 0x%x; then echo CRC MISMATCH of initial image; exit; fi ; ' % (soc['ram-base'], flash_img_crc32_bs)
         bootcmd += gen_flashcmd(flash_image_addr, readback_addr, flash_img_size)
+        bootcmd += 'echo >>> Verifying image from flash... ; '
         bootcmd += 'crc32 0x%08x 0x%08x 0x%08x ; ' % (readback_addr, flash_img_size, soc['ram-base'])
         bootcmd += 'if itest.l *0x%08x != 0x%x; then echo CRC MISMATCH of readback image; exit; fi ; ' % (soc['ram-base'], flash_img_crc32_bs)
+        bootcmd += 'echo >>> Setting up environment... ; '
         bootcmd += 'env default -f -a ; '
         # Perhaps U-Boot should set $boardname based on the ID EEPROM; then we wouldn't need this
         if config['dtbfn-extra'] != '':
@@ -194,6 +207,7 @@ def func_flash():
         for (var, value) in args.env:
             bootcmd += 'setenv %s %s ; ' % (var, value)
         bootcmd += 'saveenv ; '
+        bootcmd += 'echo >>> Flashing OK, rebooting... ; '
         # To update the bootloader, reset.
         # If wanting to run installer, set installer_args.configname in environment, 'run bootcmd'
         bootcmd += 'reset'
-- 
1.8.1.5
