From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH] Adapt to new U-Boot build commands
Date: Thu, 31 Jul 2014 11:48:05 -0600
Message-ID: <1406828885-8561-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Masahiro Yamada <yamada.m-NAum8xwdG0+S7A1Ibl2khg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

U-Boot commit 51148790f26e "kconfig: switch to Kconfig" changed the
commands required to configure U-Boot. Adapt the flasher build script
to those changes, in a way that automatically works with either old or
new U-Boot source trees.

Cc: Masahiro Yamada <yamada.m-NAum8xwdG0+S7A1Ibl2khg@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/build b/build
index af863dd3b395..e61cac8ea4c7 100755
--- a/build
+++ b/build
@@ -186,7 +186,17 @@ def build_uboot_one_board(boardname):
     out_board_dir = gen_out_board_dir(boardname)
     mkdir(out_board_dir)
 
-    run(uboot_dir, 'make O=' + build_uboot_dir + ' ' + boardname + '_config')
+    # U-Boot commit 51148790f26e "kconfig: switch to Kconfig" changed the
+    # build commands from "make ${board}_config; make" to
+    # "make ${board}_defconfig; make". That commit also added file
+    # scripts/multiconfig.py, so we happen to have an easy way to check for
+    # the existence of that file to tell how to compile U-Boot:-/
+    new_build_commands_file = os.path.join(uboot_dir, "scripts/multiconfig.py")
+    if os.path.exists(new_build_commands_file):
+        config_target_suffix = '_defconfig'
+    else:
+        config_target_suffix = '_config'
+    run(uboot_dir, 'make O=' + build_uboot_dir + ' ' + boardname + config_target_suffix)
     run(uboot_dir, 'make O=' + build_uboot_dir + ' -s ' + makejobs)
 
     import_uboot_one_board(boardname, build_uboot_dir)
-- 
1.9.1
