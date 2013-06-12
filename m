From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [[PATCH flasher] 1/6] Move functions and data to start of file
Date: Wed, 12 Jun 2013 17:30:02 -0600
Message-ID: <1371079807-16541-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Future changes will create separate functions for the sub-commands that
tegra-uboot-flasher implements. This change prepares for that by moving
other functions away from what will be the body of some of those
functions.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 92 ++++++++++++++++++++++++++---------------------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index ecc7ac8..447ff37 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -29,6 +29,52 @@ import sys
 import tempfile
 from tegraboardconfigs import *
 
+def mkdir(path):
+    if not os.path.isdir(path):
+        os.makedirs(path)
+
+def cp(src, dst):
+    print '+ cp', src, dst
+    shutil.copy(src, dst)
+
+def rmtree(path):
+    if os.path.exists(path):
+        shutil.rmtree(path)
+
+def run(dir, cmd):
+    oldcwd = os.getcwd()
+    print '+ cd', dir
+    os.chdir(dir)
+    print '+', cmd
+    ret = os.system(cmd)
+    if ret:
+        raise Exception('Command failed: %d' % ret)
+    os.chdir(oldcwd)
+
+def gen_flashcmd_mmc():
+    flash_id = configs[args.configname]['flash-id-uboot']
+    flash_img_size_sectors = flash_img_size / 512
+    flashcmd = 'mmc dev %d 1 ; ' % flash_id
+    flashcmd += 'mmc write 0x%08x 0 0x%x ; ' % (flash_image_addr, flash_img_size_sectors)
+    return flashcmd
+
+def gen_flashcmd_nand():
+    flashcmd = 'nand erase.chip ; '
+    flashcmd += 'nand write 0x%08x 0 0x%08x ; ' % (flash_image_addr, flash_img_size)
+    return flashcmd
+
+def gen_flashcmd_spi():
+    flashcmd = 'sf probe 0 ; '
+    flashcmd += 'sf erase 0 0x%08x ; ' % configs[args.configname]['flash-erase-size']
+    flashcmd += 'sf write 0x%08x 0 0x%08x ; ' % (flash_image_addr, flash_img_size)
+    return flashcmd
+
+gen_flashcmds = {
+    'emmc': gen_flashcmd_mmc,
+    'nand': gen_flashcmd_nand,
+    'spi': gen_flashcmd_spi,
+}
+
 parser = argparse.ArgumentParser(description='Write an image to a Tegra board\'s flash')
 parser.add_argument('--debug', action='store_true',
                    help='Turn on debugging prints')
@@ -125,52 +171,6 @@ flash_image_addr = loadaddr + padded_size
 if args.debug:
     print 'flash_image_addr %d 0x%x' % (flash_image_addr, flash_image_addr)
 
-def mkdir(path):
-    if not os.path.isdir(path):
-        os.makedirs(path)
-
-def cp(src, dst):
-    print '+ cp', src, dst
-    shutil.copy(src, dst)
-
-def rmtree(path):
-    if os.path.exists(path):
-        shutil.rmtree(path)
-
-def run(dir, cmd):
-    oldcwd = os.getcwd()
-    print '+ cd', dir
-    os.chdir(dir)
-    print '+', cmd
-    ret = os.system(cmd)
-    if ret:
-        raise Exception('Command failed: %d' % ret)
-    os.chdir(oldcwd)
-
-def gen_flashcmd_mmc():
-    flash_id = configs[args.configname]['flash-id-uboot']
-    flash_img_size_sectors = flash_img_size / 512
-    flashcmd = 'mmc dev %d 1 ; ' % flash_id
-    flashcmd += 'mmc write 0x%08x 0 0x%x ; ' % (flash_image_addr, flash_img_size_sectors)
-    return flashcmd
-
-def gen_flashcmd_nand():
-    flashcmd = 'nand erase.chip ; '
-    flashcmd += 'nand write 0x%08x 0 0x%08x ; ' % (flash_image_addr, flash_img_size)
-    return flashcmd
-
-def gen_flashcmd_spi():
-    flashcmd = 'sf probe 0 ; '
-    flashcmd += 'sf erase 0 0x%08x ; ' % configs[args.configname]['flash-erase-size']
-    flashcmd += 'sf write 0x%08x 0 0x%08x ; ' % (flash_image_addr, flash_img_size)
-    return flashcmd
-
-gen_flashcmds = {
-    'emmc': gen_flashcmd_mmc,
-    'nand': gen_flashcmd_nand,
-    'spi': gen_flashcmd_spi,
-}
-
 flash_type = configs[args.configname]['flash-type']
 if not gen_flashcmds.has_key(flash_type):
     print 'flash-type "%s" not yet supported' % flash_type
-- 
1.8.1.5
