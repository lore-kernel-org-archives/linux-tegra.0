From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 07/26] ARM: tegra: colibri_t30: white-space clean-up
Date: Mon, 23 Jul 2018 14:36:38 +0200
Message-ID: <20180723123658.980-8-marcel@ziswiler.com>
References: <20180723123658.980-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723123658.980-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

White-space clean-up.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 5b32a70ceff2..19af6ccd57b2 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -27,6 +27,7 @@
 				nvidia,panel = <&panel>;
 			};
 		};
+
 		hdmi@54280000 {
 			status = "okay";
 			hdmi-supply = <&reg_5v0>;
@@ -78,6 +79,7 @@
 	spi@7000d400 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
+
 		can0: can@0 {
 			compatible = "microchip,mcp2515";
 			reg = <0>;
@@ -86,6 +88,7 @@
 			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_EDGE_RISING>;
 			spi-max-frequency = <10000000>;
 		};
+
 		spidev0: spi@1 {
 			compatible = "spidev";
 			reg = <1>;
@@ -124,7 +127,6 @@
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-
 		/* PWM<A> */
 		pwms = <&pwm 0 5000000>;
 		brightness-levels = <255 128 64 32 16 8 4 0>;
@@ -162,7 +164,6 @@
 		 * edt,et070080dh6: EDT 7.0" LCD TFT
 		 */
 		compatible = "edt,et057090dhu", "simple-panel";
-
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 	};
-- 
2.14.4
