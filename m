From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 4/9] tegra: fdt: i2c: Add extra I2C bindings for U-Boot
Date: Fri,  3 Feb 2012 17:13:55 -0800
Message-ID: <1328318041-10943-5-git-send-email-sjg@chromium.org>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328318041-10943-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

 arch/arm/dts/tegra20.dtsi |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index df1eda4..e7536f7 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -45,6 +45,7 @@
 		compatible = "nvidia,tegra20-i2c";
 		reg = <0x7000C000 0x100>;
 		interrupts = < 70 >;
+		clocks = <&periph_clk 12>;	/* PERIPH_ID_I2C1 */
 	};
 
 	i2c@7000c400 {
@@ -53,6 +54,7 @@
 		compatible = "nvidia,tegra20-i2c";
 		reg = <0x7000C400 0x100>;
 		interrupts = < 116 >;
+		clocks = <&periph_clk 54>;	/* PERIPH_ID_I2C2 */
 	};
 
 	i2c@7000c500 {
@@ -61,14 +63,16 @@
 		compatible = "nvidia,tegra20-i2c";
 		reg = <0x7000C500 0x100>;
 		interrupts = < 124 >;
+		clocks = <&periph_clk 67>;	/* PERIPH_ID_I2C3 */
 	};
 
 	i2c@7000d000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "nvidia,tegra20-i2c";
+		compatible = "nvidia,tegra20-i2c-dvc";
 		reg = <0x7000D000 0x200>;
 		interrupts = < 85 >;
+		clocks = <&periph_clk 47>;	/* PERIPH_ID_DVC_I2C */
 	};
 
 	i2s@70002800 {
-- 
1.7.7.3
