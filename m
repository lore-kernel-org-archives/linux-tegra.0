From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/4] ARM: tegra: add APB DMA controller to Tegra124 DT
Date: Mon, 25 Nov 2013 15:39:18 -0700
Message-ID: <1385419160-11511-2-git-send-email-swarren@wwwdotorg.org>
References: <1385419160-11511-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385419160-11511-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Instantiate the APB DMA controller in the Tegra124 DT, and add all
DMA-related properties to other DT nodes that rely on (reference) the
DMA controller's node.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 51 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 4ed6a3a8e2de..9a8b5b8d8397 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -56,6 +56,47 @@
 		interrupt-controller;
 	};
 
+	apbdma: dma@60020000 {
+		compatible = "nvidia,tegra124-apbdma", "nvidia,tegra148-apbdma";
+		reg = <0x60020000 0x1400>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA124_CLK_APBDMA>;
+		resets = <&tegra_car 34>;
+		reset-names = "dma";
+		#dma-cells = <1>;
+	};
+
 	/*
 	 * There are two serial driver i.e. 8250 based simple serial
 	 * driver and APB DMA based serial driver for higher baudrate
@@ -72,6 +113,8 @@
 		clocks = <&tegra_car TEGRA124_CLK_UARTA>;
 		resets = <&tegra_car 6>;
 		reset-names = "serial";
+		dmas = <&apbdma 8>, <&apbdma 8>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -83,6 +126,8 @@
 		clocks = <&tegra_car TEGRA124_CLK_UARTB>;
 		resets = <&tegra_car 7>;
 		reset-names = "serial";
+		dmas = <&apbdma 9>, <&apbdma 9>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -94,6 +139,8 @@
 		clocks = <&tegra_car TEGRA124_CLK_UARTC>;
 		resets = <&tegra_car 55>;
 		reset-names = "serial";
+		dmas = <&apbdma 10>, <&apbdma 10>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -105,6 +152,8 @@
 		clocks = <&tegra_car TEGRA124_CLK_UARTD>;
 		resets = <&tegra_car 65>;
 		reset-names = "serial";
+		dmas = <&apbdma 19>, <&apbdma 19>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
@@ -116,6 +165,8 @@
 		clocks = <&tegra_car TEGRA124_CLK_UARTE>;
 		resets = <&tegra_car 66>;
 		reset-names = "serial";
+		dmas = <&apbdma 20>, <&apbdma 20>;
+		dma-names = "rx", "tx";
 		status = "disabled";
 	};
 
-- 
1.8.1.5
