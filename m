From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: fix RTC0 alias for Cardhu
Date: Thu, 13 Feb 2014 17:18:26 -0700
Message-ID: <1392337106-20584-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This alias entry was evidently cut/paste from a different board, and
not correctly updated to match Cardhu. Fix this.

Fixes: 553c0a200e20 ("ARM: tegra: set up /aliases entries for RTCs")
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This is a fix for v3.14-rc*

 arch/arm/boot/dts/tegra30-cardhu.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 004002c8c8a5..0cf0848a82d8 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -28,7 +28,7 @@
 	compatible = "nvidia,cardhu", "nvidia,tegra30";
 
 	aliases {
-		rtc0 = "/i2c@7000d000/tps6586x@34";
+		rtc0 = "/i2c@7000d000/tps65911@2d";
 		rtc1 = "/rtc@7000e000";
 	};
 
-- 
1.8.1.5
