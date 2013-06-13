From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH flasher 1/2] Pre-calculate more in find_config_dir()
Date: Thu, 13 Jun 2013 11:05:49 -0600
Message-ID: <1371143150-3935-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Set more global variables in find_config_dir(). These remove duplicate
lookups and/or will be re-used by a future "exec" sub-command.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index aae7f19..1bdf944 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -52,7 +52,7 @@ def run(dir, cmd):
     os.chdir(oldcwd)
 
 def gen_flashcmd_mmc(flash_image_addr, flash_img_size):
-    flash_id = configs[args.configname]['flash-id-uboot']
+    flash_id = config['flash-id-uboot']
     flash_img_size_sectors = flash_img_size / 512
     flashcmd = 'mmc dev %d 1 ; ' % flash_id
     flashcmd += 'mmc write 0x%08x 0 0x%x ; ' % (flash_image_addr, flash_img_size_sectors)
@@ -65,7 +65,7 @@ def gen_flashcmd_nand(flash_image_addr, flash_img_size):
 
 def gen_flashcmd_spi(flash_image_addr, flash_img_size):
     flashcmd = 'sf probe 0 ; '
-    flashcmd += 'sf erase 0 0x%08x ; ' % configs[args.configname]['flash-erase-size']
+    flashcmd += 'sf erase 0 0x%08x ; ' % config['flash-erase-size']
     flashcmd += 'sf write 0x%08x 0 0x%08x ; ' % (flash_image_addr, flash_img_size)
     return flashcmd
 
@@ -80,11 +80,15 @@ def find_config_dir():
         print 'Unknown config "%s"' % args.configname
         sys.exit(1)
 
-    global boardname, socname, out_board_dir
+    global config, boardname, board, socname, soc, out_board_dir, bct
 
-    boardname = configs[args.configname]['board']
-    socname = boards[boardname]['soc']
+    config = configs[args.configname]
+    boardname = config['board']
+    board = boards[boardname]
+    socname = board['soc']
+    soc = socs[socname]
     out_board_dir = os.path.join(args.data_dir, boardname)
+    bct = os.path.join(out_board_dir, config['bct'])
 
 def func_list_configs():
     for configname in sorted(configs.keys()):
@@ -106,13 +110,11 @@ def func_flash():
     if args.flash_image:
         flash_img = args.flash_img
     else:
-        flash_img = os.path.join(out_board_dir, configs[args.configname]['flash-image'])
+        flash_img = os.path.join(out_board_dir, config['flash-image'])
     flash_img_size = os.path.getsize(flash_img)
     if args.debug:
         print 'flash_img_size %d 0x%x' % (flash_img_size, flash_img_size)
 
-    bct = os.path.join(out_board_dir, configs[args.configname]['bct'])
-
     u_boot_plus_dtb_size = u_boot_no_dtb_size + u_boot_dtb_size
     if args.debug:
         print 'u_boot_plus_dtb_size %d 0x%x' % (u_boot_plus_dtb_size, u_boot_plus_dtb_size)
@@ -128,12 +130,12 @@ def func_flash():
         print 'pad_size %d 0x%x' % (pad_size, pad_size)
 
     # 0x00108000 is CONFIG_SYS_TEXT_BASE in U-Boot, minus RAM base
-    loadaddr = socs[socname]['ram-base'] + 0x00108000
+    loadaddr = soc['ram-base'] + 0x00108000
     flash_image_addr = loadaddr + padded_size
     if args.debug:
         print 'flash_image_addr %d 0x%x' % (flash_image_addr, flash_image_addr)
 
-    flash_type = configs[args.configname]['flash-type']
+    flash_type = config['flash-type']
     if not gen_flashcmds.has_key(flash_type):
         print 'flash-type "%s" not yet supported' % flash_type
         sys.exit(1)
@@ -158,8 +160,8 @@ def func_flash():
         bootcmd += gen_flashcmd(flash_image_addr, flash_img_size)
         bootcmd += 'env default -f -a ; '
         # Perhaps U-Boot should set $boardname based on the ID EEPROM; then we wouldn't need this
-        if configs[args.configname]['dtbfn-extra'] != '':
-            bootcmd += 'setenv board ' + boardname + configs[args.configname]['dtbfn-extra'] + ' ; '
+        if config['dtbfn-extra'] != '':
+            bootcmd += 'setenv board ' + boardname + config['dtbfn-extra'] + ' ; '
         bootcmd += 'saveenv ; '
         # To update the bootloader, reset.
         # If wanting to run installer, set installer_args.configname in environment, 'run bootcmd'
-- 
1.8.1.5
