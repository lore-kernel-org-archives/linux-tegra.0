From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher scripts PATCH] Remove Whistler support
Date: Thu, 13 Apr 2017 12:58:19 -0600
Message-ID: <20170413185819.2094-1-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Whistler is an ancient Tegra 2 reference board. I may have been the only
person who ever used it with upstream software, and I've just recycled
the board hardware. Hence, it makes sense to remove support from software.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configs/whistler.board  | 4 ----
 configs/whistler.config | 8 --------
 2 files changed, 12 deletions(-)
 delete mode 100644 configs/whistler.board
 delete mode 100644 configs/whistler.config

diff --git a/configs/whistler.board b/configs/whistler.board
deleted file mode 100644
index 7dd4fd8b73cf..000000000000
--- a/configs/whistler.board
+++ /dev/null
@@ -1,4 +0,0 @@
-board = {
-    'vendor': 'nvidia',
-    'soc': 'tegra20',
-}
diff --git a/configs/whistler.config b/configs/whistler.config
deleted file mode 100644
index e93cd359969e..000000000000
--- a/configs/whistler.config
+++ /dev/null
@@ -1,8 +0,0 @@
-config = {
-    'bct': 'E1108_Elpida_512MB_EDB4032B2PB-6D-F_300MHz_40nm_emmc_x8.bct',
-    'board': 'whistler',
-    'dtbfn-extra': '',
-    'flash-id-uboot': 0,
-    'flash-image': 'whistler-emmc.img',
-    'flash-type': 'emmc',
-}
-- 
2.11.0
