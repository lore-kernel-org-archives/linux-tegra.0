From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: keep power on to SD slot on Dalmore
Date: Thu, 28 Mar 2013 13:22:30 -0600
Message-ID: <1364498550-15972-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Set "regulator-always-on" for the SD slot on Dalmore, so that SD cards
work. This used to work, since this regulator is on by default, but was
broken by commit "ARM: tegra: dalmore: add TPS65090 node", since that
didn't specify always-on for this regulator.

In the long run, the regulators should all be hooked up to the SDHCI
device nodes. However, we haven't done that for any of the Tegra boards
yet, so to be consistent, this patch simply forces the regulator on,
rather than hooking it up and making it work differently to other boards.

Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reported-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 2ef9f0e..0d8ceda 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -807,6 +807,7 @@
 
 				fet6 {
 					regulator-name = "vdd-sd-slot";
+					regulator-always-on;
 					regulator-boot-on;
 				};
 
-- 
1.7.10.4
