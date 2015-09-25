From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] Documentation: DT: Add binding documentation for NVIDIA ADMA
Date: Fri, 25 Sep 2015 15:56:39 +0100
Message-ID: <1443193000-457-3-git-send-email-jonathanh@nvidia.com>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443193000-457-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add device-tree binding documentation for the Tegra210 Audio DMA
controller.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/dma/tegra210-adma.txt      | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/tegra210-adma.txt

diff --git a/Documentation/devicetree/bindings/dma/tegra210-adma.txt b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
new file mode 100644
index 000000000000..af04b3c5a557
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
@@ -0,0 +1,47 @@
+* NVIDIA Tegra Audio DMA controller
+
+Required properties:
+- compatible: Should be "nvidia,<chip>-adma"
+- reg: Should contain DMA registers location and length. This should include
+  all of the per-channel registers.
+- interrupt-parent: Phandle to the interrupt parent controller.
+- interrupts: Should contain all of the per-channel DMA interrupts.
+- clocks: Must contain two entries, one for the power-domain clock and one
+  for the module clock. See ../clocks/clock-bindings.txt for details.
+- dma-channels: Number of DMA channels supported by the controller.
+- #dma-cells : Must be <0>.
+
+Examples:
+
+adma: adma@702e2000 {
+	compatible = "nvidia,tegra210-adma";
+	reg = <0x0 0x702e2000 0x0 0x2000>;
+	interrupt-parent = <&tegra_agic>;
+	interrupts = <GIC_SPI INT_ADMA_EOT0 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT1 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT2 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT3 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT4 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT5 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT6 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT7 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT8 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT9 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT10 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT11 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT12 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT13 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT14 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT15 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT16 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT17 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT18 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT19 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT20 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI INT_ADMA_EOT21 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>,
+		 <&tegra_car TEGRA210_CLK_ADMA_APE>;
+	clock-names = "adma", "adma.ape";
+	dma-channels = <22>;
+	#dma-cells = <0>;
+};
-- 
2.1.4
