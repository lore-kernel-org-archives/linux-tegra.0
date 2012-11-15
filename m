From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: trimslice: enable HDMI port
Date: Thu, 15 Nov 2012 16:20:14 -0700
Message-ID: <1353021614-29200-2-git-send-email-swarren@wwwdotorg.org>
References: <1353021614-29200-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353021614-29200-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

Enable host1x, and the HDMI output. Harmony also has a DVI port with an
HDMI form-factor connector, driven by Tegra's LVDS output. This isn't
enabled yet, due to potential issues with having multiple outputs enabled.

Correct DDC I2C frequency to 100KHz.

Add dummy/fixed regulators to satisfy the HDMI driver.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
[swarren: add commit description, remove enable of DVI port]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-trimslice.dts |   44 ++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index f4e0428..b70b4cb 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -10,6 +10,18 @@
 		reg = <0x00000000 0x40000000>;
 	};
 
+	host1x {
+		hdmi {
+			status = "okay";
+
+			vdd-supply = <&hdmi_vdd_reg>;
+			pll-supply = <&hdmi_pll_reg>;
+
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
+		};
+	};
+
 	pinmux {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -249,9 +261,9 @@
 		clock-frequency = <216000000>;
 	};
 
-	i2c@7000c000 {
+	dvi_ddc: i2c@7000c000 {
 		status = "okay";
-		clock-frequency = <400000>;
+		clock-frequency = <100000>;
 	};
 
 	spi@7000c380 {
@@ -264,9 +276,9 @@
 		};
 	};
 
-	i2c@7000c400 {
+	hdmi_ddc: i2c@7000c400 {
 		status = "okay";
-		clock-frequency = <400000>;
+		clock-frequency = <100000>;
 	};
 
 	i2c@7000c500 {
@@ -310,6 +322,30 @@
 		bus-width = <4>;
 	};
 
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hdmi_vdd_reg: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "avdd_hdmi";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+
+		hdmi_pll_reg: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "avdd_hdmi_pll";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+	};
+
 	sound {
 		compatible = "nvidia,tegra-audio-trimslice";
 		nvidia,i2s-controller = <&tegra_i2s1>;
-- 
1.7.10.4
