From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH] Use actual U-Boot BSS size for padding when flashing
Date: Mon, 19 May 2014 14:42:20 -0600
Message-ID: <1400532140-19224-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In flashing mode, tegra-uboot-flasher downloads an image into RAM which
consists of the U-Boot binary, board DTB, some padding, and the image to
write into flash. The padding needs to be large enough so that the flash
image doesn't overlap with U-Boot's BSS at run-time, since the BSS is
zero'd out at boot, and stores variables that are written to at run-time.
Any overlap would cause the flash image to be corrupted.

tegra-uboot-flasher currently uses a guess of 1MB for the required
padding size. However, when enabling DFU support in U-Boot, the BSS size
balloons to well over 1MB, thus causing corruption to the flash image.
Solve this by recording the actual BSS size at build time, and using the
exact value at flashing time to calculate the padding. Add in an extra
4KB of padding just in case the DTB gets larger when adding in the
flashing commands. Previously, this was also assumed to fit into the
hard-coded 1MB of pad.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build               | 17 +++++++++++++++++
 tegra-uboot-flasher | 13 +++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/build b/build
index 5e94474de70b..139b502f885f 100755
--- a/build
+++ b/build
@@ -24,6 +24,7 @@ import argparse
 import multiprocessing
 import os
 import shutil
+import subprocess
 import sys
 from tegraboardconfigs import *
 
@@ -139,6 +140,22 @@ def import_uboot_one_board(boardname, build_uboot_dir):
     out_board_dir = gen_out_board_dir(boardname)
     mkdir(out_board_dir)
 
+    uboot = os.path.join(build_uboot_dir, 'u-boot')
+    cmd = [os.environ['CROSS_COMPILE'] + 'size', '-A', uboot]
+    lines = subprocess.check_output(cmd)
+    bss_size = None
+    for line in lines.split('\n'):
+        fields = line.split()
+        if fields[0] == '.bss':
+            bss_size = fields[1]
+            break
+    if not bss_size:
+        raise Exception('Could not find bss size in `size`')
+    dst = os.path.join(out_board_dir, 'u-boot-bss-size')
+    f = open(dst, 'wt')
+    f.write(bss_size)
+    f.close()
+
     src = os.path.join(build_uboot_dir, 'u-boot-nodtb-tegra.bin')
     dst = os.path.join(out_board_dir, 'u-boot-nodtb-tegra.bin')
     cp(src, dst)
diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index 8c6a21c54510..ded8d171a14a 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -156,9 +156,18 @@ def func_flash():
     if args.debug:
         print 'u_boot_plus_dtb_size %d 0x%x' % (u_boot_plus_dtb_size, u_boot_plus_dtb_size)
 
-    # Add 1024k to avoid U-Boot's BSS, and in case the DT size changes due to fdtput
+    bss_size_fn = os.path.join(out_board_dir, 'u-boot-bss-size')
+    bss_size_f = open(bss_size_fn, 'rt')
+    bss_size_s = bss_size_f.read()
+    bss_size_f.close()
+    bss_size = int(bss_size_s)
+    if args.debug:
+        print 'bss_size %d 0x%x' % (bss_size, bss_size)
+
+    # Avoid U-Boot's BSS, so the BSS-zeroing doesn't trash the DTB
+    # Add 4KB in case the DTB size changes due to fdtput
     # Align to 4k, so flash writes don't need a bounce buffer for DMA
-    padded_size = (u_boot_plus_dtb_size + (1024 * 1024) + (4 * 1024) - 1) & ~((4 * 1024) - 1)
+    padded_size = (u_boot_plus_dtb_size + bss_size + (2 * 4 * 1024) - 1) & ~((4 * 1024) - 1)
     if args.debug:
         print 'padded_size %d 0x%x' % (padded_size, padded_size)
 
-- 
1.8.1.5
