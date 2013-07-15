From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: fix DT node ordering in Tegra30 Cardhu
Date: Mon, 15 Jul 2013 10:51:43 -0600
Message-ID: <1373907103-28418-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Nodes should be sorted by reg. Fix location of the tps62361 node.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I will immediately apply this to Tegra's for-3.12/dt branch.

 arch/arm/boot/dts/tegra30-cardhu.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index e5759ca..c011b67 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -173,19 +173,6 @@
 			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
 		};
 
-		tps62361 {
-			compatible = "ti,tps62361";
-			reg = <0x60>;
-
-			regulator-name = "tps62361-vout";
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1500000>;
-			regulator-boot-on;
-			regulator-always-on;
-			ti,vsel0-state-high;
-			ti,vsel1-state-high;
-		};
-
 		pmic: tps65911@2d {
 			compatible = "ti,tps65911";
 			reg = <0x2d>;
@@ -293,6 +280,19 @@
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		tps62361 {
+			compatible = "ti,tps62361";
+			reg = <0x60>;
+
+			regulator-name = "tps62361-vout";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1500000>;
+			regulator-boot-on;
+			regulator-always-on;
+			ti,vsel0-state-high;
+			ti,vsel1-state-high;
+		};
 	};
 
 	spi@7000da00 {
-- 
1.8.1.5
