From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [[PATCH flasher] 2/6] Separate out validation of config name
Date: Wed, 12 Jun 2013 17:30:03 -0600
Message-ID: <1371079807-16541-2-git-send-email-swarren@wwwdotorg.org>
References: <1371079807-16541-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371079807-16541-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This function will be used by multiple sub-commands in the future.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index 447ff37..ef73e2f 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -75,6 +75,17 @@ gen_flashcmds = {
     'spi': gen_flashcmd_spi,
 }
 
+def find_config_dir():
+    if not configs.has_key(args.configname):
+        print 'Unknown config "%s"' % args.configname
+        sys.exit(1)
+
+    global boardname, socname, out_board_dir
+
+    boardname = configs[args.configname]['board']
+    socname = boards[boardname]['soc']
+    out_board_dir = os.path.join(args.data_dir, boardname)
+
 parser = argparse.ArgumentParser(description='Write an image to a Tegra board\'s flash')
 parser.add_argument('--debug', action='store_true',
                    help='Turn on debugging prints')
@@ -122,14 +133,7 @@ if args.list_confignames:
         print configname
     sys.exit(0)
 
-if not configs.has_key(args.configname):
-    print 'Unknown config "%s"' % args.configname
-    sys.exit(1)
-
-boardname = configs[args.configname]['board']
-socname = boards[boardname]['soc']
-
-out_board_dir = os.path.join(args.data_dir, boardname)
+find_config_dir()
 
 u_boot_no_dtb = os.path.join(out_board_dir, 'u-boot-nodtb-tegra.bin')
 u_boot_no_dtb_size = os.path.getsize(u_boot_no_dtb)
-- 
1.8.1.5
