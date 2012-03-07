From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 4/9] tegra: fdt: i2c: Add extra I2C bindings for U-Boot
Date: Tue,  6 Mar 2012 21:00:22 -0800
Message-ID: <1331096428-6317-5-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add U-Boot's peripheral clock information to the Tegra20 device tree file.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Adjust definitions to fit new peripheral clock bindings
- Change 'speed' to 'clock-frequency'
- Remove u-boot,pinmux binding (sadly)

Changes in v3:
- Move speed setting from tegra20.dtsi to board .dts file

Changes in v4:
- Update to use new tegra2 clock and reset binding

Changes in v5:
- Add clock binding file which lists our additions to the Linux binding
- Add pll_p_out3 to clock binding definition

 arch/arm/dts/tegra20.dtsi                    |   10 +++++++++-
 doc/device-tree-bindings/i2c/tegra20-i2c.txt |   23 +++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 doc/device-tree-bindings/i2c/tegra20-i2c.txt

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index d6bc9f1..d5ca02c 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -34,6 +34,8 @@
 		compatible = "nvidia,tegra20-i2c";
 		reg = <0x7000C000 0x100>;
 		interrupts = < 70 >;
+		/* PERIPH_ID_I2C1, PLL_P_OUT3 */
+		clocks = <&tegra_car 12>, <&tegra_car 124>;
 	};
 
 	i2c@7000c400 {
@@ -42,6 +44,8 @@
 		compatible = "nvidia,tegra20-i2c";
 		reg = <0x7000C400 0x100>;
 		interrupts = < 116 >;
+		/* PERIPH_ID_I2C2, PLL_P_OUT3 */
+		clocks = <&tegra_car 54>, <&tegra_car 124>;
 	};
 
 	i2c@7000c500 {
@@ -50,14 +54,18 @@
 		compatible = "nvidia,tegra20-i2c";
 		reg = <0x7000C500 0x100>;
 		interrupts = < 124 >;
+		/* PERIPH_ID_I2C3, PLL_P_OUT3 */
+		clocks = <&tegra_car 67>, <&tegra_car 124>;
 	};
 
 	i2c@7000d000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "nvidia,tegra20-i2c";
+		compatible = "nvidia,tegra20-i2c-dvc";
 		reg = <0x7000D000 0x200>;
 		interrupts = < 85 >;
+		/* PERIPH_ID_DVC_I2C, PLL_P_OUT3 */
+		clocks = <&tegra_car 47>, <&tegra_car 124>;
 	};
 
 	i2s@70002800 {
diff --git a/doc/device-tree-bindings/i2c/tegra20-i2c.txt b/doc/device-tree-bindings/i2c/tegra20-i2c.txt
new file mode 100644
index 0000000..d601c17
--- /dev/null
+++ b/doc/device-tree-bindings/i2c/tegra20-i2c.txt
@@ -0,0 +1,23 @@
+(Placeholder note while we locate the kernel Tegra20 bindings)
+
+Added in U-Boot:
+
+Required properties:
+ - clocks : Two clocks must be given, each as a phandle to the Tegra's
+            CAR node and the clock number as a parameter:
+     - the I2C clock to use for the peripheral
+     - the pll_p_out3 clock, which can be used for fast operation. This
+          does not change and is the same for all I2C nodes.
+
+Example:
+(TODO: merge with existing example):
+
+	i2c@7000c400 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra20-i2c";
+		reg = <0x7000C400 0x100>;
+		interrupts = < 116 >;
+		/* PERIPH_ID_I2C2, PLL_P_OUT3 */
+		clocks = <&tegra_car 54>, <&tegra_car 124>;
+	};
-- 
1.7.7.3
