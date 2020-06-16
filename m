From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 55/73] arm64: tegra: Use proper tuple notation
Date: Tue, 16 Jun 2020 15:52:20 +0200
Message-ID: <20200616135238.3001888-56-thierry.reding@gmail.com>
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

Tuple boundaries should be marked by < and > to make it clear which
cells are part of the same tuple. This also helps the json-schema based
validation tooling to properly parse this data.

While at it, also remove the "immovable" bit from PCI addresses. All of
these addresses are in fact "movable".

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi      |  16 +--
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  18 +--
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 112 +++++++++---------
 .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi |   3 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  16 +--
 5 files changed, 83 insertions(+), 82 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 0cc6b4e9f954..fa5ee55fd4a5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -17,9 +17,9 @@ / {
 	pcie@1003000 {
 		compatible = "nvidia,tegra124-pcie";
 		device_type = "pci";
-		reg = <0x0 0x01003000 0x0 0x00000800   /* PADS registers */
-		       0x0 0x01003800 0x0 0x00000800   /* AFI registers */
-		       0x0 0x02000000 0x0 0x10000000>; /* configuration space */
+		reg = <0x0 0x01003000 0x0 0x00000800>, /* PADS registers */
+		      <0x0 0x01003800 0x0 0x00000800>, /* AFI registers */
+		      <0x0 0x02000000 0x0 0x10000000>; /* configuration space */
 		reg-names = "pads", "afi", "cs";
 		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
 			     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
@@ -33,11 +33,11 @@ pcie@1003000 {
 		#address-cells = <3>;
 		#size-cells = <2>;
 
-		ranges = <0x82000000 0 0x01000000 0x0 0x01000000 0 0x00001000   /* port 0 configuration space */
-			  0x82000000 0 0x01001000 0x0 0x01001000 0 0x00001000   /* port 1 configuration space */
-			  0x81000000 0 0x0        0x0 0x12000000 0 0x00010000   /* downstream I/O (64 KiB) */
-			  0x82000000 0 0x13000000 0x0 0x13000000 0 0x0d000000   /* non-prefetchable memory (208 MiB) */
-			  0xc2000000 0 0x20000000 0x0 0x20000000 0 0x20000000>; /* prefetchable memory (512 MiB) */
+		ranges = <0x02000000 0 0x01000000 0x0 0x01000000 0 0x00001000>, /* port 0 configuration space */
+			 <0x02000000 0 0x01001000 0x0 0x01001000 0 0x00001000>, /* port 1 configuration space */
+			 <0x01000000 0 0x0        0x0 0x12000000 0 0x00010000>, /* downstream I/O (64 KiB) */
+			 <0x02000000 0 0x13000000 0x0 0x13000000 0 0x0d000000>, /* non-prefetchable memory (208 MiB) */
+			 <0x42000000 0 0x20000000 0x0 0x20000000 0 0x20000000>; /* prefetchable memory (512 MiB) */
 
 		clocks = <&tegra_car TEGRA124_CLK_PCIE>,
 			 <&tegra_car TEGRA124_CLK_AFI>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 927c646620cb..184cc0365002 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -776,9 +776,9 @@ pcie@10003000 {
 		compatible = "nvidia,tegra186-pcie";
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_PCX>;
 		device_type = "pci";
-		reg = <0x0 0x10003000 0x0 0x00000800   /* PADS registers */
-		       0x0 0x10003800 0x0 0x00000800   /* AFI registers */
-		       0x0 0x40000000 0x0 0x10000000>; /* configuration space */
+		reg = <0x0 0x10003000 0x0 0x00000800>, /* PADS registers */
+		      <0x0 0x10003800 0x0 0x00000800>, /* AFI registers */
+		      <0x0 0x40000000 0x0 0x10000000>; /* configuration space */
 		reg-names = "pads", "afi", "cs";
 
 		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
@@ -793,12 +793,12 @@ pcie@10003000 {
 		#address-cells = <3>;
 		#size-cells = <2>;
 
-		ranges = <0x82000000 0 0x10000000 0x0 0x10000000 0 0x00001000   /* port 0 configuration space */
-			  0x82000000 0 0x10001000 0x0 0x10001000 0 0x00001000   /* port 1 configuration space */
-			  0x82000000 0 0x10004000 0x0 0x10004000 0 0x00001000   /* port 2 configuration space */
-			  0x81000000 0 0x0        0x0 0x50000000 0 0x00010000   /* downstream I/O (64 KiB) */
-			  0x82000000 0 0x50100000 0x0 0x50100000 0 0x07F00000   /* non-prefetchable memory (127 MiB) */
-			  0xc2000000 0 0x58000000 0x0 0x58000000 0 0x28000000>; /* prefetchable memory (640 MiB) */
+		ranges = <0x02000000 0 0x10000000 0x0 0x10000000 0 0x00001000>, /* port 0 configuration space */
+			 <0x02000000 0 0x10001000 0x0 0x10001000 0 0x00001000>,/* port 1 configuration space */
+			 <0x02000000 0 0x10004000 0x0 0x10004000 0 0x00001000>, /* port 2 configuration space */
+			 <0x01000000 0 0x0        0x0 0x50000000 0 0x00010000>, /* downstream I/O (64 KiB) */
+			 <0x02000000 0 0x50100000 0x0 0x50100000 0 0x07f00000>, /* non-prefetchable memory (127 MiB) */
+			 <0x42000000 0 0x58000000 0x0 0x58000000 0 0x28000000>; /* prefetchable memory (640 MiB) */
 
 		clocks = <&bpmp TEGRA186_CLK_AFI>,
 			 <&bpmp TEGRA186_CLK_PCIE>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index d5246c75b782..72ba5146b0a9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -144,8 +144,8 @@ agic: interrupt-controller@2a40000 {
 
 		pinmux: pinmux@2430000 {
 			compatible = "nvidia,tegra194-pinmux";
-			reg = <0x2430000 0x17000
-			       0xc300000 0x4000>;
+			reg = <0x2430000 0x17000>,
+			      <0xc300000 0x4000>;
 
 			status = "okay";
 
@@ -1404,10 +1404,10 @@ sor3: sor@15bc0000 {
 	pcie@14100000 {
 		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
-		reg = <0x00 0x14100000 0x0 0x00020000   /* appl registers (128K)      */
-		       0x00 0x30000000 0x0 0x00040000   /* configuration space (256K) */
-		       0x00 0x30040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
-		       0x00 0x30080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+		reg = <0x00 0x14100000 0x0 0x00020000>, /* appl registers (128K)      */
+		      <0x00 0x30000000 0x0 0x00040000>, /* configuration space (256K) */
+		      <0x00 0x30040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+		      <0x00 0x30080000 0x0 0x00040000>; /* DBI reg space (256K)       */
 		reg-names = "appl", "config", "atu_dma", "dbi";
 
 		status = "disabled";
@@ -1442,9 +1442,9 @@ pcie@14100000 {
 
 		bus-range = <0x0 0xff>;
 
-		ranges = <0x81000000 0x0  0x30100000 0x0  0x30100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x12 0x00000000 0x12 0x00000000 0x0 0x30000000   /* prefetchable memory (768MB) */
-			  0x82000000 0x0  0x40000000 0x12 0x30000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+		ranges = <0x01000000 0x0  0x30100000 0x0  0x30100000 0x0 0x00100000>, /* downstream I/O (1MB) */
+			 <0x43000000 0x12 0x00000000 0x12 0x00000000 0x0 0x30000000>, /* prefetchable memory (768MB) */
+			 <0x02000000 0x0  0x40000000 0x12 0x30000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE1R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE1W &emc>;
@@ -1454,10 +1454,10 @@ pcie@14100000 {
 	pcie@14120000 {
 		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
-		reg = <0x00 0x14120000 0x0 0x00020000   /* appl registers (128K)      */
-		       0x00 0x32000000 0x0 0x00040000   /* configuration space (256K) */
-		       0x00 0x32040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
-		       0x00 0x32080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+		reg = <0x00 0x14120000 0x0 0x00020000>, /* appl registers (128K)      */
+		      <0x00 0x32000000 0x0 0x00040000>, /* configuration space (256K) */
+		      <0x00 0x32040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+		      <0x00 0x32080000 0x0 0x00040000>; /* DBI reg space (256K)       */
 		reg-names = "appl", "config", "atu_dma", "dbi";
 
 		status = "disabled";
@@ -1492,9 +1492,9 @@ pcie@14120000 {
 
 		bus-range = <0x0 0xff>;
 
-		ranges = <0x81000000 0x0  0x32100000 0x0  0x32100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x12 0x40000000 0x12 0x40000000 0x0 0x30000000   /* prefetchable memory (768MB) */
-			  0x82000000 0x0  0x40000000 0x12 0x70000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+		ranges = <0x01000000 0x0  0x32100000 0x0  0x32100000 0x0 0x00100000>, /* downstream I/O (1MB) */
+			 <0x43000000 0x12 0x40000000 0x12 0x40000000 0x0 0x30000000>, /* prefetchable memory (768MB) */
+			 <0x02000000 0x0  0x40000000 0x12 0x70000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE2AR &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE2AW &emc>;
@@ -1504,10 +1504,10 @@ pcie@14120000 {
 	pcie@14140000 {
 		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
-		reg = <0x00 0x14140000 0x0 0x00020000   /* appl registers (128K)      */
-		       0x00 0x34000000 0x0 0x00040000   /* configuration space (256K) */
-		       0x00 0x34040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
-		       0x00 0x34080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+		reg = <0x00 0x14140000 0x0 0x00020000>, /* appl registers (128K)      */
+		      <0x00 0x34000000 0x0 0x00040000>, /* configuration space (256K) */
+		      <0x00 0x34040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+		      <0x00 0x34080000 0x0 0x00040000>; /* DBI reg space (256K)       */
 		reg-names = "appl", "config", "atu_dma", "dbi";
 
 		status = "disabled";
@@ -1542,9 +1542,9 @@ pcie@14140000 {
 
 		bus-range = <0x0 0xff>;
 
-		ranges = <0x81000000 0x0  0x34100000 0x0  0x34100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x12 0x80000000 0x12 0x80000000 0x0 0x30000000   /* prefetchable memory (768MB) */
-			  0x82000000 0x0  0x40000000 0x12 0xb0000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+		ranges = <0x01000000 0x0  0x34100000 0x0  0x34100000 0x0 0x00100000>, /* downstream I/O (1MB) */
+			 <0x43000000 0x12 0x80000000 0x12 0x80000000 0x0 0x30000000>, /* prefetchable memory (768MB) */
+			 <0x02000000 0x0  0x40000000 0x12 0xb0000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE3R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE3W &emc>;
@@ -1554,10 +1554,10 @@ pcie@14140000 {
 	pcie@14160000 {
 		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX4A>;
-		reg = <0x00 0x14160000 0x0 0x00020000   /* appl registers (128K)      */
-		       0x00 0x36000000 0x0 0x00040000   /* configuration space (256K) */
-		       0x00 0x36040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
-		       0x00 0x36080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+		reg = <0x00 0x14160000 0x0 0x00020000>, /* appl registers (128K)      */
+		      <0x00 0x36000000 0x0 0x00040000>, /* configuration space (256K) */
+		      <0x00 0x36040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+		      <0x00 0x36080000 0x0 0x00040000>; /* DBI reg space (256K)       */
 		reg-names = "appl", "config", "atu_dma", "dbi";
 
 		status = "disabled";
@@ -1592,9 +1592,9 @@ pcie@14160000 {
 
 		bus-range = <0x0 0xff>;
 
-		ranges = <0x81000000 0x0  0x36100000 0x0  0x36100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x14 0x00000000 0x14 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
-			  0x82000000 0x0  0x40000000 0x17 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+		ranges = <0x01000000 0x0  0x36100000 0x0  0x36100000 0x0 0x00100000>, /* downstream I/O (1MB) */
+			 <0x43000000 0x14 0x00000000 0x14 0x00000000 0x3 0x40000000>, /* prefetchable memory (13GB) */
+			 <0x02000000 0x0  0x40000000 0x17 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
@@ -1604,10 +1604,10 @@ pcie@14160000 {
 	pcie@14180000 {
 		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
-		reg = <0x00 0x14180000 0x0 0x00020000   /* appl registers (128K)      */
-		       0x00 0x38000000 0x0 0x00040000   /* configuration space (256K) */
-		       0x00 0x38040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
-		       0x00 0x38080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+		reg = <0x00 0x14180000 0x0 0x00020000>, /* appl registers (128K)      */
+		      <0x00 0x38000000 0x0 0x00040000>, /* configuration space (256K) */
+		      <0x00 0x38040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+		      <0x00 0x38080000 0x0 0x00040000>; /* DBI reg space (256K)       */
 		reg-names = "appl", "config", "atu_dma", "dbi";
 
 		status = "disabled";
@@ -1642,9 +1642,9 @@ pcie@14180000 {
 
 		bus-range = <0x0 0xff>;
 
-		ranges = <0x81000000 0x0  0x38100000 0x0  0x38100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x18 0x00000000 0x18 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
-			  0x82000000 0x0  0x40000000 0x1b 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+		ranges = <0x01000000 0x0  0x38100000 0x0  0x38100000 0x0 0x00100000>, /* downstream I/O (1MB) */
+			 <0x43000000 0x18 0x00000000 0x18 0x00000000 0x3 0x40000000>, /* prefetchable memory (13GB) */
+			 <0x02000000 0x0  0x40000000 0x1b 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
@@ -1654,10 +1654,10 @@ pcie@14180000 {
 	pcie@141a0000 {
 		compatible = "nvidia,tegra194-pcie";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8A>;
-		reg = <0x00 0x141a0000 0x0 0x00020000   /* appl registers (128K)      */
-		       0x00 0x3a000000 0x0 0x00040000   /* configuration space (256K) */
-		       0x00 0x3a040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
-		       0x00 0x3a080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+		reg = <0x00 0x141a0000 0x0 0x00020000>, /* appl registers (128K)      */
+		      <0x00 0x3a000000 0x0 0x00040000>, /* configuration space (256K) */
+		      <0x00 0x3a040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+		      <0x00 0x3a080000 0x0 0x00040000>; /* DBI reg space (256K)       */
 		reg-names = "appl", "config", "atu_dma", "dbi";
 
 		status = "disabled";
@@ -1696,9 +1696,9 @@ pcie@141a0000 {
 
 		bus-range = <0x0 0xff>;
 
-		ranges = <0x81000000 0x0  0x3a100000 0x0  0x3a100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x1c 0x00000000 0x1c 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
-			  0x82000000 0x0  0x40000000 0x1f 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+		ranges = <0x01000000 0x0  0x3a100000 0x0  0x3a100000 0x0 0x00100000>, /* downstream I/O (1MB) */
+			 <0x43000000 0x1c 0x00000000 0x1c 0x00000000 0x3 0x40000000>, /* prefetchable memory (13GB) */
+			 <0x02000000 0x0  0x40000000 0x1f 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
@@ -1708,10 +1708,10 @@ pcie@141a0000 {
 	pcie_ep@14160000 {
 		compatible = "nvidia,tegra194-pcie-ep", "snps,dw-pcie-ep";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX4A>;
-		reg = <0x00 0x14160000 0x0 0x00020000   /* appl registers (128K)      */
-		       0x00 0x36040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
-		       0x00 0x36080000 0x0 0x00040000   /* DBI reg space (256K)       */
-		       0x14 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
+		reg = <0x00 0x14160000 0x0 0x00020000>, /* appl registers (128K)      */
+		      <0x00 0x36040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+		      <0x00 0x36080000 0x0 0x00040000>, /* DBI reg space (256K)       */
+		      <0x14 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
 		reg-names = "appl", "atu_dma", "dbi", "addr_space";
 
 		status = "disabled";
@@ -1740,10 +1740,10 @@ pcie_ep@14160000 {
 	pcie_ep@14180000 {
 		compatible = "nvidia,tegra194-pcie-ep", "snps,dw-pcie-ep";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
-		reg = <0x00 0x14180000 0x0 0x00020000   /* appl registers (128K)      */
-		       0x00 0x38040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
-		       0x00 0x38080000 0x0 0x00040000   /* DBI reg space (256K)       */
-		       0x18 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
+		reg = <0x00 0x14180000 0x0 0x00020000>, /* appl registers (128K)      */
+		      <0x00 0x38040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+		      <0x00 0x38080000 0x0 0x00040000>, /* DBI reg space (256K)       */
+		      <0x18 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
 		reg-names = "appl", "atu_dma", "dbi", "addr_space";
 
 		status = "disabled";
@@ -1772,10 +1772,10 @@ pcie_ep@14180000 {
 	pcie_ep@141a0000 {
 		compatible = "nvidia,tegra194-pcie-ep", "snps,dw-pcie-ep";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8A>;
-		reg = <0x00 0x141a0000 0x0 0x00020000   /* appl registers (128K)      */
-		       0x00 0x3a040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
-		       0x00 0x3a080000 0x0 0x00040000   /* DBI reg space (256K)       */
-		       0x1c 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
+		reg = <0x00 0x141a0000 0x0 0x00020000>, /* appl registers (128K)      */
+		      <0x00 0x3a040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+		      <0x00 0x3a080000 0x0 0x00040000>, /* DBI reg space (256K)       */
+		      <0x1c 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
 		reg-names = "appl", "atu_dma", "dbi", "addr_space";
 
 		status = "disabled";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index a348789bc5e1..1acb9bb6c7df 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1387,7 +1387,8 @@ pin_gpio3 {
 			spmic-default-output-high {
 				gpio-hog;
 				output-high;
-				gpios = <2 GPIO_ACTIVE_HIGH 7 GPIO_ACTIVE_HIGH>;
+				gpios = <2 GPIO_ACTIVE_HIGH>,
+					<7 GPIO_ACTIVE_HIGH>;
 			};
 
 			fps {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 1f7dc518b394..6a78056b94f4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -18,9 +18,9 @@ / {
 	pcie@1003000 {
 		compatible = "nvidia,tegra210-pcie";
 		device_type = "pci";
-		reg = <0x0 0x01003000 0x0 0x00000800   /* PADS registers */
-		       0x0 0x01003800 0x0 0x00000800   /* AFI registers */
-		       0x0 0x02000000 0x0 0x10000000>; /* configuration space */
+		reg = <0x0 0x01003000 0x0 0x00000800>, /* PADS registers */
+		      <0x0 0x01003800 0x0 0x00000800>, /* AFI registers */
+		      <0x0 0x02000000 0x0 0x10000000>; /* configuration space */
 		reg-names = "pads", "afi", "cs";
 		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
 			     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
@@ -34,11 +34,11 @@ pcie@1003000 {
 		#address-cells = <3>;
 		#size-cells = <2>;
 
-		ranges = <0x82000000 0 0x01000000 0x0 0x01000000 0 0x00001000   /* port 0 configuration space */
-			  0x82000000 0 0x01001000 0x0 0x01001000 0 0x00001000   /* port 1 configuration space */
-			  0x81000000 0 0x0        0x0 0x12000000 0 0x00010000   /* downstream I/O (64 KiB) */
-			  0x82000000 0 0x13000000 0x0 0x13000000 0 0x0d000000   /* non-prefetchable memory (208 MiB) */
-			  0xc2000000 0 0x20000000 0x0 0x20000000 0 0x20000000>; /* prefetchable memory (512 MiB) */
+		ranges = <0x02000000 0 0x01000000 0x0 0x01000000 0 0x00001000>, /* port 0 configuration space */
+			 <0x02000000 0 0x01001000 0x0 0x01001000 0 0x00001000>, /* port 1 configuration space */
+			 <0x01000000 0 0x0        0x0 0x12000000 0 0x00010000>, /* downstream I/O (64 KiB) */
+			 <0x02000000 0 0x13000000 0x0 0x13000000 0 0x0d000000>, /* non-prefetchable memory (208 MiB) */
+			 <0x42000000 0 0x20000000 0x0 0x20000000 0 0x20000000>; /* prefetchable memory (512 MiB) */
 
 		clocks = <&tegra_car TEGRA210_CLK_PCIE>,
 			 <&tegra_car TEGRA210_CLK_AFI>,
-- 
2.24.1
