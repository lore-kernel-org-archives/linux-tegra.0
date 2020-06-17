From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v2 17/18] arm64: tegra: jetson-tx1: Add camera supplies
Date: Tue, 16 Jun 2020 18:41:33 -0700
Message-ID: <1592358094-23459-18-git-send-email-skomatineni@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Jetson TX1 development board has a camera expansion connector which
has 2V8, 1V8 and 1V2 supplies to power up the camera sensor on the
supported camera modules.

Camera module designed as per Jetson TX1 camera expansion connector
may use these supplies for camera sensor avdd 2V8, digital core 1V8,
and digital interface 1V2 voltages.

These supplies are from fixed regulators on TX1 carrier board with
enable control signals from I2C GPIO expanders.

This patch adds these camera supplies to Jetson TX1 device tree to
allow using these when a camera module is used.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index b57d837..5e24d7a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1323,6 +1323,14 @@
 			#gpio-cells = <2>;
 			gpio-controller;
 		};
+
+		exp2: gpio@77 {
+			compatible = "ti,tca9539";
+			reg = <0x77>;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
 	};
 
 	/* HDMI DDC */
@@ -1667,6 +1675,39 @@
 			enable-active-high;
 			vin-supply = <&vdd_5v0_sys>;
 		};
+
+		vdd_cam_1v2: regulator@12 {
+			compatible = "regulator-fixed";
+			reg = <12>;
+			regulator-name = "vdd-cam-1v2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			gpio = <&exp2 10 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_3v3_sys>;
+		};
+
+		vdd_cam_2v8: regulator@13 {
+			compatible = "regulator-fixed";
+			reg = <13>;
+			regulator-name = "vdd-cam-2v8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&exp1 13 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_3v3_sys>;
+		};
+
+		vdd_cam_1v8: regulator@14 {
+			compatible = "regulator-fixed";
+			reg = <14>;
+			regulator-name = "vdd-cam-1v8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			gpio = <&exp2 9 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_3v3_sys>;
+		};
 	};
 
 	gpio-keys {
-- 
2.7.4
