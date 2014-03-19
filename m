From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: fix Dalmore pinctrl configuration
Date: Wed, 19 Mar 2014 10:36:35 -0600
Message-ID: <1395246995-13972-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Remove some entries from Dalmore's device tree that attempt to set some
options which aren't supported for the drive_gma pin group.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This should be applied on top of wherever Tegra's for-3.15/dt branch
was merged into arm-soc.

 arch/arm/boot/dts/tegra114-dalmore.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 8de543777882..5eb11a3bba55 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -740,12 +740,10 @@
 				nvidia,pins = "drive_gma";
 				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
 				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
 				nvidia,pull-down-strength = <2>;
 				nvidia,pull-up-strength = <1>;
 				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
 				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
-				nvidia,drive-type = <1>;
 			};
 		};
 	};
-- 
1.8.1.5
