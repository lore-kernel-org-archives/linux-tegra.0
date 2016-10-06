From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH tegra-uboot-scripts] Use full U-Boot command names in all cases
Date: Thu,  6 Oct 2016 11:18:44 -0600
Message-ID: <20161006171844.23031-1-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The generated U-Boot script currently invokes "set" as a U-Boot command.
This is intended to be an abbreviation for "setenv". This works fine when
there are no other commands named "set*", but fails when there are. Use
the full command name to avoid issues.

Reported-by: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note that I haven't tested this; if you could that'd be great.

 gen-uboot-script.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gen-uboot-script.py b/gen-uboot-script.py
index e11dbf15553c..6db377d96c07 100755
--- a/gen-uboot-script.py
+++ b/gen-uboot-script.py
@@ -132,13 +132,13 @@ else:
 
 f.write('''\
 if test -n "${fdtfile}"; then
-    set _fdt ${fdtfile};
+    setenv _fdt ${fdtfile};
 else
-    set _fdt ${soc}-${board}${boardver}.dtb;
+    setenv _fdt ${soc}-${board}${boardver}.dtb;
 fi
 ''')
 f.write(load + ' ${fdt_addr_r} ' + args.dtbdir + '${_fdt}\n')
-f.write('set _fdt\n')
+f.write('setenv _fdt\n')
 
 bootargs = ''
 if not args.no_con_ttyS0:
-- 
2.10.1
