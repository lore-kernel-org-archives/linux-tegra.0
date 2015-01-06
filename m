From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dmaengine: tegra: add slave capabilities reporting
Date: Tue, 6 Jan 2015 06:44:56 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1501060640220.28771@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


After commit ecc19d17868be9c9f8f00ed928791533c420f3e0 ("dmaengine: Add
a warning for drivers not using the generic slave caps retrieval"),
the Tegra APB DMA driver causes this warning during boot:

WARNING: CPU: 0 PID: 1 at drivers/dma/dmaengine.c:830 dma_async_device_register+0x294/0x538()
this driver doesn't support generic slave capabilities reporting

Fix by setting the appropriate reporting structure fields that are
passed to dma_async_device_register().

Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Applies on next-20150105.  Boot-tested on Tegra132 Norrin FFD
(with a few unrelated patches not yet in mainline to get the board to 
boot)

 drivers/dma/tegra20-apb-dma.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 5695fb8..eaf585e 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1425,6 +1425,21 @@ static int tegra_dma_probe(struct platform_device *pdev)
 					tegra_dma_free_chan_resources;
 	tdma->dma_dev.device_prep_slave_sg = tegra_dma_prep_slave_sg;
 	tdma->dma_dev.device_prep_dma_cyclic = tegra_dma_prep_dma_cyclic;
+	tdma->dma_dev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+		BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+		BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
+		BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
+	tdma->dma_dev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+		BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+		BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
+		BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
+	tdma->dma_dev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
+	/*
+	 * XXX The hardware appears to support
+	 * DMA_RESIDUE_GRANULARITY_BURST-level reporting, but it's
+	 * only used by this driver during tegra_dma_terminate_all()
+	 */
+	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
 	tdma->dma_dev.device_config = tegra_dma_slave_config;
 	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
 	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
-- 
2.0.0.GIT
