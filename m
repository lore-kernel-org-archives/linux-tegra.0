From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 02/15] ARM: tegra: apalis-tk1: reorder pcie properties
Date: Tue, 24 Jul 2018 12:42:56 +0200
Message-ID: <20180724104309.21741-3-marcel@ziswiler.com>
References: <20180724104309.21741-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724104309.21741-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder PCIe properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 09e3641258ae..cb7e53c86408 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -39,9 +39,9 @@
 
 		/* I210 Gigabit Ethernet Controller (On-module) */
 		pci@2,0 {
+			status = "okay";
 			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-2}>;
 			phy-names = "pcie-0";
-			status = "okay";
 
 			pcie@0 {
 				reg = <0 0 0 0 0>;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 5e7ae5e92fb8..d73ee974648a 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -74,9 +74,9 @@
 
 		/* I210 Gigabit Ethernet Controller (On-module) */
 		pci@2,0 {
+			status = "okay";
 			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-2}>;
 			phy-names = "pcie-0";
-			status = "okay";
 
 			pcie@0 {
 				reg = <0 0 0 0 0>;
-- 
2.14.4
