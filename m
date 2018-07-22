From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 12/28] ARM: tegra: apalis_t30: white-space clean-up
Date: Sun, 22 Jul 2018 18:49:20 +0200
Message-ID: <20180722164936.20581-13-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

White-space clean-up.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index ba178632d82c..74d588561d9f 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -118,6 +118,7 @@
 	spi@7000d400 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
+
 		spidev0: spidev@1 {
 			compatible = "spidev";
 			reg = <1>;
@@ -129,6 +130,7 @@
 	spi@7000dc00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
+
 		spidev1: spidev@2 {
 			compatible = "spidev";
 			reg = <2>;
@@ -189,7 +191,6 @@
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-
 		/* PWM_BKL1 */
 		pwms = <&pwm 0 5000000>;
 		brightness-levels = <255 231 223 207 191 159 127 0>;
@@ -217,7 +218,6 @@
 		 * edt,et070080dh6: EDT 7.0" LCD TFT
 		 */
 		compatible = "edt,et057090dhu", "simple-panel";
-
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 	};
-- 
2.14.4
