From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/3] dt-bindings: Add DT binding for NVIDIA Tegra AHB DMA controller
Date: Wed,  4 Oct 2017 02:58:01 +0300
Message-ID: <ecf2e8248dc7b88e5fd04bebe8071027f538a40d.1507073384.git.digetx@gmail.com>
References: <cover.1507073384.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1507073384.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1507073384.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1507073384.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Document DT binding for the NVIDIA Tegra AHB DMA controller that presents
on Tegra20/30 SoC's.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/dma/nvidia,tegra20-ahbdma.txt         | 23 +++++++++
 include/dt-bindings/dma/tegra-ahb-dma.h            | 56 ++++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
 create mode 100644 include/dt-bindings/dma/tegra-ahb-dma.h

diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
new file mode 100644
index 000000000000..9fa393766930
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
@@ -0,0 +1,23 @@
+* NVIDIA Tegra AHB DMA controller
+
+Required properties:
+- compatible:	Must be "nvidia,tegra20-ahbdma"
+- reg:		Must contain registers base address and length.
+- interrupts:	Must contain one entry, DMA controller interrupt.
+- clocks:	Must contain one entry, DMA controller clock.
+- resets :	Must contain one entry, DMA controller reset.
+- #dma-cells:	Must be <1>. The cell represents DMA request select value
+		for the peripheral. For more details consult the Tegra TRM
+		documentation, in particular REQ_SEL field of the AHB DMA
+		channel control register.
+
+Example:
+
+ahbdma: ahbdma@60008000  {
+	compatible = "nvidia,tegra20-ahbdma";
+	reg = <0x60008000 0x2000>;
+	interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&tegra_car TEGRA20_CLK_AHBDMA>;
+	resets = <&tegra_car 33>;
+	#dma-cells = <1>;
+};
diff --git a/include/dt-bindings/dma/tegra-ahb-dma.h b/include/dt-bindings/dma/tegra-ahb-dma.h
new file mode 100644
index 000000000000..7eb4fb86e0d2
--- /dev/null
+++ b/include/dt-bindings/dma/tegra-ahb-dma.h
@@ -0,0 +1,56 @@
+/*
+ * Copyright 2017 Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __DT_BINDINGS_TEGRA_AHBDMA_H
+#define __DT_BINDINGS_TEGRA_AHBDMA_H
+
+#define TEGRA_AHBDMA_TRIG_HRQ2_XRQ_C	2
+#define TEGRA_AHBDMA_TRIG_HRQ2_XRQ_D	3
+#define TEGRA_AHBDMA_TRIG_HRQ4_N_A	4
+#define TEGRA_AHBDMA_TRIG_HRQ5_N_A	5
+#define TEGRA_AHBDMA_TRIG_HRQ6_TMR1	6
+#define TEGRA_AHBDMA_TRIG_HRQ7_TMR2	7
+#define TEGRA_AHBDMA_TRIG_AHB_DMA_0	8
+#define TEGRA_AHBDMA_TRIG_AHB_DMA_1	9
+#define TEGRA_AHBDMA_TRIG_AHB_DMA_2	10
+#define TEGRA_AHBDMA_TRIG_AHB_DMA_3	11
+#define TEGRA_AHBDMA_TRIG_SMP_28	12
+#define TEGRA_AHBDMA_TRIG_SMP_29	13
+#define TEGRA_AHBDMA_TRIG_SMP_30	14
+#define TEGRA_AHBDMA_TRIG_SMP_31	15
+
+#define TEGRA_AHBDMA_TRIG_N_A		16
+
+#define TEGRA_AHBDMA_REQ_CNTR_REQ	0
+#define TEGRA_AHBDMA_REQ_SMP_17		1
+#define TEGRA_AHBDMA_REQ_SMP_18		2
+#define TEGRA_AHBDMA_REQ_SMP_19		3
+#define TEGRA_AHBDMA_REQ_SMP_20		4
+#define TEGRA_AHBDMA_REQ_SMP_21		5
+#define TEGRA_AHBDMA_REQ_SMP_22		6
+#define TEGRA_AHBDMA_REQ_SMP_23		7
+#define TEGRA_AHBDMA_REQ_SMP_24		8
+#define TEGRA_AHBDMA_REQ_SMP_25		9
+#define TEGRA_AHBDMA_REQ_SMP_26		10
+#define TEGRA_AHBDMA_REQ_HOST1X		11
+#define TEGRA_AHBDMA_REQ_SRQ0_N_A	12
+#define TEGRA_AHBDMA_REQ_SRQ1_N_A	13
+#define TEGRA_AHBDMA_REQ_SRQ0_XRQ_A	14
+#define TEGRA_AHBDMA_REQ_SRQ1_XRQ_B	15
+
+#define TEGRA_AHBDMA_REQ_N_A		16
+
+#endif /* __DT_BINDINGS_TEGRA_AHBDMA_H */
-- 
2.14.1
