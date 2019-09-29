From: Mian Yousaf Kaukab <ykaukab@suse.de>
Subject: [PATCH] arm64: tegra: only map accessible sysram
Date: Sun, 29 Sep 2019 22:08:51 +0200
Message-ID: <20190929200851.14228-1-ykaukab@suse.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, Mian Yousaf Kaukab <ykaukab@suse.de>
List-Id: linux-tegra@vger.kernel.org

Most of the SysRAM is secure and only accessible by TF-A.
Don't map this inaccessible memory in kernel. Only map pages
used by bpmp driver.

Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
---
Only tegra186 is tested. Tested on Jetson TX2.

 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 14 +++++++-------
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 47cd831fcf44..a861f46125fd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1174,23 +1174,23 @@
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
 	};
 
-	sysram@30000000 {
+	sysram@3004e000 {
 		compatible = "nvidia,tegra186-sysram", "mmio-sram";
-		reg = <0x0 0x30000000 0x0 0x50000>;
+		reg = <0x0 0x3004e000 0x0 0x2000>;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges = <0 0x0 0x0 0x30000000 0x0 0x50000>;
+		ranges = <0 0x0 0x0 0x3004e000 0x0 0x2000>;
 
-		cpu_bpmp_tx: shmem@4e000 {
+		cpu_bpmp_tx: shmem@e000 {
 			compatible = "nvidia,tegra186-bpmp-shmem";
-			reg = <0x0 0x4e000 0x0 0x1000>;
+			reg = <0x0 0x0 0x0 0x1000>;
 			label = "cpu-bpmp-tx";
 			pool;
 		};
 
-		cpu_bpmp_rx: shmem@4f000 {
+		cpu_bpmp_rx: shmem@f000 {
 			compatible = "nvidia,tegra186-bpmp-shmem";
-			reg = <0x0 0x4f000 0x0 0x1000>;
+			reg = <0x0 0x1000 0x0 0x1000>;
 			label = "cpu-bpmp-rx";
 			pool;
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 3c0cf54f0aab..98b9399d6b7f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1430,23 +1430,23 @@
 			  0x82000000 0x0  0x40000000 0x1f 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
 	};
 
-	sysram@40000000 {
+	sysram@4004e000 {
 		compatible = "nvidia,tegra194-sysram", "mmio-sram";
-		reg = <0x0 0x40000000 0x0 0x50000>;
+		reg = <0x0 0x4004e000 0x0 0x2000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x0 0x0 0x40000000 0x50000>;
+		ranges = <0x0 0x0 0x4004e000 0x2000>;
 
-		cpu_bpmp_tx: shmem@4e000 {
+		cpu_bpmp_tx: shmem@e000 {
 			compatible = "nvidia,tegra194-bpmp-shmem";
-			reg = <0x4e000 0x1000>;
+			reg = <0x0 0x1000>;
 			label = "cpu-bpmp-tx";
 			pool;
 		};
 
-		cpu_bpmp_rx: shmem@4f000 {
+		cpu_bpmp_rx: shmem@f000 {
 			compatible = "nvidia,tegra194-bpmp-shmem";
-			reg = <0x4f000 0x1000>;
+			reg = <0x1000 0x1000>;
 			label = "cpu-bpmp-rx";
 			pool;
 		};
-- 
2.16.4
