From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 11/34] ARM: tegra: apalis_t30: white-space/newline clean-up
Date: Fri, 31 Aug 2018 18:37:53 +0200
Message-ID: <20180831163817.23970-12-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

White-space and newline clean-up.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Also add two missing newlines.

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 5 +++--
 arch/arm/boot/dts/tegra30-apalis.dtsi     | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 3f15f327f293..0a8900be0008 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -39,6 +39,7 @@
 				nvidia,panel = <&panel>;
 			};
 		};
+
 		hdmi@54280000 {
 			status = "okay";
 			hdmi-supply = <&reg_5v0>;
@@ -109,6 +110,7 @@
 	spi@7000d400 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
+
 		spidev0: spidev@1 {
 			compatible = "spidev";
 			reg = <1>;
@@ -120,6 +122,7 @@
 	spi@7000dc00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
+
 		spidev1: spidev@2 {
 			compatible = "spidev";
 			reg = <2>;
@@ -180,7 +183,6 @@
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-
 		/* PWM_BKL1 */
 		pwms = <&pwm 0 5000000>;
 		brightness-levels = <255 231 223 207 191 159 127 0>;
@@ -208,7 +210,6 @@
 		 * edt,et070080dh6: EDT 7.0" LCD TFT
 		 */
 		compatible = "edt,et057090dhu", "simple-panel";
-
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 	};
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 7e9d1b022982..e84feac9b992 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -39,6 +39,7 @@
 		pci@3,0 {
 			status = "okay";
 			nvidia,num-lanes = <1>;
+
 			pcie@0 {
 				reg = <0 0 0 0 0>;
 				local-mac-address = [00 00 00 00 00 00];
-- 
2.14.4
