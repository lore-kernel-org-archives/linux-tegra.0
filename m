From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH] Enable Jetson TK1 board by default
Date: Wed, 14 May 2014 09:48:11 -0600
Message-ID: <1400082491-9398-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Now that mainline U-Boot contains support for Jetson TK1, enable building
for it by default.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configs/jetson-tk1.board | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/jetson-tk1.board b/configs/jetson-tk1.board
index 1dfb14c5ec9e..73b23ae86dd2 100644
--- a/configs/jetson-tk1.board
+++ b/configs/jetson-tk1.board
@@ -1,5 +1,4 @@
 board = {
     'vendor': 'nvidia',
     'soc': 'tegra124',
-    'disabled': True,
 }
-- 
1.8.1.5
