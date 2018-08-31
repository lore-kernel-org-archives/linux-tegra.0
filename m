From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 04/34] ARM: tegra: apalis_t30: reorder pcie properties
Date: Fri, 31 Aug 2018 18:37:46 +0200
Message-ID: <20180831163817.23970-5-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder PCIe properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-apalis.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index f13df31b5e25..fc279a073ac5 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -16,13 +16,13 @@
 
 	pcie@3000 {
 		avdd-pexa-supply = <&vdd2_reg>;
-		vdd-pexa-supply = <&vdd2_reg>;
 		avdd-pexb-supply = <&vdd2_reg>;
-		vdd-pexb-supply = <&vdd2_reg>;
 		avdd-pex-pll-supply = <&vdd2_reg>;
 		avdd-plle-supply = <&ldo6_reg>;
-		vddio-pex-ctl-supply = <&sys_3v3_reg>;
 		hvdd-pex-supply = <&sys_3v3_reg>;
+		vddio-pex-ctl-supply = <&sys_3v3_reg>;
+		vdd-pexa-supply = <&vdd2_reg>;
+		vdd-pexb-supply = <&vdd2_reg>;
 
 		pci@1,0 {
 			nvidia,num-lanes = <4>;
-- 
2.14.4
