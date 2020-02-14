From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM64: tegra: Fix Tegra194 PCIe compatible string
Date: Fri, 14 Feb 2020 13:53:53 +0000
Message-ID: <20200214135353.31334-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If the kernel configuration option CONFIG_PCIE_DW_PLAT_HOST is enabled
then this can cause the kernel to incorrectly probe the generic
designware PCIe platform driver instead of the Tegra194 designware PCIe
driver. This causes a boot failure on Tegra194 because the necessary
configuration to access the hardware is not performed.

The order in which the compatible strings are populated in Device-Tree
is not relevant in this case, because the kernel will attempt to probe
the device as soon as a driver is loaded and if the generic designware
PCIe driver is loaded first, then this driver will be probed first.
Therefore, to fix this problem, remove the "snps,dw-pcie" string from
the compatible string as we never want this driver to be probe on
Tegra194.

Fixes: 2602c32f15e7 ("arm64: tegra: Add P2U and PCIe controller nodes to Tegra194 DT")

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/pci/nvidia,tegra194-pcie.txt |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi             | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
index b739f92da58e..1f90eb39870b 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
@@ -118,7 +118,7 @@ Tegra194:
 --------
 
 	pcie@14180000 {
-		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
 		reg = <0x00 0x14180000 0x0 0x00020000   /* appl registers (128K)      */
 		       0x00 0x38000000 0x0 0x00040000   /* configuration space (256K) */
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index ccac43be12ac..4c58cb10fb9c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1208,7 +1208,7 @@
 	};
 
 	pcie@14100000 {
-		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
 		reg = <0x00 0x14100000 0x0 0x00020000   /* appl registers (128K)      */
 		       0x00 0x30000000 0x0 0x00040000   /* configuration space (256K) */
@@ -1253,7 +1253,7 @@
 	};
 
 	pcie@14120000 {
-		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
 		reg = <0x00 0x14120000 0x0 0x00020000   /* appl registers (128K)      */
 		       0x00 0x32000000 0x0 0x00040000   /* configuration space (256K) */
@@ -1298,7 +1298,7 @@
 	};
 
 	pcie@14140000 {
-		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
 		reg = <0x00 0x14140000 0x0 0x00020000   /* appl registers (128K)      */
 		       0x00 0x34000000 0x0 0x00040000   /* configuration space (256K) */
@@ -1343,7 +1343,7 @@
 	};
 
 	pcie@14160000 {
-		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX4A>;
 		reg = <0x00 0x14160000 0x0 0x00020000   /* appl registers (128K)      */
 		       0x00 0x36000000 0x0 0x00040000   /* configuration space (256K) */
@@ -1388,7 +1388,7 @@
 	};
 
 	pcie@14180000 {
-		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
 		reg = <0x00 0x14180000 0x0 0x00020000   /* appl registers (128K)      */
 		       0x00 0x38000000 0x0 0x00040000   /* configuration space (256K) */
@@ -1433,7 +1433,7 @@
 	};
 
 	pcie@141a0000 {
-		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8A>;
 		reg = <0x00 0x141a0000 0x0 0x00020000   /* appl registers (128K)      */
 		       0x00 0x3a000000 0x0 0x00040000   /* configuration space (256K) */
-- 
2.17.1
