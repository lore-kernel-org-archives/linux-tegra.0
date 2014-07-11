From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/12] soc/tegra: Add efuse and apbmisc bindings
Date: Fri, 11 Jul 2014 14:16:05 +0200
Message-ID: <1405080971-7609-7-git-send-email-thierry.reding@gmail.com>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405080971-7609-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add efuse and apbmisc bindings for Tegra20, Tegra30, Tegra114 and
Tegra124.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/fuse/nvidia,tegra20-fuse.txt          | 40 ++++++++++++++++++++++
 .../bindings/misc/nvidia,tegra20-apbmisc.txt       | 13 +++++++
 arch/arm/boot/dts/tegra114.dtsi                    | 15 ++++++++
 arch/arm/boot/dts/tegra124.dtsi                    | 15 ++++++++
 arch/arm/boot/dts/tegra20.dtsi                     | 15 ++++++++
 arch/arm/boot/dts/tegra30.dtsi                     | 15 ++++++++
 6 files changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
new file mode 100644
index 000000000000..d8c98c7614d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
@@ -0,0 +1,40 @@
+NVIDIA Tegra20/Tegra30/Tegr114/Tegra124 fuse block.
+
+Required properties:
+- compatible : should be:
+	"nvidia,tegra20-efuse"
+	"nvidia,tegra30-efuse"
+	"nvidia,tegra114-efuse"
+	"nvidia,tegra124-efuse"
+  Details:
+  nvidia,tegra20-efuse: Tegra20 requires using APB DMA to read the fuse data
+	due to a hardware bug. Tegra20 also lacks certain information which is
+	available in later generations such as fab code, lot code, wafer id,..
+  nvidia,tegra30-efuse, nvidia,tegra114-efuse and nvidia,tegra124-efuse:
+	The differences between these SoCs are the size of the efuse array,
+	the location of the spare (OEM programmable) bits and the location of
+	the speedo data.
+- reg: Should contain 1 entry: the entry gives the physical address and length
+       of the fuse registers.
+- clocks: Must contain an entry for each entry in clock-names.
+  See ../clocks/clock-bindings.txt for details.
+- clock-names: Must include the following entries:
+  - fuse
+- resets: Must contain an entry for each entry in reset-names.
+  See ../reset/reset.txt for details.
+- reset-names: Must include the following entries:
+ - fuse
+
+Example:
+
+	fuse@7000f800 {
+		compatible = "nvidia,tegra20-efuse";
+		reg = <0x7000F800 0x400>,
+		      <0x70000000 0x400>;
+		clocks = <&tegra_car TEGRA20_CLK_FUSE>;
+		clock-names = "fuse";
+		resets = <&tegra_car 39>;
+		reset-names = "fuse";
+	};
+
+
diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
new file mode 100644
index 000000000000..b97b8bef1fe5
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
@@ -0,0 +1,13 @@
+NVIDIA Tegra20/Tegra30/Tegr114/Tegra124 apbmisc block
+
+Required properties:
+- compatible : should be:
+       "nvidia,tegra20-apbmisc"
+       "nvidia,tegra30-apbmisc"
+       "nvidia,tegra114-apbmisc"
+       "nvidia,tegra124-apbmisc"
+- reg: Should contain 2 entries: the first entry gives the physical address
+       and length of the registers which contain revision and debug features.
+       The second entry gives the physical address and length of the
+       registers indicating the strapping options.
+
diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index fdc559ab2db3..335a1d8047f2 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -220,6 +220,12 @@
 		interrupt-controller;
 	};
 
+	apbmisc@70000800 {
+		compatible = "nvidia,tegra114-apbmisc", "nvidia,tegra20-apbmisc";
+		reg = <0x70000800 0x64   /* Chip revision */
+		       0x70000008 0x04>; /* Strapping options */
+	};
+
 	pinmux: pinmux@70000868 {
 		compatible = "nvidia,tegra114-pinmux";
 		reg = <0x70000868 0x148		/* Pad control registers */
@@ -485,6 +491,15 @@
 		clock-names = "pclk", "clk32k_in";
 	};
 
+	fuse@7000f800 {
+		compatible = "nvidia,tegra114-efuse";
+		reg = <0x7000f800 0x400>;
+		clocks = <&tegra_car TEGRA114_CLK_FUSE>;
+		clock-names = "fuse";
+		resets = <&tegra_car 39>;
+		reset-names = "fuse";
+	};
+
 	iommu@70019010 {
 		compatible = "nvidia,tegra114-smmu", "nvidia,tegra30-smmu";
 		reg = <0x70019010 0x02c
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 6e6bc4e8185c..226941c07d15 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -179,6 +179,12 @@
 		#dma-cells = <1>;
 	};
 
+	apbmisc@0,70000800 {
+		compatible = "nvidia,tegra124-apbmisc", "nvidia,tegra20-apbmisc";
+		reg = <0x0 0x70000800 0x0 0x64>,   /* Chip revision */
+		      <0x0 0x7000E864 0x0 0x04>;   /* Strapping options */
+	};
+
 	pinmux: pinmux@0,70000868 {
 		compatible = "nvidia,tegra124-pinmux";
 		reg = <0x0 0x70000868 0x0 0x164>, /* Pad control registers */
@@ -449,6 +455,15 @@
 		clock-names = "pclk", "clk32k_in";
 	};
 
+	fuse@0,7000f800 {
+		compatible = "nvidia,tegra124-efuse";
+		reg = <0x0 0x7000f800 0x0 0x400>;
+		clocks = <&tegra_car TEGRA124_CLK_FUSE>;
+		clock-names = "fuse";
+		resets = <&tegra_car 39>;
+		reset-names = "fuse";
+	};
+
 	sdhci@0,700b0000 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index a7ddf70df50b..243d84cdbae8 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -236,6 +236,12 @@
 		interrupt-controller;
 	};
 
+	apbmisc@70000800 {
+		compatible = "nvidia,tegra20-apbmisc";
+		reg = <0x70000800 0x64   /* Chip revision */
+		       0x70000008 0x04>; /* Strapping options */
+	};
+
 	pinmux: pinmux@70000014 {
 		compatible = "nvidia,tegra20-pinmux";
 		reg = <0x70000014 0x10   /* Tri-state registers */
@@ -545,6 +551,15 @@
 		#size-cells = <0>;
 	};
 
+	fuse@7000f800 {
+		compatible = "nvidia,tegra20-efuse";
+		reg = <0x7000F800 0x400>;
+		clocks = <&tegra_car TEGRA20_CLK_FUSE>;
+		clock-names = "fuse";
+		resets = <&tegra_car 39>;
+		reset-names = "fuse";
+	};
+
 	pcie-controller@80003000 {
 		compatible = "nvidia,tegra20-pcie";
 		device_type = "pci";
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index dec4fc823901..0b1ede940d1f 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -335,6 +335,12 @@
 		interrupt-controller;
 	};
 
+	apbmisc@70000800 {
+		compatible = "nvidia,tegra30-apbmisc", "nvidia,tegra20-apbmisc";
+		reg = <0x70000800 0x64   /* Chip revision */
+		       0x70000008 0x04>; /* Strapping options */
+	};
+
 	pinmux: pinmux@70000868 {
 		compatible = "nvidia,tegra30-pinmux";
 		reg = <0x70000868 0xd4    /* Pad control registers */
@@ -631,6 +637,15 @@
 		nvidia,ahb = <&ahb>;
 	};
 
+	fuse@7000f800 {
+		compatible = "nvidia,tegra30-efuse";
+		reg = <0x7000f800 0x400>;
+		clocks = <&tegra_car TEGRA30_CLK_FUSE>;
+		clock-names = "fuse";
+		resets = <&tegra_car 39>;
+		reset-names = "fuse";
+	};
+
 	ahub@70080000 {
 		compatible = "nvidia,tegra30-ahub";
 		reg = <0x70080000 0x200
-- 
2.0.1
