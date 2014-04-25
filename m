From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/7] ARM: tegra: beaver - Add +5V HDMI supply
Date: Fri, 25 Apr 2014 17:44:49 +0200
Message-ID: <1398440691-23366-6-git-send-email-thierry.reding@gmail.com>
References: <1398440691-23366-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398440691-23366-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This supply controls the +5V pin on the HDMI connector, which in turn is
used by attached sinks to return the hotplug detect signal.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-beaver.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index e7a9da968f3b..7365e866540b 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -40,6 +40,7 @@
 		hdmi@54280000 {
 			status = "okay";
 
+			hdmi-supply = <&vdd_5v0_hdmi>;
 			vdd-supply = <&sys_3v3_reg>;
 			pll-supply = <&vio_reg>;
 
@@ -478,6 +479,17 @@
 			gpio = <&gpio TEGRA_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
 			vin-supply = <&sys_3v3_reg>;
 		};
+
+		vdd_5v0_hdmi: regulator@8 {
+			compatible = "regulator-fixed";
+			reg = <8>;
+			regulator-name = "+VDD_5V_HDMI";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+			vin-supply = <&sys_3v3_reg>;
+		};
 	};
 
 	sound {
-- 
1.9.2
