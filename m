From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [u-boot scripts PATCH] Use $fdtfile as the DT filename, if it's set
Date: Mon, 27 Jan 2014 14:26:29 -0700
Message-ID: <1390857989-25656-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This makes the generated boot.scr use the same mechanism to determine
the DT filename as U-Boot's pxe or sysboot commands, which parse an
extlinux.conf file.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 gen-uboot-script.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/gen-uboot-script.py b/gen-uboot-script.py
index 7c55b2594e07..46847e50834a 100755
--- a/gen-uboot-script.py
+++ b/gen-uboot-script.py
@@ -119,7 +119,15 @@ if args.initrd:
 else:
     ramdisk = '-'
 
-f.write(load + ' ${fdt_addr_r} ${prefix}${soc}-${board}${boardver}.dtb\n')
+f.write('''\
+if test -n "${fdtfile}"; then
+    set _fdt ${fdtfile};
+else
+    set _fdt ${soc}-${board}${boardver}.dtb;
+fi
+''')
+f.write(load + ' ${fdt_addr_r} ' + prefix + '${_fdt}\n')
+f.write('set _fdt\n')
 
 bootargs = ''
 if not args.no_con_ttyS0:
-- 
1.8.1.5
