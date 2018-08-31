From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 31/34] ARM: tegra: apalis_t30: rename tps65911@2d, stmpe811@41 and tps62362@60
Date: Fri, 31 Aug 2018 18:38:13 +0200
Message-ID: <20180831163817.23970-32-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Rename a few nodes using more common names:
- rename tps65911@2d to pmic@2d
- rename stmpe811@41 to touchscreen@41
- rename tps62362@60 to regulator@60

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch as suggested by Rob.

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 2 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 9381f65a9bf5..fdfadda72e0d 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -11,7 +11,7 @@
 
 	aliases {
 		rtc0 = "/i2c@7000c000/rtc@68";
-		rtc1 = "/i2c@7000d000/tps65911@2d";
+		rtc1 = "/i2c@7000d000/pmic@2d";
 		rtc2 = "/rtc@7000e000";
 		serial0 = &uarta;
 		serial1 = &uartb;
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index f15954995231..a31b112f631d 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -853,7 +853,7 @@
 			clocks = <&tegra_car TEGRA30_CLK_EXTERN1>;
 		};
 
-		pmic: tps65911@2d {
+		pmic: pmic@2d {
 			compatible = "ti,tps65911";
 			reg = <0x2d>;
 
@@ -969,7 +969,7 @@
 		};
 
 		/* STMPE811 touch screen controller */
-		stmpe811@41 {
+		touchscreen@41 {
 			compatible = "st,stmpe811";
 			reg = <0x41>;
 			irq-gpio = <&gpio TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
@@ -1014,7 +1014,7 @@
 		};
 
 		/* SW: +V1.2_VDD_CORE */
-		tps62362@60 {
+		regulator@60 {
 			compatible = "ti,tps62362";
 			reg = <0x60>;
 
-- 
2.14.4
