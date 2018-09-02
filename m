From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 34/37] ARM: tegra: colibri_t20: rename tps6586x@34 and drop unused pmic label
Date: Sun,  2 Sep 2018 12:09:03 +0200
Message-ID: <20180902100906.25792-35-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Rename tps6586x@34 to pmic@34 and drop the unused pmic label.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch as suggested by Rob.

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 2 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 00fd2603d780..d8004d68efa0 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -11,7 +11,7 @@
 
 	aliases {
 		rtc0 = "/i2c@7000c000/rtc@68";
-		rtc1 = "/i2c@7000d000/tps6586x@34";
+		rtc1 = "/i2c@7000d000/pmic@34";
 		rtc2 = "/rtc@7000e000";
 		serial0 = &uarta;
 		serial1 = &uartd;
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 36463fb3c0b3..473f32f20d8d 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -472,7 +472,7 @@
 		status = "okay";
 		clock-frequency = <100000>;
 
-		pmic: tps6586x@34 {
+		pmic@34 {
 			compatible = "ti,tps6586x";
 			reg = <0x34>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.14.4
