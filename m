From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V5 1/3] Documentation: DT: Add binding documentation for NVIDIA ADMA
Date: Fri, 29 Apr 2016 15:39:16 +0100
Message-ID: <1461940758-25722-2-git-send-email-jonathanh@nvidia.com>
References: <1461940758-25722-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461940758-25722-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add device-tree binding documentation for the Tegra210 Audio DMA
controller.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/dma/nvidia,tegra210-adma.txt          | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt

diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt
new file mode 100644
index 000000000000..ab584808bf7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt
@@ -0,0 +1,57 @@
+* NVIDIA Tegra Audio DMA (ADMA) controller
+
+The Tegra Audio DMA controller that is used for transferring data
+between system memory and the Audio Processing Engine (APE).
+
+Required properties:
+- compatible: Must be "nvidia,tegra210-adma".
+- reg: Should contain DMA registers location and length. This should be
+  a single entry that includes all of the per-channel registers in one
+  contiguous bank.
+- interrupt-parent: Phandle to the interrupt parent controller.
+- interrupts: Should contain all of the per-channel DMA interrupts in
+  ascending order with respect to the DMA channel index.
+- clocks: Must contain one entry for the ADMA module clock
+  (TEGRA210_CLK_D_AUDIO).
+- clock-names: Must contain the name "d_audio" for the corresponding
+  'clocks' entry.
+- #dma-cells : Must be 1. The first cell denotes the receive/transmit
+  request number and should be between 1 and the maximum number of
+  requests supported. This value corresponds to the RX/TX_REQUEST_SELECT
+  fields in the ADMA_CHn_CTRL register.
+- power-domains: Must contain a phandle that points to the audio
+  powergate (namely 'aud') for Tegra210.
+
+
+Example:
+
+adma: dma@702e2000 {
+	compatible = "nvidia,tegra210-adma";
+	reg = <0x0 0x702e2000 0x0 0x2000>;
+	interrupt-parent = <&tegra_agic>;
+	interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>;
+	clock-names = "d_audio";
+	#dma-cells = <1>;
+};
-- 
2.1.4
