From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 66/73] arm64: tegra: Use standard names for SRAM nodes
Date: Tue, 16 Jun 2020 15:52:31 +0200
Message-ID: <20200616135238.3001888-67-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

SRAM nodes should be named sram@<unit-address> to match the bindings.

While at it, also remove the unneeded, custom compatible string for
SRAM partition nodes.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 8 +++-----
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 3a41203deba2..d92eea1ddac7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1262,22 +1262,20 @@ gpu@17000000 {
 		interconnect-names = "dma-mem", "write-0", "read-1", "write-1";
 	};
 
-	sysram@30000000 {
+	sram@30000000 {
 		compatible = "nvidia,tegra186-sysram", "mmio-sram";
 		reg = <0x0 0x30000000 0x0 0x50000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x30000000 0x50000>;
 
-		cpu_bpmp_tx: shmem@4e000 {
-			compatible = "nvidia,tegra186-bpmp-shmem";
+		cpu_bpmp_tx: sram@4e000 {
 			reg = <0x4e000 0x1000>;
 			label = "cpu-bpmp-tx";
 			pool;
 		};
 
-		cpu_bpmp_rx: shmem@4f000 {
-			compatible = "nvidia,tegra186-bpmp-shmem";
+		cpu_bpmp_rx: sram@4f000 {
 			reg = <0x4f000 0x1000>;
 			label = "cpu-bpmp-rx";
 			pool;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 3089ebecfbef..2ecb80e1b09d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1803,22 +1803,20 @@ pcie_ep@141a0000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 	};
 
-	sysram@40000000 {
+	sram@40000000 {
 		compatible = "nvidia,tegra194-sysram", "mmio-sram";
 		reg = <0x0 0x40000000 0x0 0x50000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x40000000 0x50000>;
 
-		cpu_bpmp_tx: shmem@4e000 {
-			compatible = "nvidia,tegra194-bpmp-shmem";
+		cpu_bpmp_tx: sram@4e000 {
 			reg = <0x4e000 0x1000>;
 			label = "cpu-bpmp-tx";
 			pool;
 		};
 
-		cpu_bpmp_rx: shmem@4f000 {
-			compatible = "nvidia,tegra194-bpmp-shmem";
+		cpu_bpmp_rx: sram@4f000 {
 			reg = <0x4f000 0x1000>;
 			label = "cpu-bpmp-rx";
 			pool;
-- 
2.24.1
