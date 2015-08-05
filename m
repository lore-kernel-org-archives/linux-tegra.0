From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH] Fix comment re: meaning of 0x00108000 constant
Date: Wed,  5 Aug 2015 14:12:38 -0600
Message-ID: <1438805558-461-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is the SPL base (which is essentially constant), not the base of
the main CCPLEX binary (which varies according to the size needs of the
SPL image).

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index d80aa0d48673..4809665d4a6a 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -87,7 +87,7 @@ gen_flashcmds = {
 }
 
 def get_loadaddr():
-    # 0x00108000 is CONFIG_SYS_TEXT_BASE in U-Boot, minus RAM base
+    # 0x00108000 is CONFIG_SPL_TEXT_BASE in U-Boot, minus RAM base
     return soc['ram-base'] + 0x00108000
 
 def gen_tegrarcm_cmd(bootloader, loadaddr):
-- 
1.9.1
