From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v3 3/7] ARM: tegra: colibri_t20: reorder pmic properties
Date: Thu, 18 Oct 2018 13:14:07 +0200
Message-ID: <20181018111411.26623-4-marcel@ziswiler.com>
References: <20181018111411.26623-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018111411.26623-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder PMIC properties to be more in-line with any of our other device
trees.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v3: None
Changes in v2: None
Changes in v1: None

 arch/arm/boot/dts/tegra20-colibri.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 6162d193e12c..d3aba6501510 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -475,11 +475,11 @@
 		pmic@34 {
 			compatible = "ti,tps6586x";
 			reg = <0x34>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-			ti,system-power-controller;
 			#gpio-cells = <2>;
 			gpio-controller;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			sys-supply = <&reg_module_3v3>;
+			ti,system-power-controller;
 			vin-sm0-supply = <&reg_3v3_vsys>;
 			vin-sm1-supply = <&reg_3v3_vsys>;
 			vin-sm2-supply = <&reg_3v3_vsys>;
-- 
2.14.4
