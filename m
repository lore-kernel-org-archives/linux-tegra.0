From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] dmaengine: tegra-apb: Handle DMA_PREP_INTERRUPT flag properly
Date: Sun,  5 May 2019 21:12:35 +0300
Message-ID: <20190505181235.14798-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The DMA_PREP_INTERRUPT flag means that descriptor's callback should be
invoked upon transfer completion and that's it. For some reason driver
completely disables the hardware interrupt handling, leaving channel in
unusable state if transfer is issued with the flag being unset. Note
that there are no occurrences in the relevant drivers that do not set
the flag, hence this patch doesn't fix any actual bug and merely fixes
potential problem.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 41 ++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index cf462b1abc0b..29d972b7546f 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -561,6 +561,9 @@ static void tegra_dma_abort_all(struct tegra_dma_channel *tdc)
 			dma_desc->dma_status = DMA_ERROR;
 			list_add_tail(&dma_desc->node, &tdc->free_dma_desc);
 
+			if (dma_desc->cb_count < 0)
+				continue;
+
 			/* Add in cb list if it is not there. */
 			if (!dma_desc->cb_count)
 				list_add_tail(&dma_desc->cb_node,
@@ -616,9 +619,13 @@ static void handle_once_dma_done(struct tegra_dma_channel *tdc,
 	if (sgreq->last_sg) {
 		dma_desc->dma_status = DMA_COMPLETE;
 		dma_cookie_complete(&dma_desc->txd);
-		if (!dma_desc->cb_count)
-			list_add_tail(&dma_desc->cb_node, &tdc->cb_desc);
-		dma_desc->cb_count++;
+		if (dma_desc->cb_count >= 0) {
+			if (!dma_desc->cb_count)
+				list_add_tail(&dma_desc->cb_node,
+					      &tdc->cb_desc);
+
+			dma_desc->cb_count++;
+		}
 		list_add_tail(&dma_desc->node, &tdc->free_dma_desc);
 	}
 	list_add_tail(&sgreq->node, &tdc->free_sg_req);
@@ -645,9 +652,11 @@ static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
 		dma_desc->bytes_requested;
 
 	/* Callback need to be call */
-	if (!dma_desc->cb_count)
-		list_add_tail(&dma_desc->cb_node, &tdc->cb_desc);
-	dma_desc->cb_count++;
+	if (dma_desc->cb_count >= 0) {
+		if (!dma_desc->cb_count)
+			list_add_tail(&dma_desc->cb_node, &tdc->cb_desc);
+		dma_desc->cb_count++;
+	}
 
 	/* If not last req then put at end of pending list */
 	if (!list_is_last(&sgreq->node, &tdc->pending_sg_req)) {
@@ -802,7 +811,7 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 		dma_desc  = list_first_entry(&tdc->cb_desc,
 					typeof(*dma_desc), cb_node);
 		list_del(&dma_desc->cb_node);
-		dma_desc->cb_count = 0;
+		dma_desc->cb_count = -1;
 	}
 	spin_unlock_irqrestore(&tdc->lock, flags);
 	return 0;
@@ -988,8 +997,7 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 		csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
-		csr |= TEGRA_APBDMA_CSR_IE_EOC;
+	csr |= TEGRA_APBDMA_CSR_IE_EOC;
 
 	apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
 
@@ -1000,11 +1008,15 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 	}
 	INIT_LIST_HEAD(&dma_desc->tx_list);
 	INIT_LIST_HEAD(&dma_desc->cb_node);
-	dma_desc->cb_count = 0;
 	dma_desc->bytes_requested = 0;
 	dma_desc->bytes_transferred = 0;
 	dma_desc->dma_status = DMA_IN_PROGRESS;
 
+	if (flags & DMA_PREP_INTERRUPT)
+		dma_desc->cb_count = 0;
+	else
+		dma_desc->cb_count = -1;
+
 	/* Make transfer requests */
 	for_each_sg(sgl, sg, sg_len, i) {
 		u32 len, mem;
@@ -1131,8 +1143,7 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 		csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
-		csr |= TEGRA_APBDMA_CSR_IE_EOC;
+	csr |= TEGRA_APBDMA_CSR_IE_EOC;
 
 	apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
 
@@ -1144,7 +1155,11 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 
 	INIT_LIST_HEAD(&dma_desc->tx_list);
 	INIT_LIST_HEAD(&dma_desc->cb_node);
-	dma_desc->cb_count = 0;
+
+	if (flags & DMA_PREP_INTERRUPT)
+		dma_desc->cb_count = 0;
+	else
+		dma_desc->cb_count = -1;
 
 	dma_desc->bytes_transferred = 0;
 	dma_desc->bytes_requested = buf_len;
-- 
2.21.0
