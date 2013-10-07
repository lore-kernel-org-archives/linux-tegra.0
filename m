From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: add DT entry for nct1008 to Dalmore
Date: Mon, 7 Oct 2013 17:28:28 +0800
Message-ID: <1381138109-22727-2-git-send-email-wni@nvidia.com>
References: <1381138109-22727-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381138109-22727-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable thermal sensor nct1008 for Tegra114 dalmore.

Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 871aff5..cb5ec23 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -739,6 +739,14 @@
 			realtek,ldo1-en-gpios =
 				<&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
 		};
+
+		temperature-sensor@4c {
+			compatible = "onnn,nct1008";
+			reg = <0x4c>;
+			vcc-supply = <&palmas_ldo6_reg>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_LOW>;
+		};
 	};
 
 	i2c@7000d000 {
@@ -948,7 +956,7 @@
 						regulator-max-microvolt = <1800000>;
 					};
 
-					ldo6 {
+					palmas_ldo6_reg: ldo6 {
 						regulator-name = "vdd-sensor-2v85";
 						regulator-min-microvolt = <2850000>;
 						regulator-max-microvolt = <2850000>;
-- 
1.7.9.5
