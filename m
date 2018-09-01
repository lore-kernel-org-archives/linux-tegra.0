From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 06/34] ARM: tegra: colibri_t30: white-space clean-up
Date: Sat,  1 Sep 2018 10:12:20 +0200
Message-ID: <20180901081248.22639-7-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

White-space clean-up.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 682ea4ffce83..ff321964d225 100644
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
@@ -76,6 +77,7 @@
 	spi@7000d400 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
+
 		can0: can@0 {
 			compatible = "microchip,mcp2515";
 			reg = <0>;
@@ -84,6 +86,7 @@
 			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_EDGE_RISING>;
 			spi-max-frequency = <10000000>;
 		};
+
 		spidev0: spi@1 {
 			compatible = "spidev";
 			reg = <1>;
@@ -122,7 +125,6 @@
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-
 		/* PWM<A> */
 		pwms = <&pwm 0 5000000>;
 		brightness-levels = <255 128 64 32 16 8 4 0>;
@@ -160,7 +162,6 @@
 		 * edt,et070080dh6: EDT 7.0" LCD TFT
 		 */
 		compatible = "edt,et057090dhu", "simple-panel";
-
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 	};
-- 
2.14.4
