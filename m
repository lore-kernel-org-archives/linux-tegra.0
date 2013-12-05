From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 2/4] Increase padding between U-Boot binary and flash image
Date: Thu,  5 Dec 2013 15:13:00 -0700
Message-ID: <1386281582-18561-2-git-send-email-swarren@wwwdotorg.org>
References: <1386281582-18561-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386281582-18561-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The flasher currently places the flash image in RAM almost directly above
the initial U-Boot binary location, with just a little padding/alignment
in between. This is also where U-Boot's BSS is located, prior to U-Boot
relocating itself to the top of RAM. Hence, if U-Boot touches its BSS, it
will corrupt the flash image. Increase the padding between U-Boot/DT and
the flash image to avoid this. U-Boot's BSS is roughly 300K at present.
Make the pad size 1M to allow plenty of room for growth.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index d97b9e43aa45..06e297730112 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -143,9 +143,9 @@ def func_flash():
     if args.debug:
         print 'u_boot_plus_dtb_size %d 0x%x' % (u_boot_plus_dtb_size, u_boot_plus_dtb_size)
 
-    # Add 32k in case size changes due to fdtput
+    # Add 1024k to avoid U-Boot's BSS, and in case the DT size changes due to fdtput
     # Align to 4k, so flash writes don't need a bounce buffer for DMA
-    padded_size = (u_boot_plus_dtb_size + (32 * 1024) + (4 * 1024) - 1) & ~((4 * 1024) - 1)
+    padded_size = (u_boot_plus_dtb_size + (1024 * 1024) + (4 * 1024) - 1) & ~((4 * 1024) - 1)
     if args.debug:
         print 'padded_size %d 0x%x' % (padded_size, padded_size)
 
-- 
1.8.1.5
