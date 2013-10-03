From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 2/2] Add command to import U-Boot binaries from an external location
Date: Thu,  3 Oct 2013 14:51:10 -0600
Message-ID: <1380833470-32189-2-git-send-email-swarren@wwwdotorg.org>
References: <1380833470-32189-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380833470-32189-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This option is useful if the user already builds U-Boot in a directory
not managed by the tegra-uboot-flasher manifest. This may happen when
an active U-Boot developer wishes to use the flasher scripts without
relocating their U-Boot development, or when performing separate
automated builds of U-Boot and the flasher, with the flasher build
picking up the result of an abitrary U-Boot build under the control of
the automated build system.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/build b/build
index 134d6de..6142f31 100755
--- a/build
+++ b/build
@@ -127,17 +127,10 @@ def dtb_filename(config):
     boardname = configs[config]['board']
     return boards[boardname]['soc'] + '-' + boardname + extra + '.dtb'
 
-def build_uboot_one_board(boardname):
-    build_board_dir = gen_build_board_dir(boardname)
-    build_uboot_dir = gen_build_uboot_dir(build_board_dir)
-    mkdir(build_uboot_dir)
-
+def import_uboot_one_board(boardname, build_uboot_dir):
     out_board_dir = gen_out_board_dir(boardname)
     mkdir(out_board_dir)
 
-    run(uboot_dir, 'make BUILD_DIR=' + build_uboot_dir + ' ' + boardname + '_config')
-    run(uboot_dir, 'make BUILD_DIR=' + build_uboot_dir + ' -s ' + makejobs)
-
     src = os.path.join(build_uboot_dir, 'u-boot-nodtb-tegra.bin')
     dst = os.path.join(out_board_dir, 'u-boot-nodtb-tegra.bin')
     cp(src, dst)
@@ -150,6 +143,27 @@ def build_uboot_one_board(boardname):
     dst = os.path.join(out_board_dir, 'u-boot-dtb-tegra.bin')
     cp(src, dst)
 
+def cmd_import_uboot():
+    boardname = None
+    for i in all_enabled_boardnames():
+        if boardname:
+            raise Exception('import-uboot only allows one enabled board')
+        boardname = i
+    import_uboot_one_board(boardname, args.builddir)
+
+def build_uboot_one_board(boardname):
+    build_board_dir = gen_build_board_dir(boardname)
+    build_uboot_dir = gen_build_uboot_dir(build_board_dir)
+    mkdir(build_uboot_dir)
+
+    out_board_dir = gen_out_board_dir(boardname)
+    mkdir(out_board_dir)
+
+    run(uboot_dir, 'make BUILD_DIR=' + build_uboot_dir + ' ' + boardname + '_config')
+    run(uboot_dir, 'make BUILD_DIR=' + build_uboot_dir + ' -s ' + makejobs)
+
+    import_uboot_one_board(boardname, build_uboot_dir)
+
 def cmd_build_uboots():
     for boardname in all_enabled_boardnames():
         build_uboot_one_board(boardname)
@@ -222,6 +236,12 @@ parser.add_argument('--boards', type=str,
 
 subparsers = parser.add_subparsers()
 
+subparser = subparsers.add_parser('import-uboot',
+    help='Import U-Boot binaries from an external build tree')
+subparser.add_argument('builddir', type=str,
+    help='The external build directory to import from.')
+subparser.set_defaults(func = cmd_import_uboot)
+
 subparser = subparsers.add_parser('build-uboots',
     help='Build U-Boot binaries')
 subparser.set_defaults(func = cmd_build_uboots)
-- 
1.8.1.5
