From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH flasher 2/2] Implement exec sub-command
Date: Thu, 13 Jun 2013 11:05:50 -0600
Message-ID: <1371143150-3935-2-git-send-email-swarren@wwwdotorg.org>
References: <1371143150-3935-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371143150-3935-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This mode of operation is a very simple wrapper around tegrarcm, which
eliminates the need to remember which BCT to use for each configuration.
This can be useful for quickly testing changes to U-Boot without writing
it to flash every time.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README-user.txt     | 17 +++++++++++++++--
 tegra-uboot-flasher | 47 +++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/README-user.txt b/README-user.txt
index 249a096..b653144 100644
--- a/README-user.txt
+++ b/README-user.txt
@@ -20,8 +20,8 @@ You may find a list of valid values for configname by executing:
 
 tegra-uboot-flasher list-configs
 
-Simple Usage
-============
+Simple Usage - Flashing
+=======================
 
 To flash a board, connect a USB cable from your host PC to the Tegra device,
 place that board into USB recovery mode, and execute the following as root
@@ -35,6 +35,19 @@ flashed boot image, and the system will proceed to boot normally. Depending
 on the board and U-Boot support, the flashing process may be observed via the
 debug serial port, or on a built-in LCD panel.
 
+Simple Usage - Testing U-Boot
+=============================
+
+If you simply want to download an unmodified U-Boot to the Tegra device and
+execute it, execute the following as root on the host machine:
+
+tegra-uboot-flasher exec CONFIG
+
+This can be useful for quickly testing changes to U-Boot without writing it
+to flash every time. This mode of operation is a very simple wrapper around
+tegrarcm, which eliminates the need to remember which BCT to use for each
+board configuration.
+
 Advanced Options
 ================
 
diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index 1bdf944..ac727a0 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -75,6 +75,15 @@ gen_flashcmds = {
     'spi': gen_flashcmd_spi,
 }
 
+def get_loadaddr():
+    # 0x00108000 is CONFIG_SYS_TEXT_BASE in U-Boot, minus RAM base
+    return soc['ram-base'] + 0x00108000
+
+def gen_tegrarcm_cmd(bootloader, loadaddr):
+    if type(loadaddr) != str:
+        loadaddr = "0x%08x" % loadaddr
+    return 'tegrarcm --bct=' + bct + ' --bootloader=' + bootloader + ' --loadaddr=' + loadaddr
+
 def find_config_dir():
     if not configs.has_key(args.configname):
         print 'Unknown config "%s"' % args.configname
@@ -130,7 +139,7 @@ def func_flash():
         print 'pad_size %d 0x%x' % (pad_size, pad_size)
 
     # 0x00108000 is CONFIG_SYS_TEXT_BASE in U-Boot, minus RAM base
-    loadaddr = soc['ram-base'] + 0x00108000
+    loadaddr = get_loadaddr()
     flash_image_addr = loadaddr + padded_size
     if args.debug:
         print 'flash_image_addr %d 0x%x' % (flash_image_addr, flash_image_addr)
@@ -185,7 +194,7 @@ def func_flash():
         shutil.copyfileobj(open(flash_img, 'rb'), f)
         f.close()
 
-        cmd = 'tegrarcm --bct=' + bct + ' --bootloader=' + uboot_flasher + ' --loadaddr=0x%08x' % loadaddr
+        cmd = gen_tegrarcm_cmd(uboot_flasher, loadaddr)
 
         flasher_sh = os.path.join(workdir, 'flasher.sh')
         f = open(flasher_sh, 'wt')
@@ -206,6 +215,22 @@ def func_flash():
         else:
             rmtree(workdir)
 
+def func_exec():
+    find_config_dir()
+
+    if args.bootloader:
+        bootloader = args.bootloader
+    else:
+        bootloader = os.path.join(out_board_dir, 'u-boot-dtb-tegra.bin')
+
+    if args.loadaddr:
+        loadaddr = args.loadaddr
+    else:
+        loadaddr = get_loadaddr()
+
+    cmd = gen_tegrarcm_cmd(bootloader, loadaddr)
+    run(scripts_dir, cmd)
+
 parser = argparse.ArgumentParser(description='Execute a bootloader on a ' +
     'Tegra board, possibly modifying it prior to download so as to execute ' +
     'commands, such as writing an image to flash.')
@@ -234,8 +259,22 @@ parser_flash.add_argument('--flash-image', type=str,
     help='The flash image to write, instead of U-Boot itself')
 parser_flash.add_argument('--gen-only', action='store_true',
     help='Just create the work-dir; don\'t actually flash the image')
-parser_flash.add_argument('configname', metavar='CONFIG', type=str,
-    help='The configuration name of the board')
+
+parser_exec = subparsers.add_parser('exec',
+    help='Download and execute an unmodified bootloader binary, named ' +
+        'u-boot-dtb-tegra.bin by default. This can be useful to simply test ' +
+        'a U-Boot build without flashing it, or to download something other ' +
+        'than U-Boot')
+parser_exec.set_defaults(func = func_exec)
+parser_exec.add_argument('--bootloader', type=str,
+    help='The bootloader to download. Defaults to u-boot-dtb-tegra.bin in ' +
+        'the data directory')
+parser_exec.add_argument('--loadaddr', type=str,
+    help='Load address for the bootloader binary')
+
+for p in (parser_flash, parser_exec):
+    p.add_argument('configname', metavar='CONFIG', type=str,
+        help='The configuration name of the board')
 
 args = parser.parse_args()
 if args.debug: print args
-- 
1.8.1.5
