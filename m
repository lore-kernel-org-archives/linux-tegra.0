From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH boot script generator] Run tftpboot not tftp for network downloads
Date: Wed, 25 Jun 2014 11:33:10 -0600
Message-ID: <1403717590-4686-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

"tftp" only works because it's an abbreviation of "tftpboot", and is
unique within the typical set of enabled commands on Tegra devices. Fix
the script to use the full command name "tftpboot" so that it works
even when other TFTP-related commands (such as tftpput) are enabled.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I'll apply this immediately.

 gen-uboot-script.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gen-uboot-script.py b/gen-uboot-script.py
index 46847e50834a..a60aed0d598f 100755
--- a/gen-uboot-script.py
+++ b/gen-uboot-script.py
@@ -103,7 +103,7 @@ else:
 
 if args.type == 'net':
     f.write('dhcp\n')
-    load='tftp'
+    load='tftpboot'
     prefix=''
 else:
     load='load ${devtype} ${devnum}:${rootpart}'
-- 
1.8.1.5
