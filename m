From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/7] ARM: tegra: dalmore - Add +5V HDMI supply
Date: Fri, 25 Apr 2014 17:44:50 +0200
Message-ID: <1398440691-23366-7-git-send-email-thierry.reding@gmail.com>
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
Note: Unfortunately I do have an A05 Dalmore, and from what I can tell
HDMI is actually one of the areas where there have been changes between
A04 and A05. It'd be great if somebody could check that this actually
works. Also note that it requires Tegra DRM patches that are currently
in linux-next to enable the +5V regulator.

 arch/arm/boot/dts/tegra114-dalmore.dts | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index df22dfad7db7..1309c75c821c 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -25,6 +25,7 @@
 		hdmi@54280000 {
 			status = "okay";
 
+			hdmi-supply = <&vdd_5v0_hdmi>;
 			vdd-supply = <&vdd_hdmi_reg>;
 			pll-supply = <&palmas_smps3_reg>;
 
@@ -1231,8 +1232,6 @@
 			regulator-name = "vdd_hdmi_5v0";
 			regulator-min-microvolt = <5000000>;
 			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
 			vin-supply = <&tps65090_dcdc1_reg>;
 		};
 
@@ -1245,6 +1244,17 @@
 			enable-active-high;
 			gpio = <&palmas_gpio 6 0>;
 		};
+
+		vdd_5v0_hdmi: regulator@7 {
+			compatible = "regulator-fixed";
+			reg = <7>;
+			regulator-name = "VDD_5V0_HDMI_CON";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&tps65090_dcdc1_reg>;
+		};
 	};
 
 	sound {
-- 
1.9.2
