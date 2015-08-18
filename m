From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 6/7] Documentation: DT: Add binding documentation for NVIDIA ADMA
Date: Tue, 18 Aug 2015 14:49:14 +0100
Message-ID: <1439905755-25150-7-git-send-email-jonathanh@nvidia.com>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439905755-25150-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add device-tree binding documentation for the Tegra210 Audio DMA
controller.

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/dma/tegra210-adma.txt      | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/tegra210-adma.txt

diff --git a/Documentation/devicetree/bindings/dma/tegra210-adma.txt b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
new file mode 100644
index 000000000000..38310d7e7e77
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
@@ -0,0 +1,49 @@
+* NVIDIA Tegra Audio DMA controller
+
+Required properties:
+- compatible: Should be "nvidia,<chip>-adma"
+- reg: Should contain DMA registers location and length. This should include
+  all of the per-channel registers.
+- interrupt-parent: Phandle to the interrupt parent controller.
+- interrupts: Should contain all of the per-channel DMA interrupts.
+- clocks: Must contain two entries, one for the power-domain clock and one
+  for the module clock.
+  See ../clocks/clock-bindings.txt for details.
+- #dma-cells : Must be <1>. This dictates the length of DMA specifiers in
+  client nodes' dmas properties. The specifier represents the DMA request
+  select value for the peripheral. For more details, consult the Tegra TRM's
+  documentation of the APB DMA channel control register REQ_SEL field.
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
+	#dma-cells = <1>;
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
