From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH V2 1/4] Add crc32 verification of the flash image
Date: Fri,  6 Dec 2013 10:35:33 -0700
Message-ID: <1386351334-25766-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Verify the CRC32 of the flash image at two points in time:

1) Before starting the flashing process, to validate the download of the
   image into Tegra's RAM.

2) After writing the image to flash, read it back into RAM, in order to
   validate that it was correctly written to flash.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: Use binascii.crc32() rather than shelling out to crc32 binary

(Note that I'm only resending 1/4 and 3/4 for V2; the others are unchanged)
---
 tegra-uboot-flasher | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index 41879c396b2f..3c696c23604f 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -21,6 +21,7 @@
 # DEALINGS IN THE SOFTWARE.
 
 import argparse
+import binascii
 import os
 import os.path
 import shutil
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
@@ -125,6 +129,19 @@ def func_flash():
     if args.debug:
         print 'flash_img_size %d 0x%x' % (flash_img_size, flash_img_size)
 
+    imgf = file(flash_img, 'rb')
+    imgd = imgf.read()
+    imgf.close()
+    flash_img_crc32 = binascii.crc32(imgd)
+    if args.debug:
+        print 'flash_img_crc32 %x' % flash_img_crc32
+    flash_img_crc32_bs = (
+        ((flash_img_crc32 & 0xff) << 24) |
+        ((flash_img_crc32 & 0xff00) << 8) |
+        ((flash_img_crc32 & 0xff0000) >> 8) |
+        ((flash_img_crc32 & 0xff000000) >> 24)
+    )
+
     u_boot_plus_dtb_size = u_boot_no_dtb_size + u_boot_dtb_size
     if args.debug:
         print 'u_boot_plus_dtb_size %d 0x%x' % (u_boot_plus_dtb_size, u_boot_plus_dtb_size)
@@ -144,6 +161,9 @@ def func_flash():
     flash_image_addr = loadaddr + padded_size
     if args.debug:
         print 'flash_image_addr %d 0x%x' % (flash_image_addr, flash_image_addr)
+    readback_addr = flash_image_addr + flash_img_size
+    if args.debug:
+        print 'readback_addr %d 0x%x' % (readback_addr, readback_addr)
 
     flash_type = config['flash-type']
     if not gen_flashcmds.has_key(flash_type):
@@ -165,9 +185,11 @@ def func_flash():
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
