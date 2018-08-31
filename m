From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 05/34] ARM: tegra: apalis_t30: annotate/clean-up pcie controller/port nodes
Date: Fri, 31 Aug 2018 18:37:47 +0200
Message-ID: <20180831163817.23970-6-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate PCIe port nodes and clean-up PCIe controller/port status' with
respect to carrier board vs. module level device trees. As port 3
connects to the on-module Gigabit Ethernet MACPHY it is always enabled
together with the PCIe controller itself.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Clean-up PCIe controller/port status' as well.

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 6 ------
 arch/arm/boot/dts/tegra30-apalis.dtsi     | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 0dc85a20bd45..e3c70e7d8d37 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -23,8 +23,6 @@
 	};
 
 	pcie@3000 {
-		status = "okay";
-
 		pci@1,0 {
 			status = "okay";
 		};
@@ -32,10 +30,6 @@
 		pci@2,0 {
 			status = "okay";
 		};
-
-		pci@3,0 {
-			status = "okay";
-		};
 	};
 
 	host1x@50000000 {
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index fc279a073ac5..c810c044025a 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -15,6 +15,7 @@
 	};
 
 	pcie@3000 {
+		status = "okay";
 		avdd-pexa-supply = <&vdd2_reg>;
 		avdd-pexb-supply = <&vdd2_reg>;
 		avdd-pex-pll-supply = <&vdd2_reg>;
@@ -24,15 +25,19 @@
 		vdd-pexa-supply = <&vdd2_reg>;
 		vdd-pexb-supply = <&vdd2_reg>;
 
+		/* Apalis type specific */
 		pci@1,0 {
 			nvidia,num-lanes = <4>;
 		};
 
+		/* Apalis PCIe */
 		pci@2,0 {
 			nvidia,num-lanes = <1>;
 		};
 
+		/* I210/I211 Gigabit Ethernet Controller (on-module) */
 		pci@3,0 {
+			status = "okay";
 			nvidia,num-lanes = <1>;
 			pcie@0 {
 				reg = <0 0 0 0 0>;
-- 
2.14.4
