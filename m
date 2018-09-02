From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 16/37] ARM: tegra: colibri_t20: iris: display controller rgb panel support
Date: Sun,  2 Sep 2018 12:08:45 +0200
Message-ID: <20180902100906.25792-17-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add display controller parallel RGB panel support incl. backlight PWM.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 28386b89d910..21713b7ae978 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -21,6 +21,13 @@
 	};
 
 	host1x@50000000 {
+		dc@54200000 {
+			rgb {
+				status = "okay";
+				nvidia,panel = <&panel>;
+			};
+		};
+
 		hdmi@54280000 {
 			status = "okay";
 			hdmi-supply = <&reg_5v0>;
@@ -99,6 +106,10 @@
 		status = "okay";
 	};
 
+	pwm@7000a000 {
+		status = "okay";
+	};
+
 	/*
 	 * GEN1_I2C: I2C_SDA/SCL on SODIMM pin 194/196 (e.g. RTC on carrier
 	 * board)
@@ -149,6 +160,26 @@
 		no-1-8-v;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <255 128 64 32 16 8 4 0>;
+		default-brightness-level = <6>;
+		/* BL_ON */
+		enable-gpios = <&gpio TEGRA_GPIO(T, 4) GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3v3>;
+		pwms = <&pwm 0 5000000>; /* PWM<A> */
+	};
+
+	panel: panel {
+		/*
+		 * edt,et057090dhu: EDT 5.7" LCD TFT
+		 * edt,et070080dh6: EDT 7.0" LCD TFT
+		 */
+		compatible = "edt,et057090dhu", "simple-panel";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3>;
+	};
+
 	reg_3v3: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "3.3V";
-- 
2.14.4
