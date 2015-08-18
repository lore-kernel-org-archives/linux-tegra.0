From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher scripts PATCH] Fix "typo" in comment re: padding calculations
Date: Tue, 18 Aug 2015 13:14:17 -0600
Message-ID: <1439925257-22522-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The binary format is U-Boot code + DTB + pad + flash image. U-Boot moves
the DTB out of the way of BSS. The pad is to prevent U-Boot trashing the
flash image, not the DTB. Fix the comment to reflect that.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index 4809665d4a6a..d20e3ad413ef 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -160,7 +160,7 @@ def func_flash():
     if args.debug:
         print 'bss_size %d 0x%x' % (bss_size, bss_size)
 
-    # Avoid U-Boot's BSS, so the BSS-zeroing doesn't trash the DTB
+    # Avoid U-Boot's BSS, so the BSS-zeroing doesn't trash the appended flash image
     # Add 4KB in case the DTB size changes due to fdtput
     # Align to 4k, so flash writes don't need a bounce buffer for DMA
     padded_size = (u_boot_plus_dtb_size + bss_size + (2 * 4 * 1024) - 1) & ~((4 * 1024) - 1)
-- 
1.9.1
