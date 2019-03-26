From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH 06/10] arm64: tegra: Add P2U and PCIe controller nodes to Tegra194 DT
Date: Tue, 26 Mar 2019 20:43:23 +0530
Message-ID: <1553613207-3988-7-git-send-email-vidyas@nvidia.com>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, vidyas@nvidia.com, tiwai@suse.de, spujar@nvidia.com, skomatineni@nvidia.com, liviu.dudau@arm.com, krzk@kernel.org, heiko@sntech.de, horms+renesas@verge.net.au, olof@lixom.net, maxime.ripard@bootlin.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, ezequiel@collabora.com, stefan.wahren@i2se.com, marc.w.gonzalez@free.fr, l.stach@pengutronix.de, tpiepho@impinj.com, hayashi.kunihiko@
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Add P2U (PIPE to UPHY) and PCIe controller nodes to device tree.
The Tegra194 SoC contains six PCIe controllers and twenty P2U instances
grouped into two different PHY bricks namely High-Speed IO (HSIO-12 P2Us)
and NVIDIA High Speed (NVHS-8 P2Us) respectively.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 473 +++++++++++++++++++++++++++++++
 1 file changed, 473 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index c77ca211fa8f..266a3058fa66 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1054,4 +1054,477 @@
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
 	};
+
+	hsio-p2u {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		p2u_0: p2u@03e10000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03e10000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_1: p2u@03e20000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03e20000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_2: p2u@03e30000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03e30000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_3: p2u@03e40000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03e40000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_4: p2u@03e50000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03e50000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_5: p2u@03e60000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03e60000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_6: p2u@03e70000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03e70000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_7: p2u@03e80000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03e80000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_8: p2u@03e90000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03e90000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_9: p2u@03ea0000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03ea0000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_10: p2u@03f30000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03f30000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_11: p2u@03f40000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03f40000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+	};
+
+	nvhs-p2u {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		p2u_12: p2u@03eb0000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03eb0000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_13: p2u@03ec0000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03ec0000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_14: p2u@03ed0000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03ed0000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_15: p2u@03ee0000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03ee0000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_16: p2u@03ef0000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03ef0000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_17: p2u@03f00000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03f00000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_18: p2u@03f10000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03f10000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+		p2u_19: p2u@03f20000 {
+			compatible = "nvidia,tegra194-phy-p2u";
+			reg = <0x0 0x03f20000 0x0 0x00010000>;
+			reg-names = "base";
+
+			#phy-cells = <0>;
+		};
+	};
+
+	pcie@14180000 {
+		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
+		reg = <0x00 0x14180000 0x0 0x00020000   /* appl registers (128K)      */
+		       0x00 0x38000000 0x0 0x02000000   /* window1 (32M)              */
+		       0x00 0x38000000 0x0 0x00040000   /* configuration space (256K) */
+		       0x00 0x38040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
+		       0x00 0x38080000 0x0 0x00040000   /* DBI reg space (256K)       */
+		       0x18 0x00000000 0x4 0x00000000>; /* window2 (16G)              */
+		reg-names = "appl", "window1", "config", "atu_dma", "dbi", "window2";
+
+		status = "disabled";
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		num-lanes = <8>;
+		num-viewport = <8>;
+		linux,pci-domain = <0>;
+
+		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_0>;
+		clock-names = "core_clk";
+
+		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_0_APB>,
+			 <&bpmp TEGRA194_RESET_PEX0_CORE_0>;
+		reset-names = "core_apb_rst", "core_rst";
+
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,	/* controller interrupt */
+			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;	/* MSI interrupt */
+		interrupt-names = "intr", "msi";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0>;
+		interrupt-map = <0 0 0 0 &gic 0 72 0x04>;
+
+		nvidia,bpmp = <&bpmp>;
+
+		nvidia,max-speed = <4>;
+		nvidia,disable-aspm-states = <0xf>;
+		nvidia,controller-id = <&bpmp 0x0>;
+		nvidia,aspm-cmrt = <0x3C>;
+		nvidia,aspm-pwr-on-t = <0x14>;
+		nvidia,aspm-l0s-entrance-latency = <0x3>;
+
+		bus-range = <0x0 0xff>;
+		ranges = <0x81000000 0x0 0x38100000 0x0 0x38100000 0x0 0x00100000    /* downstream I/O (1MB) */
+			  0xc2000000 0x18 0x00000000 0x18 0x00000000 0x3 0x40000000  /* prefetchable memory (13GB) */
+			  0x82000000 0x0 0x40000000 0x1B 0x40000000 0x0 0xC0000000>; /* non-prefetchable memory (3GB) */
+
+		nvidia,event-cntr-ctrl = <0x1d8>;
+		nvidia,event-cntr-data = <0x1dc>;
+	};
+
+	pcie@14100000 {
+		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
+		reg = <0x00 0x14100000 0x0 0x00020000   /* appl registers (128K)      */
+		       0x00 0x30000000 0x0 0x02000000   /* window1 (32M)              */
+		       0x00 0x30000000 0x0 0x00040000   /* configuration space (256K) */
+		       0x00 0x30040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
+		       0x00 0x30080000 0x0 0x00040000   /* DBI reg space (256K)       */
+		       0x12 0x00000000 0x0 0x40000000>; /* window2 (1G)               */
+		reg-names = "appl", "window1", "config", "atu_dma", "dbi", "window2";
+
+		status = "disabled";
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		num-lanes = <1>;
+		num-viewport = <8>;
+		linux,pci-domain = <1>;
+
+		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_1>;
+		clock-names = "core_clk";
+
+		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_1_APB>,
+			 <&bpmp TEGRA194_RESET_PEX0_CORE_1>;
+		reset-names = "core_apb_rst", "core_rst";
+
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,	/* controller interrupt */
+			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;	/* MSI interrupt */
+		interrupt-names = "intr", "msi";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0>;
+		interrupt-map = <0 0 0 0 &gic 0 45 0x04>;
+
+		nvidia,bpmp = <&bpmp>;
+
+		nvidia,max-speed = <4>;
+		nvidia,disable-aspm-states = <0xf>;
+		nvidia,controller-id = <&bpmp 0x1>;
+		nvidia,aspm-cmrt = <0x3C>;
+		nvidia,aspm-pwr-on-t = <0x14>;
+		nvidia,aspm-l0s-entrance-latency = <0x3>;
+
+		bus-range = <0x0 0xff>;
+		ranges = <0x81000000 0x0 0x30100000 0x0 0x30100000 0x0 0x00100000    /* downstream I/O (1MB) */
+			  0xc2000000 0x12 0x00000000 0x12 0x00000000 0x0 0x30000000  /* prefetchable memory (768MB) */
+			  0x82000000 0x0 0x40000000 0x12 0x30000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+
+		nvidia,event-cntr-ctrl = <0x1a8>;
+		nvidia,event-cntr-data = <0x1ac>;
+	};
+
+	pcie@14120000 {
+		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
+		reg = <0x00 0x14120000 0x0 0x00020000   /* appl registers (128K)      */
+		       0x00 0x32000000 0x0 0x02000000   /* window1 (32M)              */
+		       0x00 0x32000000 0x0 0x00040000   /* configuration space (256K) */
+		       0x00 0x32040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
+		       0x00 0x32080000 0x0 0x00040000   /* DBI reg space (256K)       */
+		       0x12 0x40000000 0x0 0x40000000>; /* window2 (1G)               */
+		reg-names = "appl", "window1", "config", "atu_dma", "dbi", "window2";
+
+		status = "disabled";
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		num-lanes = <1>;
+		num-viewport = <8>;
+		linux,pci-domain = <2>;
+
+		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_2>;
+		clock-names = "core_clk";
+
+		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_2_APB>,
+			 <&bpmp TEGRA194_RESET_PEX0_CORE_2>;
+		reset-names = "core_apb_rst", "core_rst";
+
+		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,	/* controller interrupt */
+			     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;	/* MSI interrupt */
+		interrupt-names = "intr", "msi";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0>;
+		interrupt-map = <0 0 0 0 &gic 0 47 0x04>;
+
+		nvidia,bpmp = <&bpmp>;
+
+		nvidia,max-speed = <4>;
+		nvidia,disable-aspm-states = <0xf>;
+		nvidia,controller-id = <&bpmp 0x2>;
+		nvidia,aspm-cmrt = <0x3C>;
+		nvidia,aspm-pwr-on-t = <0x14>;
+		nvidia,aspm-l0s-entrance-latency = <0x3>;
+
+		bus-range = <0x0 0xff>;
+		ranges = <0x81000000 0x0 0x32100000 0x0 0x32100000 0x0 0x00100000    /* downstream I/O (1MB) */
+			  0xc2000000 0x12 0x40000000 0x12 0x40000000 0x0 0x30000000  /* prefetchable memory (768MB) */
+			  0x82000000 0x0 0x40000000 0x12 0x70000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+
+		nvidia,event-cntr-ctrl = <0x1a8>;
+		nvidia,event-cntr-data = <0x1ac>;
+	};
+
+	pcie@14140000 {
+		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
+		reg = <0x00 0x14140000 0x0 0x00020000   /* appl registers (128K)      */
+		       0x00 0x34000000 0x0 0x02000000   /* window1 (32M)              */
+		       0x00 0x34000000 0x0 0x00040000   /* configuration space (256K) */
+		       0x00 0x34040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
+		       0x00 0x34080000 0x0 0x00040000   /* DBI reg space (256K)       */
+		       0x12 0x80000000 0x0 0x40000000>; /* window2 (1G)               */
+		reg-names = "appl", "window1", "config", "atu_dma", "dbi", "window2";
+
+		status = "disabled";
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		num-lanes = <1>;
+		num-viewport = <8>;
+		linux,pci-domain = <3>;
+
+		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_3>;
+		clock-names = "core_clk";
+
+		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_3_APB>,
+			 <&bpmp TEGRA194_RESET_PEX0_CORE_3>;
+		reset-names = "core_apb_rst", "core_rst";
+
+		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,	/* controller interrupt */
+			     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;	/* MSI interrupt */
+		interrupt-names = "intr", "msi";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0>;
+		interrupt-map = <0 0 0 0 &gic 0 49 0x04>;
+
+		nvidia,bpmp = <&bpmp>;
+
+		nvidia,max-speed = <4>;
+		nvidia,disable-aspm-states = <0xf>;
+		nvidia,controller-id = <&bpmp 0x3>;
+		nvidia,aspm-cmrt = <0x3C>;
+		nvidia,aspm-pwr-on-t = <0x14>;
+		nvidia,aspm-l0s-entrance-latency = <0x3>;
+
+		bus-range = <0x0 0xff>;
+		ranges = <0x81000000 0x0 0x34100000 0x0 0x34100000 0x0 0x00100000    /* downstream I/O (1MB) */
+			  0xc2000000 0x12 0x80000000 0x12 0x80000000 0x0 0x30000000  /* prefetchable memory (768MB) */
+			  0x82000000 0x0 0x40000000 0x12 0xB0000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+
+		nvidia,event-cntr-ctrl = <0x1a8>;
+		nvidia,event-cntr-data = <0x1ac>;
+	};
+
+	pcie@14160000 {
+		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX4A>;
+		reg = <0x00 0x14160000 0x0 0x00020000   /* appl registers (128K)      */
+		       0x00 0x36000000 0x0 0x02000000   /* window1 (32M)              */
+		       0x00 0x36000000 0x0 0x00040000   /* configuration space (256K) */
+		       0x00 0x36040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
+		       0x00 0x36080000 0x0 0x00040000   /* DBI reg space (256K)       */
+		       0x14 0x00000000 0x4 0x00000000>; /* window2 (16G)              */
+		reg-names = "appl", "window1", "config", "atu_dma", "dbi", "window2";
+
+		status = "disabled";
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		num-lanes = <4>;
+		num-viewport = <8>;
+		linux,pci-domain = <4>;
+
+		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_4>;
+		clock-names = "core_clk";
+
+		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_4_APB>,
+			 <&bpmp TEGRA194_RESET_PEX0_CORE_4>;
+		reset-names = "core_apb_rst", "core_rst";
+
+		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,	/* controller interrupt */
+			     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;	/* MSI interrupt */
+		interrupt-names = "intr", "msi";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0>;
+		interrupt-map = <0 0 0 0 &gic 0 51 0x04>;
+
+		nvidia,bpmp = <&bpmp>;
+
+		nvidia,max-speed = <4>;
+		nvidia,disable-aspm-states = <0xf>;
+		nvidia,controller-id = <&bpmp 0x4>;
+		nvidia,aspm-cmrt = <0x3C>;
+		nvidia,aspm-pwr-on-t = <0x14>;
+		nvidia,aspm-l0s-entrance-latency = <0x3>;
+
+		bus-range = <0x0 0xff>;
+		ranges = <0x81000000 0x0 0x36100000 0x0 0x36100000 0x0 0x00100000    /* downstream I/O (1MB) */
+			  0xc2000000 0x14 0x00000000 0x14 0x00000000 0x3 0x40000000  /* prefetchable memory (13GB) */
+			  0x82000000 0x0 0x40000000 0x17 0x40000000 0x0 0xC0000000>; /* non-prefetchable memory (3GB) */
+
+		nvidia,event-cntr-ctrl = <0x1c4>;
+		nvidia,event-cntr-data = <0x1c8>;
+	};
+
+	pcie@141a0000 {
+		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8A>;
+		reg = <0x00 0x141a0000 0x0 0x00020000   /* appl registers (128K)      */
+		       0x00 0x3a000000 0x0 0x02000000   /* window1 (32M)              */
+		       0x00 0x3a000000 0x0 0x00040000   /* configuration space (256K) */
+		       0x00 0x3a040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
+		       0x00 0x3a080000 0x0 0x00040000   /* DBI reg space (256K)       */
+		       0x1c 0x00000000 0x4 0x00000000>; /* window2 (16G)              */
+		reg-names = "appl", "window1", "config", "atu_dma", "dbi", "window2";
+
+		status = "disabled";
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		num-lanes = <8>;
+		num-viewport = <8>;
+		linux,pci-domain = <5>;
+
+		clocks = <&bpmp TEGRA194_CLK_PEX1_CORE_5>,
+			<&bpmp TEGRA194_CLK_PEX1_CORE_5M>;
+		clock-names = "core_clk", "core_clk_m";
+
+		resets = <&bpmp TEGRA194_RESET_PEX1_CORE_5_APB>,
+			 <&bpmp TEGRA194_RESET_PEX1_CORE_5>;
+		reset-names = "core_apb_rst", "core_rst";
+
+		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,	/* controller interrupt */
+			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;	/* MSI interrupt */
+		interrupt-names = "intr", "msi";
+
+		nvidia,bpmp = <&bpmp>;
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0>;
+		interrupt-map = <0 0 0 0 &gic 0 53 0x04>;
+
+		nvidia,max-speed = <4>;
+		nvidia,disable-aspm-states = <0xf>;
+		nvidia,controller-id = <&bpmp 0x5>;
+		nvidia,aspm-cmrt = <0x3C>;
+		nvidia,aspm-pwr-on-t = <0x14>;
+		nvidia,aspm-l0s-entrance-latency = <0x3>;
+
+		bus-range = <0x0 0xff>;
+		ranges = <0x81000000 0x0 0x3a100000 0x0 0x3a100000 0x0 0x00100000    /* downstream I/O (1MB) */
+			  0xc2000000 0x1c 0x00000000 0x1c 0x00000000 0x3 0x40000000  /* prefetchable memory (13GB) */
+			  0x82000000 0x0 0x40000000 0x1f 0x40000000 0x0 0xC0000000>; /* non-prefetchable memory (3GB) */
+
+		nvidia,event-cntr-ctrl = <0x1d8>;
+		nvidia,event-cntr-data = <0x1dc>;
+	};
 };
-- 
2.7.4
