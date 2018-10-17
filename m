From: Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH 1/2] arm64: dts: tegra186: Add dma-ranges to avoid using bounce buffers
Date: Tue, 16 Oct 2018 19:06:47 -0700
Message-ID: <1539742008-16595-1-git-send-email-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, avienamo@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Krishna Reddy <vdumpa@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add dma-ranges to avoid using DMA bounce buffers unnecessarily for
the devices that can address the physcial memory and don't
have SMMU enabled.

This also resolves the failures in attaching devices to IOMMU.
The following error is caused by the check in io-pgtable-arm.c, where
the dma address is expected to match the physical address for the IOMMU
devices that don't support coherent page table walking. Bounce buffer
usage is causing the mismatch and device add failure.

[    7.000461] arm-smmu 12000000.iommu: Cannot accommodate DMA
translation for IOMMU page tables
[    7.010513] iommu: Failed to add device 15200000.display to group 0:
-12

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 2f3c8e2..230c0c8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -14,6 +14,7 @@
 	interrupt-parent = <&gic>;
 	#address-cells = <2>;
 	#size-cells = <2>;
+	dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
 
 	misc@100000 {
 		compatible = "nvidia,tegra186-misc";
-- 
2.1.4
