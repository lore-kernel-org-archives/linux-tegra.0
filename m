From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 1/4] Add crc32 verification of the flash image
Date: Thu,  5 Dec 2013 15:12:59 -0700
Message-ID: <1386281582-18561-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Verify the CRC32 of the flash image at two points in time:

1) Before starting the flashing process, to validate the download of the
   image into Tegra's RAM.

2) After writing the image to flash, read it back into RAM, in order to
   validate that it was correctly written to flash.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index 41879c396b2f..d97b9e43aa45 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -25,6 +25,7 @@ import os
 import os.path
 import shutil
 import stat
+import subprocess
 import sys
 import tempfile
 from tegraboardconfigs import *
@@ -51,23 +52,26 @@ def run(dir, cmd):
         raise Exception('Command failed: %d' % ret)
     os.chdir(oldcwd)
 
-def gen_flashcmd_mmc(flash_image_addr, flash_img_size):
+def gen_flashcmd_mmc(flash_image_addr, readback_addr, flash_img_size):
     flash_id = config['flash-id-uboot']
     flash_img_size_sectors = flash_img_size / 512
     flashcmd = 'mmc dev %d 1 ; ' % flash_id
     flashcmd += 'mmc write 0x%08x 0 0x%x ; ' % (flash_image_addr, flash_img_size_sectors)
+    flashcmd += 'mmc read 0x%08x 0 0x%x ; ' % (readback_addr, flash_img_size_sectors)
     return flashcmd
 
-def gen_flashcmd_nand(flash_image_addr, flash_img_size):
+def gen_flashcmd_nand(flash_image_addr, readback_addr, flash_img_size):
     flashcmd = 'nand erase.chip ; '
     flashcmd += 'nand write 0x%08x 0 0x%08x ; ' % (flash_image_addr, flash_img_size)
+    flashcmd += 'nand read 0x%08x 0 0x%08x ; ' % (readback_addr, flash_img_size)
     return flashcmd
 
-def gen_flashcmd_spi(flash_image_addr, flash_img_size):
+def gen_flashcmd_spi(flash_image_addr, readback_addr, flash_img_size):
     flash_id = config.get('flash-id-uboot', '0')
     flashcmd = 'sf probe %s ; ' % flash_id
     flashcmd += 'sf erase 0 0x%08x ; ' % config['flash-erase-size']
     flashcmd += 'sf write 0x%08x 0 0x%08x ; ' % (flash_image_addr, flash_img_size)
+    flashcmd += 'sf read 0x%08x 0 0x%08x ; ' % (readback_addr, flash_img_size)
     return flashcmd
 
 gen_flashcmds = {
@@ -124,6 +128,16 @@ def func_flash():
     flash_img_size = os.path.getsize(flash_img)
     if args.debug:
         print 'flash_img_size %d 0x%x' % (flash_img_size, flash_img_size)
+    flash_img_crc32 = subprocess.check_output(['crc32', flash_img]).strip()
+    if args.debug:
+        print 'flash_img_crc32 %s' % (flash_img_crc32)
+    crc32_i = int(flash_img_crc32, 16)
+    flash_img_crc32_bs = (
+        ((crc32_i & 0xff) << 24) |
+        ((crc32_i & 0xff00) << 8) |
+        ((crc32_i & 0xff0000) >> 8) |
+        ((crc32_i & 0xff000000) >> 24)
+    )
 
     u_boot_plus_dtb_size = u_boot_no_dtb_size + u_boot_dtb_size
     if args.debug:
@@ -144,6 +158,9 @@ def func_flash():
     flash_image_addr = loadaddr + padded_size
     if args.debug:
         print 'flash_image_addr %d 0x%x' % (flash_image_addr, flash_image_addr)
+    readback_addr = flash_image_addr + flash_img_size
+    if args.debug:
+        print 'readback_addr %d 0x%x' % (readback_addr, readback_addr)
 
     flash_type = config['flash-type']
     if not gen_flashcmds.has_key(flash_type):
@@ -165,9 +182,11 @@ def func_flash():
         run(workdir, cmd)
 
         bootcmd = ''
-        if args.debug:
-            bootcmd = 'crc32 0x%08x 0x%08x ; ' % (flash_image_addr, flash_img_size)
-        bootcmd += gen_flashcmd(flash_image_addr, flash_img_size)
+        bootcmd += 'crc32 0x%08x 0x%08x 0x%08x ; ' % (flash_image_addr, flash_img_size, soc['ram-base'])
+        bootcmd += 'if itest.l *0x%08x != 0x%x; then echo CRC MISMATCH of initial image; exit; fi ; ' % (soc['ram-base'], flash_img_crc32_bs)
+        bootcmd += gen_flashcmd(flash_image_addr, readback_addr, flash_img_size)
+        bootcmd += 'crc32 0x%08x 0x%08x 0x%08x ; ' % (readback_addr, flash_img_size, soc['ram-base'])
+        bootcmd += 'if itest.l *0x%08x != 0x%x; then echo CRC MISMATCH of readback image; exit; fi ; ' % (soc['ram-base'], flash_img_crc32_bs)
         bootcmd += 'env default -f -a ; '
         # Perhaps U-Boot should set $boardname based on the ID EEPROM; then we wouldn't need this
         if config['dtbfn-extra'] != '':
-- 
1.8.1.5
