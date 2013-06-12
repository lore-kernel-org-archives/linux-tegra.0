From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [[PATCH flasher] 4/6] Add parameters to gen_flashcmd_*
Date: Wed, 12 Jun 2013 17:30:05 -0600
Message-ID: <1371079807-16541-4-git-send-email-swarren@wwwdotorg.org>
References: <1371079807-16541-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371079807-16541-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This way, they don't rely on global variables, which won't be global
once the flashing code is in a separate function.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index 390ae0e..c4c42a1 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -51,19 +51,19 @@ def run(dir, cmd):
         raise Exception('Command failed: %d' % ret)
     os.chdir(oldcwd)
 
-def gen_flashcmd_mmc():
+def gen_flashcmd_mmc(flash_image_addr, flash_img_size):
     flash_id = configs[args.configname]['flash-id-uboot']
     flash_img_size_sectors = flash_img_size / 512
     flashcmd = 'mmc dev %d 1 ; ' % flash_id
     flashcmd += 'mmc write 0x%08x 0 0x%x ; ' % (flash_image_addr, flash_img_size_sectors)
     return flashcmd
 
-def gen_flashcmd_nand():
+def gen_flashcmd_nand(flash_image_addr, flash_img_size):
     flashcmd = 'nand erase.chip ; '
     flashcmd += 'nand write 0x%08x 0 0x%08x ; ' % (flash_image_addr, flash_img_size)
     return flashcmd
 
-def gen_flashcmd_spi():
+def gen_flashcmd_spi(flash_image_addr, flash_img_size):
     flashcmd = 'sf probe 0 ; '
     flashcmd += 'sf erase 0 0x%08x ; ' % configs[args.configname]['flash-erase-size']
     flashcmd += 'sf write 0x%08x 0 0x%08x ; ' % (flash_image_addr, flash_img_size)
@@ -200,7 +200,7 @@ try:
     bootcmd = ''
     if args.debug:
         bootcmd = 'crc32 0x%08x 0x%08x ; ' % (flash_image_addr, flash_img_size)
-    bootcmd += gen_flashcmd()
+    bootcmd += gen_flashcmd(flash_image_addr, flash_img_size)
     bootcmd += 'env default -f -a ; '
     # Perhaps U-Boot should set $boardname based on the ID EEPROM; then we wouldn't need this
     if configs[args.configname]['dtbfn-extra'] != '':
-- 
1.8.1.5
