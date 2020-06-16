From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 70/73] arm64: tegra: Various fixes for PMICs
Date: Tue, 16 Jun 2020 15:52:35 +0200
Message-ID: <20200616135238.3001888-71-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Standardize on "pmic" as the node name for the PMIC on Tegra210 systems
and use consistent names for pinmux and GPIO hog nodes.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 31 +++++++++----------
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 14 ++++-----
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 1acb9bb6c7df..41beab626d95 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1328,7 +1328,7 @@ i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
-		max77620: max77620@3c {
+		pmic: pmic@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
@@ -1343,12 +1343,12 @@ max77620: max77620@3c {
 			pinctrl-0 = <&max77620_default>;
 
 			max77620_default: pinmux@0 {
-				pin_gpio0 {
+				gpio0 {
 					pins = "gpio0";
 					function = "gpio";
 				};
 
-				pin_gpio1 {
+				gpio1 {
 					pins = "gpio1";
 					function = "fps-out";
 					drive-push-pull = <1>;
@@ -1357,34 +1357,33 @@ pin_gpio1 {
 					maxim,active-fps-power-down-slot = <0>;
 				};
 
-				pin_gpio2_3 {
-					pins = "gpio2", "gpio3";
+				gpio2 {
+					pins = "gpio2";
 					function = "fps-out";
 					drive-open-drain = <1>;
 					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
 				};
 
-				pin_gpio4 {
+				gpio3 {
+					pins = "gpio3";
+					function = "fps-out";
+					drive-open-drain = <1>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
+				};
+
+				gpio4 {
 					pins = "gpio4";
 					function = "32k-out1";
 				};
 
-				pin_gpio5_6_7 {
+				gpio5_6_7 {
 					pins = "gpio5", "gpio6", "gpio7";
 					function = "gpio";
 					drive-push-pull = <1>;
 				};
-
-				pin_gpio2 {
-					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
-				};
-
-				pin_gpio3 {
-					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
-				};
 			};
 
-			spmic-default-output-high {
+			gpio@0 {
 				gpio-hog;
 				output-high;
 				gpios = <2 GPIO_ACTIVE_HIGH>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index f7840e5e069a..a946c5c31102 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1354,11 +1354,11 @@ max77621_cpu: max77621@1b {
 			maxim,enable-active-discharge;
 			maxim,enable-bias-control;
 			maxim,enable-etr;
-			maxim,enable-gpio = <&max77620 5 0>;
+			maxim,enable-gpio = <&pmic 5 0>;
 			maxim,externally-enable;
 		};
 
-		max77620: max77620@3c {
+		pmic: pmic@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
@@ -1372,8 +1372,8 @@ max77620: max77620@3c {
 			pinctrl-names = "default";
 			pinctrl-0 = <&max77620_default>;
 
-			max77620_default: pinmux@0 {
-				pin_gpio {
+			max77620_default: pinmux {
+				gpio0_1_2_7 {
 					pins = "gpio0", "gpio1", "gpio2", "gpio7";
 					function = "gpio";
 				};
@@ -1383,7 +1383,7 @@ pin_gpio {
 				 * sequence, So it must be sequenced up (automatically
 				 * set by OTP) and down properly.
 				 */
-				pin_gpio3 {
+				gpio3 {
 					pins = "gpio3";
 					function = "fps-out";
 					drive-open-drain = <1>;
@@ -1392,13 +1392,13 @@ pin_gpio3 {
 					maxim,active-fps-power-down-slot = <2>;
 				};
 
-				pin_gpio5_6 {
+				gpio5_6 {
 					pins = "gpio5", "gpio6";
 					function = "gpio";
 					drive-push-pull = <1>;
 				};
 
-				pin_32k {
+				gpio4 {
 					pins = "gpio4";
 					function = "32k-out1";
 				};
-- 
2.24.1
