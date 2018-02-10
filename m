From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 5/6] ARM: dts: tegra: apalis-tk1: copyright period,
 spurious newlines
Date: Sat, 10 Feb 2018 02:38:05 +0100
Message-ID: <20180210013806.28496-6-marcel@ziswiler.com>
References: <20180210013806.28496-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180210013806.28496-1-marcel@ziswiler.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Update the copyright period and get rid of some spurious newlines.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra124-apalis-eval.dts |  6 ++----
 arch/arm/boot/dts/tegra124-apalis.dtsi     | 11 +----------
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index f1010cefb993..a6ad759dddb4 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -1,5 +1,5 @@
 /*
- * Copyright 2016 Toradex AG
+ * Copyright 2016-2018 Toradex AG
  *
  * This file is dual-licensed: you can use it either under the terms
  * of the GPL or the X11 license, at your option. Note that this dual
@@ -225,9 +225,7 @@
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-
-		/* BKL1_PWM */
-		pwms = <&pwm 3 5000000>;
+		pwms = <&pwm 3 5000000>; /* BKL1_PWM */
 		brightness-levels = <255 231 223 207 191 159 127 0>;
 		default-brightness-level = <6>;
 		/* BKL1_ON */
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index b7648ce4565d..65a2161b9b8e 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1,5 +1,5 @@
 /*
- * Copyright 2016 Toradex AG
+ * Copyright 2016-2018 Toradex AG
  *
  * This file is dual-licensed: you can use it either under the terms
  * of the GPL or the X11 license, at your option. Note that this dual
@@ -56,7 +56,6 @@
 
 	pcie@1003000 {
 		status = "okay";
-
 		avddio-pex-supply = <&vdd_1v05>;
 		avdd-pex-pll-supply = <&vdd_1v05>;
 		avdd-pll-erefe-supply = <&avdd_1v05>;
@@ -85,7 +84,6 @@
 		hdmi@54280000 {
 			pll-supply = <&reg_1v05_avdd_hdmi_pll>;
 			vdd-supply = <&reg_3v3_avdd_hdmi>;
-
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpio =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
@@ -1600,15 +1598,11 @@
 			compatible = "ams,as3722";
 			reg = <0x40>;
 			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
-
 			ams,system-power-controller;
-
 			#interrupt-cells = <2>;
 			interrupt-controller;
-
 			gpio-controller;
 			#gpio-cells = <2>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&as3722_default>;
 
@@ -1783,7 +1777,6 @@
 			reg = <0x4c>;
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
-
 			#thermal-sensor-cells = <1>;
 		};
 	};
@@ -1816,7 +1809,6 @@
 	sata@70020000 {
 		phys = <&{/padctl@7009f000/pads/sata/lanes/sata-0}>;
 		phy-names = "sata-0";
-
 		avdd-supply = <&vdd_1v05>;
 		hvdd-supply = <&reg_3v3>;
 		vddio-supply = <&vdd_1v05>;
@@ -1830,7 +1822,6 @@
 		       <&{/padctl@7009f000/pads/usb2/lanes/usb2-2}>,
 		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-0}>;
 		phy-names = "usb2-0", "usb3-1", "usb2-1", "usb2-2", "usb3-0";
-
 		avddio-pex-supply = <&vdd_1v05>;
 		avdd-pll-erefe-supply = <&avdd_1v05>;
 		avdd-pll-utmip-supply = <&vddio_1v8>;
-- 
2.14.3
