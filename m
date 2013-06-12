From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [[PATCH flasher] 3/6] Split list-confignames implementation into a separate function
Date: Wed, 12 Jun 2013 17:30:04 -0600
Message-ID: <1371079807-16541-3-git-send-email-swarren@wwwdotorg.org>
References: <1371079807-16541-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371079807-16541-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This moves towards each sub-command being a separate function

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index ef73e2f..390ae0e 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -86,6 +86,10 @@ def find_config_dir():
     socname = boards[boardname]['soc']
     out_board_dir = os.path.join(args.data_dir, boardname)
 
+def func_list_configs():
+    for configname in sorted(configs.keys()):
+        print configname
+
 parser = argparse.ArgumentParser(description='Write an image to a Tegra board\'s flash')
 parser.add_argument('--debug', action='store_true',
                    help='Turn on debugging prints')
@@ -129,8 +133,7 @@ if not args.data_dir:
 load_configs(os.path.join(args.data_dir, 'configs'))
 
 if args.list_confignames:
-    for configname in sorted(configs.keys()):
-        print configname
+    func_list_configs()
     sys.exit(0)
 
 find_config_dir()
-- 
1.8.1.5
