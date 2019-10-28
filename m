From: Anvesh Salveru <anvesh.s@samsung.com>
Subject: [PATCH 2/2] arm64: tegra: Add support for ZRX-DC phy property
Date: Mon, 28 Oct 2019 18:12:20 +0530
Message-ID: <1572266540-17626-3-git-send-email-anvesh.s@samsung.com>
References: <1572266540-17626-1-git-send-email-anvesh.s@samsung.com>
        <CGME20191028124258epcas5p17861f4fdb40385a184fc397f45c898a5@epcas5p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1572266540-17626-1-git-send-email-anvesh.s@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: pankaj.dubey@samsung.com, thierry.reding@gmail.com, jonathanh@nvidia.com, Anvesh Salveru <anvesh.s@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

DesignWare controller driver provides the support to handle the PHYs which
are compliant to ZRX-DC specification based on "snps,phy-zrxdc-compliant"
DT property. So, add "snps,phy-zrxdc-compliant" property in tegra pcie
controller DT nodes.

CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Anvesh Salveru <anvesh.s@samsung.com>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
Depends on the following patch:
https://patchwork.kernel.org/patch/11215241/
https://patchwork.kernel.org/patch/11215239/

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 3c0cf54f0aab..bf2dbf84c8c9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1194,6 +1194,7 @@
 		ranges = <0x81000000 0x0  0x30100000 0x0  0x30100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc2000000 0x12 0x00000000 0x12 0x00000000 0x0 0x30000000   /* prefetchable memory (768MB) */
 			  0x82000000 0x0  0x40000000 0x12 0x30000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+		snps,phy-zrxdc-compliant;
 	};
 
 	pcie@14120000 {
@@ -1240,6 +1241,7 @@
 		ranges = <0x81000000 0x0  0x32100000 0x0  0x32100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc2000000 0x12 0x40000000 0x12 0x40000000 0x0 0x30000000   /* prefetchable memory (768MB) */
 			  0x82000000 0x0  0x40000000 0x12 0x70000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+		snps,phy-zrxdc-compliant;
 	};
 
 	pcie@14140000 {
@@ -1286,6 +1288,7 @@
 		ranges = <0x81000000 0x0  0x34100000 0x0  0x34100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc2000000 0x12 0x80000000 0x12 0x80000000 0x0 0x30000000   /* prefetchable memory (768MB) */
 			  0x82000000 0x0  0x40000000 0x12 0xb0000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+		snps,phy-zrxdc-compliant;
 	};
 
 	pcie@14160000 {
@@ -1332,6 +1335,7 @@
 		ranges = <0x81000000 0x0  0x36100000 0x0  0x36100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc2000000 0x14 0x00000000 0x14 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
 			  0x82000000 0x0  0x40000000 0x17 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+		snps,phy-zrxdc-compliant;
 	};
 
 	pcie@14180000 {
@@ -1378,6 +1382,7 @@
 		ranges = <0x81000000 0x0  0x38100000 0x0  0x38100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc2000000 0x18 0x00000000 0x18 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
 			  0x82000000 0x0  0x40000000 0x1b 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+		snps,phy-zrxdc-compliant;
 	};
 
 	pcie@141a0000 {
@@ -1428,6 +1433,7 @@
 		ranges = <0x81000000 0x0  0x3a100000 0x0  0x3a100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc2000000 0x1c 0x00000000 0x1c 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
 			  0x82000000 0x0  0x40000000 0x1f 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+		snps,phy-zrxdc-compliant;
 	};
 
 	sysram@40000000 {
-- 
2.17.1
