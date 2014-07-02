From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 1/2] Switch flasher script to subprocess
Date: Wed,  2 Jul 2014 11:32:42 -0600
Message-ID: <1404322363-11580-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This avoids any issues re: quoting the commands we execute, such as
fdtput to modify the DTB sent to the flashing process.

The build script already uses subprocess, so this doesn't introduce any
new dependencies overall.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index ded8d171a14a..c9adba607c69 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -26,6 +26,7 @@ import os
 import os.path
 import shutil
 import stat
+import subprocess
 import sys
 import tempfile
 from tegraboardconfigs import *
@@ -42,15 +43,10 @@ def rmtree(path):
     if os.path.exists(path):
         shutil.rmtree(path)
 
-def run(dir, cmd):
-    oldcwd = os.getcwd()
-    print '+ cd', dir
-    os.chdir(dir)
-    print '+', cmd
-    ret = os.system(cmd)
-    if ret:
-        raise Exception('Command failed: %d' % ret)
-    os.chdir(oldcwd)
+def run(cd, cmd):
+    print '+ cd', cd
+    print '+', ' '.join(cmd)
+    subprocess.check_call(cmd, cwd=cd)
 
 def gen_flashcmd_mmc(flash_image_addr, readback_addr, flash_img_size):
     flash_id = config['flash-id-uboot']
@@ -97,7 +93,7 @@ def get_loadaddr():
 def gen_tegrarcm_cmd(bootloader, loadaddr):
     if type(loadaddr) != str:
         loadaddr = "0x%08x" % loadaddr
-    return 'tegrarcm --bct=' + bct + ' --bootloader=' + bootloader + ' --loadaddr=' + loadaddr
+    return ['tegrarcm', '--bct=' + bct, '--bootloader=' + bootloader , '--loadaddr=' + loadaddr]
 
 def find_config_dir():
     if not configs.has_key(args.configname):
@@ -198,8 +194,8 @@ def func_flash():
         u_boot_dtb_runflash = os.path.join(workdir, 'u-boot-runflash.dtb')
         cp(u_boot_dtb, u_boot_dtb_runflash)
 
-        # -2; never delay or interrupt
-        cmd = 'fdtput -p -t i ' + u_boot_dtb_runflash + ' /config bootdelay 0xfffffffe'
+        # 0xfffffffe==-2; never delay or interrupt
+        cmd = ['fdtput', '-p', '-t', 'i', u_boot_dtb_runflash, '/config', 'bootdelay', '0xfffffffe']
         run(workdir, cmd)
 
         bootcmd = ''
@@ -224,7 +220,7 @@ def func_flash():
         # If wanting to run installer, set installer_args.configname in environment, 'run bootcmd'
         bootcmd += 'reset'
         print 'bootcmd:', bootcmd
-        cmd = 'fdtput -p -t s ' + u_boot_dtb_runflash + ' /config bootcmd "' + bootcmd + '"'
+        cmd = ['fdtput', '-p', '-t', 's', u_boot_dtb_runflash, '/config', 'bootcmd', bootcmd]
         run(workdir, cmd)
 
         u_boot_dtb_runflash_size = os.path.getsize(u_boot_dtb_runflash)
@@ -249,12 +245,12 @@ def func_flash():
         os.fchmod(f.fileno(), stat.S_IRWXU | stat.S_IRWXG | stat.S_IRWXO)
         f.write("#!/bin/sh\n")
         f.write("\n")
-        f.write(cmd)
+        f.write(' '.join(cmd))
         f.write("\n")
         f.close()
 
         if not args.gen_only:
-            run(workdir, flasher_sh)
+            run(workdir, [flasher_sh])
     except:
         raise
     finally:
-- 
1.8.1.5
