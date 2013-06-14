From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH flasher 4/4] flasher: fix assignment of default data_dir
Date: Fri, 14 Jun 2013 13:52:24 -0600
Message-ID: <1371239544-26165-4-git-send-email-swarren@wwwdotorg.org>
References: <1371239544-26165-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371239544-26165-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The default value was being assigned to a global rather than a field in
the argparser result.

Reported-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index ac727a0..f1abe54 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -294,7 +294,7 @@ if not args.data_dir and not args.force_no_out_dir:
         if args.debug: print 'Detected build tree; using ' + out_data_dir + ' as data dir'
         args.data_dir = out_data_dir
 if not args.data_dir:
-    data_dir = '/usr/share/tegra_uboot_flasher'
+    args.data_dir = '/usr/share/tegra_uboot_flasher'
 
 load_configs(os.path.join(args.data_dir, 'configs'))
 
-- 
1.8.1.5
