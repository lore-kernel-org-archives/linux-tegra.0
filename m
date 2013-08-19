From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: configure power off for Dalmore
Date: Mon, 19 Aug 2013 10:44:10 -0600
Message-ID: <1376930650-6078-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add DT property to tell the regulator to register pm_power_off to make
"shutdown" work.

Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
arm-soc folk,

This patch showed up a little late to include in the Tegra pull requests,
but it's simple and useful enough I'd like to see it included in v3.12 if
possible. Could you possibly apply it to whichever branch you have/will
apply Tegra's tegra-for-3.12-dt pull request to, after the pull request
is applied? Thanks.

 arch/arm/boot/dts/tegra114-dalmore.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 45056a2..6023028 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -845,6 +845,8 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 
+			ti,system-power-controller;
+
 			palmas_gpio: gpio {
 				compatible = "ti,palmas-gpio";
 				gpio-controller;
-- 
1.8.1.5
