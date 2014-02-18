From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH] Enable Venice2 board by default
Date: Tue, 18 Feb 2014 15:20:36 -0700
Message-ID: <1392762036-13147-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Now that mainline U-Boot contains support for Venice2, enable building
for Venice2 by default.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note that the support has been pulled into u-boot/master, but isn't yet
available on the git server due to replication latency:-( I won't
actually apply this until the commits show up.
---
 configs/venice2.board | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/venice2.board b/configs/venice2.board
index 1dfb14c5ec9e..73b23ae86dd2 100644
--- a/configs/venice2.board
+++ b/configs/venice2.board
@@ -1,5 +1,4 @@
 board = {
     'vendor': 'nvidia',
     'soc': 'tegra124',
-    'disabled': True,
 }
-- 
1.8.1.5
