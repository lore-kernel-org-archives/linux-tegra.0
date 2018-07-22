From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 06/28] ARM: tegra: apalis_t30: annotate pcie port nodes
Date: Sun, 22 Jul 2018 18:49:14 +0200
Message-ID: <20180722164936.20581-7-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate PCIe port nodes.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 0574eda8b3f9..a1cc415b3893 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -24,14 +24,17 @@
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
 			nvidia,num-lanes = <1>;
 			pcie@0 {
-- 
2.14.4
