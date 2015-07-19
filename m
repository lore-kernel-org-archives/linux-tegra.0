From: Steev Klimaszewski <threeway-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Fix nyan-big panel binding
Date: Sun, 19 Jul 2015 15:15:13 -0500
Message-ID: <1437336913-12886-1-git-send-email-steev@gentoo.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steev Klimaszewski <steev-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The nyan-big Chromebook uses a 1920x1080 panel, not a 1366x768 panel so correct
the binding.

Signed-off-by: Steev Klimaszewski <steev-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-nyan-big.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index 2d21253..30d4495 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -9,7 +9,7 @@
 	compatible = "google,nyan-big", "nvidia,tegra124";
 
 	panel: panel {
-		compatible = "auo,b133xtn01";
+		compatible = "auo,b133htn01";
 
 		backlight = <&backlight>;
 		ddc-i2c-bus = <&dpaux>;
-- 
2.4.6
