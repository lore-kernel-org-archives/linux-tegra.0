From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 42/73] arm64: tegra: Describe interconnect paths on Tegra194
Date: Tue, 16 Jun 2020 15:52:07 +0200
Message-ID: <20200616135238.3001888-43-thierry.reding@gmail.com>
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

On Tegra194, all clients of the memory subsystem can generally address
40 bits of system memory. However, bit 39 has special meaning and will
cause the memory controller to reorder sectors for block-linear buffer
formats. This is primarily useful for graphics-related devices.

Use of bit 39 must be controlled on a case-by-case basis. Buffers that
are used with bit 39 set by one device may be used with bit 39 cleared
by other devices.

Care must be taken to allocate buffers at addresses that do not require
bit 39 to be set. This is normally not an issue for system memory since
there are no Tegra-based systems with enough RAM to exhaust the 39-bit
physical address space. However, when a device is behind an IOMMU, such
as the ARM SMMU on Tegra194, the IOMMUs input address space can cause
IOVA allocations to happen in this region. This is for example the case
when an operating system implements a top-down allocation policy for IO
virtual addresses.

To account for this, describe the path that memory accesses take through
the system. Memory clients will send requests to the memory controller,
which forwards bits [38:0] of the address either to the external memory
controller or the SMMU, depending on the stream ID of the access. A good
way to describe this is using the interconnects bindings, see:

    Documentation/devicetree/bindings/interconnect/interconnect.txt

The standard "dma-mem" path is used to describe the path towards system
memory via the memory controller. A dma-ranges property in the memory
controller's device tree node limits the range of DMA addresses that the
memory clients can use to bits [38:0], ensuring that bit 39 is not used.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v4:
- add additional entries for interconnect-names to match interconnects
- add EMC as destination for interconnect paths

Changes in v3:
- add missing interconnect properties for VIC

Changes in v2:
- use memory client IDs instead of stream IDs (Mikko Perttunen)

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index ae438b2c4dd9..a50504a317d7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -59,6 +59,9 @@ ethernet@2490000 {
 			clock-names = "master_bus", "slave_bus", "rx", "tx", "ptp_ref";
 			resets = <&bpmp TEGRA194_RESET_EQOS>;
 			reset-names = "eqos";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_EQOSR &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_EQOSW &emc>;
+			interconnect-names = "dma-mem", "write";
 			status = "disabled";
 
 			snps,write-requests = <1>;
@@ -176,6 +179,7 @@ mc: memory-controller@2c00000 {
 			reg = <0x02c00000 0x100000>,
 			      <0x02b80000 0x040000>,
 			      <0x01700000 0x100000>;
+			#interconnect-cells = <1>;
 			status = "disabled";
 
 			#address-cells = <2>;
@@ -209,6 +213,8 @@ emc: external-memory-controller@2c60000 {
 				clocks = <&bpmp TEGRA194_CLK_EMC>;
 				clock-names = "emc";
 
+				#interconnect-cells = <0>;
+
 				nvidia,bpmp = <&bpmp>;
 			};
 		};
@@ -457,6 +463,9 @@ sdmmc1: sdhci@3400000 {
 			clock-names = "sdhci";
 			resets = <&bpmp TEGRA194_RESET_SDMMC1>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRA &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWA &emc>;
+			interconnect-names = "dma-mem", "write";
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
 									<0x07>;
 			nvidia,pad-autocal-pull-down-offset-3v3-timeout =
@@ -479,6 +488,9 @@ sdmmc3: sdhci@3440000 {
 			clock-names = "sdhci";
 			resets = <&bpmp TEGRA194_RESET_SDMMC3>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCR &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_SDMMCW &emc>;
+			interconnect-names = "dma-mem", "write";
 			nvidia,pad-autocal-pull-up-offset-1v8 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-1v8 = <0x7a>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout = <0x07>;
@@ -506,6 +518,9 @@ sdmmc4: sdhci@3460000 {
 					  <&bpmp TEGRA194_CLK_PLLC4>;
 			resets = <&bpmp TEGRA194_RESET_SDMMC4>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRAB &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWAB &emc>;
+			interconnect-names = "dma-mem", "write";
 			nvidia,pad-autocal-pull-up-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-up-offset-1v8-timeout = <0x0a>;
@@ -534,6 +549,9 @@ hda@3510000 {
 				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>;
 			reset-names = "hda", "hda2codec_2x", "hda2hdmi";
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HDAR &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_HDAW &emc>;
+			interconnect-names = "dma-mem", "write";
 			status = "disabled";
 		};
 
@@ -1032,6 +1050,8 @@ host1x@13e00000 {
 			#size-cells = <1>;
 
 			ranges = <0x15000000 0x15000000 0x01000000>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HOST1XDMAR &emc>;
+			interconnect-names = "dma-mem";
 
 			display-hub@15200000 {
 				compatible = "nvidia,tegra194-display", "simple-bus";
@@ -1067,6 +1087,9 @@ display@15200000 {
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+					interconnect-names = "dma-mem", "read-1";
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <0>;
@@ -1082,6 +1105,9 @@ display@15210000 {
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPB>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+					interconnect-names = "dma-mem", "read-1";
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <1>;
@@ -1097,6 +1123,9 @@ display@15220000 {
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+					interconnect-names = "dma-mem", "read-1";
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <2>;
@@ -1112,6 +1141,9 @@ display@15230000 {
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+					interconnect-names = "dma-mem", "read-1";
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <3>;
@@ -1128,6 +1160,9 @@ vic@15340000 {
 				reset-names = "vic";
 
 				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_VIC>;
+				interconnects = <&mc TEGRA194_MEMORY_CLIENT_VICSRD &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_VICSWR &emc>;
+				interconnect-names = "dma-mem", "write";
 			};
 
 			dpaux0: dpaux@155c0000 {
@@ -1404,9 +1439,14 @@ pcie@14100000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x30100000 0x0  0x30100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x12 0x00000000 0x12 0x00000000 0x0 0x30000000   /* prefetchable memory (768MB) */
 			  0x82000000 0x0  0x40000000 0x12 0x30000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE1R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE1W &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie@14120000 {
@@ -1449,9 +1489,14 @@ pcie@14120000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x32100000 0x0  0x32100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x12 0x40000000 0x12 0x40000000 0x0 0x30000000   /* prefetchable memory (768MB) */
 			  0x82000000 0x0  0x40000000 0x12 0x70000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE2AR &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE2AW &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie@14140000 {
@@ -1494,9 +1539,14 @@ pcie@14140000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x34100000 0x0  0x34100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x12 0x80000000 0x12 0x80000000 0x0 0x30000000   /* prefetchable memory (768MB) */
 			  0x82000000 0x0  0x40000000 0x12 0xb0000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE3R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE3W &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie@14160000 {
@@ -1539,9 +1589,14 @@ pcie@14160000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x36100000 0x0  0x36100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x14 0x00000000 0x14 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
 			  0x82000000 0x0  0x40000000 0x17 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie@14180000 {
@@ -1584,9 +1639,14 @@ pcie@14180000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x38100000 0x0  0x38100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x18 0x00000000 0x18 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
 			  0x82000000 0x0  0x40000000 0x1b 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie@141a0000 {
@@ -1633,9 +1693,14 @@ pcie@141a0000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x3a100000 0x0  0x3a100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x1c 0x00000000 0x1c 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
 			  0x82000000 0x0  0x40000000 0x1f 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie_ep@14160000 {
@@ -1767,6 +1832,11 @@ bpmp: bpmp {
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_BPMPR &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_BPMPW &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_BPMPDMAR &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_BPMPDMAW &emc>;
+		interconnect-names = "read", "write", "dma-mem", "dma-write";
 
 		bpmp_i2c: i2c {
 			compatible = "nvidia,tegra186-bpmp-i2c";
-- 
2.24.1
