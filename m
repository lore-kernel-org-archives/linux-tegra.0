From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dmaengine: tegra-apb: Support non-flow controlled slave configuration
Date: Wed,  4 Oct 2017 01:38:38 +0300
Message-ID: <20171003223838.31834-1-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This allows DMA client to issue a non-flow controlled TX. In particular
it is needed for the fuse driver that reads fuse registers using APBDMA
to workaround a HW bug that results in hang when CPU and DMA perform
simultaneous access to fuse peripheral.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index b9d75a54c896..a177039713a7 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -353,7 +353,8 @@ static int tegra_dma_slave_config(struct dma_chan *dc,
 	}
 
 	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
-	if (tdc->slave_id == TEGRA_APBDMA_SLAVE_ID_INVALID) {
+	if (tdc->slave_id == TEGRA_APBDMA_SLAVE_ID_INVALID &&
+	    sconfig->device_fc) {
 		if (sconfig->slave_id > TEGRA_APBDMA_CSR_REQ_SEL_MASK)
 			return -EINVAL;
 		tdc->slave_id = sconfig->slave_id;
@@ -970,8 +971,13 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 					TEGRA_APBDMA_AHBSEQ_WRAP_SHIFT;
 	ahb_seq |= TEGRA_APBDMA_AHBSEQ_BUS_WIDTH_32;
 
-	csr |= TEGRA_APBDMA_CSR_ONCE | TEGRA_APBDMA_CSR_FLOW;
-	csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
+	csr |= TEGRA_APBDMA_CSR_ONCE ;
+
+	if (tdc->slave_id != TEGRA_APBDMA_SLAVE_ID_INVALID) {
+		csr |= TEGRA_APBDMA_CSR_FLOW;
+		csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
+	}
+
 	if (flags & DMA_PREP_INTERRUPT)
 		csr |= TEGRA_APBDMA_CSR_IE_EOC;
 
@@ -1110,10 +1116,13 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 					TEGRA_APBDMA_AHBSEQ_WRAP_SHIFT;
 	ahb_seq |= TEGRA_APBDMA_AHBSEQ_BUS_WIDTH_32;
 
-	csr |= TEGRA_APBDMA_CSR_FLOW;
+	if (tdc->slave_id != TEGRA_APBDMA_SLAVE_ID_INVALID) {
+		csr |= TEGRA_APBDMA_CSR_FLOW;
+		csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
+	}
+
 	if (flags & DMA_PREP_INTERRUPT)
 		csr |= TEGRA_APBDMA_CSR_IE_EOC;
-	csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
 
 	apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
 
-- 
2.14.1
