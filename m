From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [[PATCH flasher] 5/6] Split flashing implementation into a separate function
Date: Wed, 12 Jun 2013 17:30:06 -0600
Message-ID: <1371079807-16541-5-git-send-email-swarren@wwwdotorg.org>
References: <1371079807-16541-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371079807-16541-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Now, each sub-command is its own function

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 228 ++++++++++++++++++++++++++--------------------------
 1 file changed, 115 insertions(+), 113 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index c4c42a1..630b0fb 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -90,6 +90,120 @@ def func_list_configs():
     for configname in sorted(configs.keys()):
         print configname
 
+def func_flash():
+    find_config_dir()
+
+    u_boot_no_dtb = os.path.join(out_board_dir, 'u-boot-nodtb-tegra.bin')
+    u_boot_no_dtb_size = os.path.getsize(u_boot_no_dtb)
+    if args.debug:
+        print 'u_boot_no_dtb_size %d 0x%x' % (u_boot_no_dtb_size, u_boot_no_dtb_size)
+
+    u_boot_dtb = os.path.join(out_board_dir, 'u-boot.dtb')
+    u_boot_dtb_size = os.path.getsize(u_boot_dtb)
+    if args.debug:
+        print 'u_boot_dtb_size %d 0x%x' % (u_boot_dtb_size, u_boot_dtb_size)
+
+    if args.flash_image:
+        flash_img = args.flash_img
+    else:
+        flash_img = os.path.join(out_board_dir, configs[args.configname]['flash-image'])
+    flash_img_size = os.path.getsize(flash_img)
+    if args.debug:
+        print 'flash_img_size %d 0x%x' % (flash_img_size, flash_img_size)
+
+    bct = os.path.join(out_board_dir, configs[args.configname]['bct'])
+
+    u_boot_plus_dtb_size = u_boot_no_dtb_size + u_boot_dtb_size
+    if args.debug:
+        print 'u_boot_plus_dtb_size %d 0x%x' % (u_boot_plus_dtb_size, u_boot_plus_dtb_size)
+
+    # Add 32k in case size changes due to fdtput
+    # Align to 4k, so flash writes don't need a bounce buffer for DMA
+    padded_size = (u_boot_plus_dtb_size + (32 * 1024) + (4 * 1024) - 1) & ~((4 * 1024) - 1)
+    if args.debug:
+        print 'padded_size %d 0x%x' % (padded_size, padded_size)
+
+    pad_size = padded_size - u_boot_plus_dtb_size
+    if args.debug:
+        print 'pad_size %d 0x%x' % (pad_size, pad_size)
+
+    # 0x00108000 is CONFIG_SYS_TEXT_BASE in U-Boot, minus RAM base
+    loadaddr = socs[socname]['ram-base'] + 0x00108000
+    flash_image_addr = loadaddr + padded_size
+    if args.debug:
+        print 'flash_image_addr %d 0x%x' % (flash_image_addr, flash_image_addr)
+
+    flash_type = configs[args.configname]['flash-type']
+    if not gen_flashcmds.has_key(flash_type):
+        print 'flash-type "%s" not yet supported' % flash_type
+        sys.exit(1)
+    gen_flashcmd = gen_flashcmds[flash_type]
+
+    if args.work_dir:
+        workdir = os.path.abspath(args.work_dir)
+        mkdir(workdir)
+    else:
+        workdir = tempfile.mkdtemp()
+    try:
+        u_boot_dtb_runflash = os.path.join(workdir, 'u-boot-runflash.dtb')
+        cp(u_boot_dtb, u_boot_dtb_runflash)
+
+        # -2; never delay or interrupt
+        cmd = 'fdtput -p -t i ' + u_boot_dtb_runflash + ' /config bootdelay 0xfffffffe'
+        run(workdir, cmd)
+
+        bootcmd = ''
+        if args.debug:
+            bootcmd = 'crc32 0x%08x 0x%08x ; ' % (flash_image_addr, flash_img_size)
+        bootcmd += gen_flashcmd(flash_image_addr, flash_img_size)
+        bootcmd += 'env default -f -a ; '
+        # Perhaps U-Boot should set $boardname based on the ID EEPROM; then we wouldn't need this
+        if configs[args.configname]['dtbfn-extra'] != '':
+            bootcmd += 'setenv board ' + boardname + configs[args.configname]['dtbfn-extra'] + ' ; '
+        bootcmd += 'saveenv ; '
+        # To update the bootloader, reset.
+        # If wanting to run installer, set installer_args.configname in environment, 'run bootcmd'
+        bootcmd += 'reset'
+        print 'bootcmd:', bootcmd
+        cmd = 'fdtput -p -t s ' + u_boot_dtb_runflash + ' /config bootcmd "' + bootcmd + '"'
+        run(workdir, cmd)
+
+        u_boot_dtb_runflash_size = os.path.getsize(u_boot_dtb_runflash)
+        if args.debug:
+            print 'u_boot_dtb_runflash_size %d 0x%x' % (u_boot_dtb_runflash_size, u_boot_dtb_runflash_size)
+        pad_size -= (u_boot_dtb_runflash_size - u_boot_dtb_size)
+        if args.debug:
+            print 'pad_size %d 0x%x' % (pad_size, pad_size)
+
+        uboot_flasher = os.path.join(workdir, 'u-boot-flasher.bin')
+        f = open(uboot_flasher, 'wb')
+        shutil.copyfileobj(open(u_boot_no_dtb, 'rb'), f)
+        shutil.copyfileobj(open(u_boot_dtb_runflash, 'rb'), f)
+        f.write(chr(0) * pad_size)
+        shutil.copyfileobj(open(flash_img, 'rb'), f)
+        f.close()
+
+        cmd = 'tegrarcm --bct=' + bct + ' --bootloader=' + uboot_flasher + ' --loadaddr=0x%08x' % loadaddr
+
+        flasher_sh = os.path.join(workdir, 'flasher.sh')
+        f = open(flasher_sh, 'wt')
+        os.fchmod(f.fileno(), stat.S_IRWXU | stat.S_IRWXG | stat.S_IRWXO)
+        f.write("#!/bin/sh\n")
+        f.write("\n")
+        f.write(cmd)
+        f.write("\n")
+        f.close()
+
+        if not args.gen_only:
+            run(workdir, flasher_sh)
+    except:
+        raise
+    finally:
+        if args.save_work_dir:
+            print 'Not removing work directory:', workdir
+        else:
+            rmtree(workdir)
+
 parser = argparse.ArgumentParser(description='Write an image to a Tegra board\'s flash')
 parser.add_argument('--debug', action='store_true',
                    help='Turn on debugging prints')
@@ -134,117 +248,5 @@ load_configs(os.path.join(args.data_dir, 'configs'))
 
 if args.list_confignames:
     func_list_configs()
-    sys.exit(0)
-
-find_config_dir()
-
-u_boot_no_dtb = os.path.join(out_board_dir, 'u-boot-nodtb-tegra.bin')
-u_boot_no_dtb_size = os.path.getsize(u_boot_no_dtb)
-if args.debug:
-    print 'u_boot_no_dtb_size %d 0x%x' % (u_boot_no_dtb_size, u_boot_no_dtb_size)
-
-u_boot_dtb = os.path.join(out_board_dir, 'u-boot.dtb')
-u_boot_dtb_size = os.path.getsize(u_boot_dtb)
-if args.debug:
-    print 'u_boot_dtb_size %d 0x%x' % (u_boot_dtb_size, u_boot_dtb_size)
-
-if args.flash_image:
-    flash_img = args.flash_img
-else:
-    flash_img = os.path.join(out_board_dir, configs[args.configname]['flash-image'])
-flash_img_size = os.path.getsize(flash_img)
-if args.debug:
-    print 'flash_img_size %d 0x%x' % (flash_img_size, flash_img_size)
-
-bct = os.path.join(out_board_dir, configs[args.configname]['bct'])
-
-u_boot_plus_dtb_size = u_boot_no_dtb_size + u_boot_dtb_size
-if args.debug:
-    print 'u_boot_plus_dtb_size %d 0x%x' % (u_boot_plus_dtb_size, u_boot_plus_dtb_size)
-
-# Add 32k in case size changes due to fdtput
-# Align to 4k, so flash writes don't need a bounce buffer for DMA
-padded_size = (u_boot_plus_dtb_size + (32 * 1024) + (4 * 1024) - 1) & ~((4 * 1024) - 1)
-if args.debug:
-    print 'padded_size %d 0x%x' % (padded_size, padded_size)
-
-pad_size = padded_size - u_boot_plus_dtb_size
-if args.debug:
-    print 'pad_size %d 0x%x' % (pad_size, pad_size)
-
-# 0x00108000 is CONFIG_SYS_TEXT_BASE in U-Boot, minus RAM base
-loadaddr = socs[socname]['ram-base'] + 0x00108000
-flash_image_addr = loadaddr + padded_size
-if args.debug:
-    print 'flash_image_addr %d 0x%x' % (flash_image_addr, flash_image_addr)
-
-flash_type = configs[args.configname]['flash-type']
-if not gen_flashcmds.has_key(flash_type):
-    print 'flash-type "%s" not yet supported' % flash_type
-    sys.exit(1)
-gen_flashcmd = gen_flashcmds[flash_type]
-
-if args.work_dir:
-    workdir = os.path.abspath(args.work_dir)
-    mkdir(workdir)
 else:
-    workdir = tempfile.mkdtemp()
-try:
-    u_boot_dtb_runflash = os.path.join(workdir, 'u-boot-runflash.dtb')
-    cp(u_boot_dtb, u_boot_dtb_runflash)
-
-    # -2; never delay or interrupt
-    cmd = 'fdtput -p -t i ' + u_boot_dtb_runflash + ' /config bootdelay 0xfffffffe'
-    run(workdir, cmd)
-
-    bootcmd = ''
-    if args.debug:
-        bootcmd = 'crc32 0x%08x 0x%08x ; ' % (flash_image_addr, flash_img_size)
-    bootcmd += gen_flashcmd(flash_image_addr, flash_img_size)
-    bootcmd += 'env default -f -a ; '
-    # Perhaps U-Boot should set $boardname based on the ID EEPROM; then we wouldn't need this
-    if configs[args.configname]['dtbfn-extra'] != '':
-        bootcmd += 'setenv board ' + boardname + configs[args.configname]['dtbfn-extra'] + ' ; '
-    bootcmd += 'saveenv ; '
-    # To update the bootloader, reset.
-    # If wanting to run installer, set installer_args.configname in environment, 'run bootcmd'
-    bootcmd += 'reset'
-    print 'bootcmd:', bootcmd
-    cmd = 'fdtput -p -t s ' + u_boot_dtb_runflash + ' /config bootcmd "' + bootcmd + '"'
-    run(workdir, cmd)
-
-    u_boot_dtb_runflash_size = os.path.getsize(u_boot_dtb_runflash)
-    if args.debug:
-        print 'u_boot_dtb_runflash_size %d 0x%x' % (u_boot_dtb_runflash_size, u_boot_dtb_runflash_size)
-    pad_size -= (u_boot_dtb_runflash_size - u_boot_dtb_size)
-    if args.debug:
-        print 'pad_size %d 0x%x' % (pad_size, pad_size)
-
-    uboot_flasher = os.path.join(workdir, 'u-boot-flasher.bin')
-    f = open(uboot_flasher, 'wb')
-    shutil.copyfileobj(open(u_boot_no_dtb, 'rb'), f)
-    shutil.copyfileobj(open(u_boot_dtb_runflash, 'rb'), f)
-    f.write(chr(0) * pad_size)
-    shutil.copyfileobj(open(flash_img, 'rb'), f)
-    f.close()
-
-    cmd = 'tegrarcm --bct=' + bct + ' --bootloader=' + uboot_flasher + ' --loadaddr=0x%08x' % loadaddr
-
-    flasher_sh = os.path.join(workdir, 'flasher.sh')
-    f = open(flasher_sh, 'wt')
-    os.fchmod(f.fileno(), stat.S_IRWXU | stat.S_IRWXG | stat.S_IRWXO)
-    f.write("#!/bin/sh\n")
-    f.write("\n")
-    f.write(cmd)
-    f.write("\n")
-    f.close()
-
-    if not args.gen_only:
-        run(workdir, flasher_sh)
-except:
-    raise
-finally:
-    if args.save_work_dir:
-        print 'Not removing work directory:', workdir
-    else:
-        rmtree(workdir)
+    func_flash()
-- 
1.8.1.5
