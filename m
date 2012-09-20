From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: harmony: fix ldo7 regulator-name
Date: Thu, 20 Sep 2012 15:20:39 -0600
Message-ID: <1348176039-6094-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On Harmony, LDO7 does not feed vdd_fuse. Correct the regulator name.
This issue was probably the result of copying Ventana's regulator setup
when creating the Harmony .dts file. No other naming issues appear to
exist.

Reported-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Arnd, Olof, any chance you could roll this into arm-soc directly rather than
my sending another pull request? Or, I can re-do my today's dt2 pull request
with this added if it makes it easier. Thanks.

I don't expect any more patches to show up for Tegra for 3.7, unless they're
bug-fixes for issues I haven't noticed yet.

 arch/arm/boot/dts/tegra20-harmony.dts |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index b98a1b3..c3ef1ad 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -397,7 +397,7 @@
 				regulator@11 {
 					reg = <11>;
 					regulator-compatible = "ldo7";
-					regulator-name = "vdd_ldo7,avdd_hdmi,vdd_fuse";
+					regulator-name = "vdd_ldo7,avdd_hdmi";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 				};
-- 
1.7.0.4
