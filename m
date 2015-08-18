From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 2/7] DMA: tegra-apb: Move code dealing with h/w registers into separate functions
Date: Tue, 18 Aug 2015 14:49:10 +0100
Message-ID: <1439905755-25150-3-git-send-email-jonathanh@nvidia.com>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439905755-25150-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In preparation for adding the Tegra210 ADMA driver, that is based upon the
Tegra20-APB DMA driver, move code that accesses hardware registers into
specific functions. The Tegra210 ADMA and Tegra20-APB DMA drivers are not
compatible from a hardware register perspective, but the drivers are very
much the same. Hence, by isolating code that deals with the hardware
registers it will then be possible to add a function table to call code
that accesses the hardware registers and re-use the common driver code
for both DMAs.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 277 ++++++++++++++++++++++++++----------------
 1 file changed, 170 insertions(+), 107 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 097432ea89fa..e552a4efef71 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -359,6 +359,18 @@ static int tegra_dma_slave_config(struct dma_chan *dc,
 	return 0;
 }
 
+static u32 tegra_dma_get_xfer_count(struct tegra_dma_channel *tdc)
+{
+	u32 wcount;
+
+	if (tdc->tdma->chip_data->support_separate_wcount_reg)
+		wcount = tdc_read(tdc, TEGRA_APBDMA_CHAN_WORD_TRANSFER);
+	else
+		wcount = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
+
+	return (wcount & TEGRA_APBDMA_STATUS_COUNT_MASK) - 4;
+}
+
 static void tegra_dma_global_pause(struct tegra_dma_channel *tdc,
 	bool wait_for_burst_complete)
 {
@@ -394,6 +406,38 @@ out:
 	spin_unlock(&tdma->global_lock);
 }
 
+static u32 tegra_dma_irq_status(struct tegra_dma_channel *tdc)
+{
+	u32 status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
+
+	return status & TEGRA_APBDMA_STATUS_ISE_EOC;
+}
+
+static u32 tegra_dma_irq_clear(struct tegra_dma_channel *tdc)
+{
+	u32 status = tegra_dma_irq_status(tdc);
+
+	if (status) {
+		dev_dbg(tdc2dev(tdc), "%s():clearing interrupt\n", __func__);
+		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
+	}
+
+	return status;
+}
+
+static void tegra_dma_program(struct tegra_dma_channel *tdc,
+			      struct tegra_dma_sg_req *nsg_req)
+{
+	tdc_write(tdc, TEGRA_APBDMA_CHAN_APBPTR, nsg_req->ch_regs.apb_ptr);
+	tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBPTR, nsg_req->ch_regs.ahb_ptr);
+	if (tdc->tdma->chip_data->support_separate_wcount_reg)
+		tdc_write(tdc, TEGRA_APBDMA_CHAN_WCOUNT,
+			  nsg_req->ch_regs.wcount);
+	tdc_write(tdc, TEGRA_APBDMA_CHAN_CSR,
+		  nsg_req->ch_regs.csr | TEGRA_APBDMA_CSR_ENB);
+	nsg_req->configured = true;
+}
+
 static void tegra_dma_pause(struct tegra_dma_channel *tdc,
 	bool wait_for_burst_complete)
 {
@@ -423,7 +467,6 @@ static void tegra_dma_resume(struct tegra_dma_channel *tdc)
 static void tegra_dma_stop(struct tegra_dma_channel *tdc)
 {
 	u32 csr;
-	u32 status;
 
 	/* Disable interrupts */
 	csr = tdc_read(tdc, TEGRA_APBDMA_CHAN_CSR);
@@ -435,11 +478,8 @@ static void tegra_dma_stop(struct tegra_dma_channel *tdc)
 	tdc_write(tdc, TEGRA_APBDMA_CHAN_CSR, csr);
 
 	/* Clear interrupt status if it is there */
-	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
-	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
-		dev_dbg(tdc2dev(tdc), "%s():clearing interrupt\n", __func__);
-		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
-	}
+	tegra_dma_irq_clear(tdc);
+
 	tdc->busy = false;
 }
 
@@ -478,13 +518,13 @@ static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,
 	 * load new configuration.
 	 */
 	tegra_dma_pause(tdc, false);
-	status  = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
+	status = tegra_dma_irq_status(tdc);
 
 	/*
 	 * If interrupt is pending then do nothing as the ISR will handle
 	 * the programing for new request.
 	 */
-	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
+	if (status) {
 		dev_err(tdc2dev(tdc),
 			"Skipping new configuration as interrupt is pending\n");
 		tegra_dma_resume(tdc);
@@ -492,15 +532,7 @@ static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,
 	}
 
 	/* Safe to program new configuration */
-	tdc_write(tdc, TEGRA_APBDMA_CHAN_APBPTR, nsg_req->ch_regs.apb_ptr);
-	tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBPTR, nsg_req->ch_regs.ahb_ptr);
-	if (tdc->tdma->chip_data->support_separate_wcount_reg)
-		tdc_write(tdc, TEGRA_APBDMA_CHAN_WCOUNT,
-						nsg_req->ch_regs.wcount);
-	tdc_write(tdc, TEGRA_APBDMA_CHAN_CSR,
-				nsg_req->ch_regs.csr | TEGRA_APBDMA_CSR_ENB);
-	nsg_req->configured = true;
-
+	tegra_dma_program(tdc, nsg_req);
 	tegra_dma_resume(tdc);
 }
 
@@ -534,10 +566,10 @@ static void tdc_configure_next_head_desc(struct tegra_dma_channel *tdc)
 	}
 }
 
-static inline int get_current_xferred_count(struct tegra_dma_channel *tdc,
-	struct tegra_dma_sg_req *sg_req, unsigned long status)
+static inline int get_current_xferred_count(struct tegra_dma_sg_req *sg_req,
+					    unsigned long wcount)
 {
-	return sg_req->req_len - (status & TEGRA_APBDMA_STATUS_COUNT_MASK) - 4;
+	return sg_req->req_len - wcount;
 }
 
 static void tegra_dma_abort_all(struct tegra_dma_channel *tdc)
@@ -683,9 +715,8 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 
 	spin_lock_irqsave(&tdc->lock, flags);
 
-	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
-	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
-		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
+	status = tegra_dma_irq_clear(tdc);
+	if (status) {
 		tdc->isr_handler(tdc, false);
 		tasklet_schedule(&tdc->tasklet);
 		spin_unlock_irqrestore(&tdc->lock, flags);
@@ -762,16 +793,13 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 	/* Pause DMA before checking the queue status */
 	tegra_dma_pause(tdc, true);
 
-	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
-	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
+	status = tegra_dma_irq_status(tdc);
+	if (status) {
 		dev_dbg(tdc2dev(tdc), "%s():handling isr\n", __func__);
 		tdc->isr_handler(tdc, true);
-		status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
 	}
-	if (tdc->tdma->chip_data->support_separate_wcount_reg)
-		wcount = tdc_read(tdc, TEGRA_APBDMA_CHAN_WORD_TRANSFER);
-	else
-		wcount = status;
+
+	wcount = tegra_dma_get_xfer_count(tdc);
 
 	was_busy = tdc->busy;
 	tegra_dma_stop(tdc);
@@ -780,7 +808,7 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 		sgreq = list_first_entry(&tdc->pending_sg_req,
 					typeof(*sgreq), node);
 		sgreq->dma_desc->bytes_transferred +=
-				get_current_xferred_count(tdc, sgreq, wcount);
+				get_current_xferred_count(sgreq, wcount);
 	}
 	tegra_dma_resume(tdc);
 
@@ -865,11 +893,27 @@ static inline int get_bus_width(struct tegra_dma_channel *tdc,
 }
 
 static inline int get_burst_size(struct tegra_dma_channel *tdc,
-	u32 burst_size, enum dma_slave_buswidth slave_bw, int len)
+				 enum dma_transfer_direction direction,
+				 int len)
 {
+	enum dma_slave_buswidth slave_bw;
+	u32 burst_size;
 	int burst_byte;
 	int burst_ahb_width;
 
+	switch (direction) {
+	case DMA_MEM_TO_DEV:
+		burst_size = tdc->dma_sconfig.dst_maxburst;
+		slave_bw = tdc->dma_sconfig.dst_addr_width;
+		break;
+	case DMA_DEV_TO_MEM:
+		burst_size = tdc->dma_sconfig.src_maxburst;
+		slave_bw = tdc->dma_sconfig.src_addr_width;
+		break;
+	default:
+		return TEGRA_APBDMA_AHBSEQ_BURST_1;
+	}
+
 	/*
 	 * burst_size from client is in terms of the bus_width.
 	 * convert them into AHB memory width which is 4 byte.
@@ -894,29 +938,23 @@ static inline int get_burst_size(struct tegra_dma_channel *tdc,
 		return TEGRA_APBDMA_AHBSEQ_BURST_8;
 }
 
-static int get_transfer_param(struct tegra_dma_channel *tdc,
-	enum dma_transfer_direction direction, unsigned long *apb_addr,
-	unsigned long *apb_seq,	unsigned long *csr, unsigned int *burst_size,
-	enum dma_slave_buswidth *slave_bw)
+static int tegra_dma_get_xfer_params(struct tegra_dma_channel *tdc,
+				     struct tegra_dma_channel_regs *ch_regs,
+				     enum dma_transfer_direction direction)
 {
-
 	switch (direction) {
 	case DMA_MEM_TO_DEV:
-		*apb_addr = tdc->dma_sconfig.dst_addr;
-		*apb_seq = get_bus_width(tdc, tdc->dma_sconfig.dst_addr_width);
-		*burst_size = tdc->dma_sconfig.dst_maxburst;
-		*slave_bw = tdc->dma_sconfig.dst_addr_width;
-		*csr = TEGRA_APBDMA_CSR_DIR;
+		ch_regs->apb_ptr = tdc->dma_sconfig.dst_addr;
+		ch_regs->apb_seq = get_bus_width(tdc,
+					tdc->dma_sconfig.dst_addr_width);
+		ch_regs->csr = TEGRA_APBDMA_CSR_DIR;
 		return 0;
-
 	case DMA_DEV_TO_MEM:
-		*apb_addr = tdc->dma_sconfig.src_addr;
-		*apb_seq = get_bus_width(tdc, tdc->dma_sconfig.src_addr_width);
-		*burst_size = tdc->dma_sconfig.src_maxburst;
-		*slave_bw = tdc->dma_sconfig.src_addr_width;
-		*csr = 0;
+		ch_regs->apb_ptr = tdc->dma_sconfig.src_addr;
+		ch_regs->apb_seq = get_bus_width(tdc,
+					tdc->dma_sconfig.src_addr_width);
+		ch_regs->csr = 0;
 		return 0;
-
 	default:
 		dev_err(tdc2dev(tdc), "Dma direction is not supported\n");
 		return -EINVAL;
@@ -924,6 +962,60 @@ static int get_transfer_param(struct tegra_dma_channel *tdc,
 	return -EINVAL;
 }
 
+static int tegra_dma_get_xfer_params_sg(struct tegra_dma_channel *tdc,
+					struct tegra_dma_sg_req *sg_req,
+					enum dma_transfer_direction direction,
+					unsigned int flags)
+{
+	struct tegra_dma_channel_regs *ch_regs = &sg_req->ch_regs;
+	int ret;
+
+	ret = tegra_dma_get_xfer_params(tdc, ch_regs, direction);
+	if (ret < 0)
+		return ret;
+
+	ch_regs->ahb_seq = TEGRA_APBDMA_AHBSEQ_INTR_ENB;
+	ch_regs->ahb_seq |= TEGRA_APBDMA_AHBSEQ_WRAP_NONE <<
+					TEGRA_APBDMA_AHBSEQ_WRAP_SHIFT;
+	ch_regs->ahb_seq |= TEGRA_APBDMA_AHBSEQ_BUS_WIDTH_32;
+
+	ch_regs->csr |= TEGRA_APBDMA_CSR_ONCE | TEGRA_APBDMA_CSR_FLOW;
+	ch_regs->csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
+	if (flags & DMA_PREP_INTERRUPT)
+		ch_regs->csr |= TEGRA_APBDMA_CSR_IE_EOC;
+
+	ch_regs->apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
+
+	return 0;
+}
+
+static int tegra_dma_get_xfer_params_cyclic(struct tegra_dma_channel *tdc,
+					struct tegra_dma_sg_req *sg_req,
+					enum dma_transfer_direction direction,
+					unsigned int flags)
+{
+	struct tegra_dma_channel_regs *ch_regs = &sg_req->ch_regs;
+	int ret;
+
+	ret = tegra_dma_get_xfer_params(tdc, ch_regs, direction);
+	if (ret < 0)
+		return ret;
+
+	ch_regs->ahb_seq = TEGRA_APBDMA_AHBSEQ_INTR_ENB;
+	ch_regs->ahb_seq |= TEGRA_APBDMA_AHBSEQ_WRAP_NONE <<
+					TEGRA_APBDMA_AHBSEQ_WRAP_SHIFT;
+	ch_regs->ahb_seq |= TEGRA_APBDMA_AHBSEQ_BUS_WIDTH_32;
+
+	ch_regs->csr |= TEGRA_APBDMA_CSR_FLOW;
+	if (flags & DMA_PREP_INTERRUPT)
+		ch_regs->csr |= TEGRA_APBDMA_CSR_IE_EOC;
+	ch_regs->csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
+
+	ch_regs->apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
+
+	return 0;
+}
+
 static void tegra_dma_prep_wcount(struct tegra_dma_channel *tdc,
 	struct tegra_dma_channel_regs *ch_regs, u32 len)
 {
@@ -935,6 +1027,24 @@ static void tegra_dma_prep_wcount(struct tegra_dma_channel *tdc,
 		ch_regs->csr |= len_field;
 }
 
+static void tegra_dma_set_xfer_params(struct tegra_dma_channel *tdc,
+				      struct tegra_dma_sg_req *sg_req,
+				      struct tegra_dma_sg_req *sg_base,
+				      enum dma_transfer_direction direction,
+				      u32 mem, u32 len)
+{
+	sg_req->ch_regs.ahb_seq |= get_burst_size(tdc, direction, len);
+	sg_req->ch_regs.apb_ptr = sg_base->ch_regs.apb_ptr;
+	sg_req->ch_regs.ahb_ptr = mem;
+	sg_req->ch_regs.csr = sg_base->ch_regs.csr;
+	tegra_dma_prep_wcount(tdc, &sg_req->ch_regs, len);
+	sg_req->ch_regs.apb_seq = sg_base->ch_regs.apb_seq;
+	sg_req->ch_regs.ahb_seq = sg_base->ch_regs.ahb_seq;
+	sg_req->configured = false;
+	sg_req->last_sg = false;
+	sg_req->req_len = len;
+}
+
 static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 	struct dma_chan *dc, struct scatterlist *sgl, unsigned int sg_len,
 	enum dma_transfer_direction direction, unsigned long flags,
@@ -942,13 +1052,10 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	struct tegra_dma_desc *dma_desc;
-	unsigned int	    i;
-	struct scatterlist      *sg;
-	unsigned long csr, ahb_seq, apb_ptr, apb_seq;
+	unsigned int i;
+	struct scatterlist *sg;
 	struct list_head req_list;
-	struct tegra_dma_sg_req  *sg_req = NULL;
-	u32 burst_size;
-	enum dma_slave_buswidth slave_bw;
+	struct tegra_dma_sg_req sg_base, *sg_req = NULL;
 
 	if (!tdc->config_init) {
 		dev_err(tdc2dev(tdc), "dma channel is not configured\n");
@@ -959,24 +1066,11 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 		return NULL;
 	}
 
-	if (get_transfer_param(tdc, direction, &apb_ptr, &apb_seq, &csr,
-				&burst_size, &slave_bw) < 0)
+	if (tegra_dma_get_xfer_params_sg(tdc, &sg_base, direction, flags) < 0)
 		return NULL;
 
 	INIT_LIST_HEAD(&req_list);
 
-	ahb_seq = TEGRA_APBDMA_AHBSEQ_INTR_ENB;
-	ahb_seq |= TEGRA_APBDMA_AHBSEQ_WRAP_NONE <<
-					TEGRA_APBDMA_AHBSEQ_WRAP_SHIFT;
-	ahb_seq |= TEGRA_APBDMA_AHBSEQ_BUS_WIDTH_32;
-
-	csr |= TEGRA_APBDMA_CSR_ONCE | TEGRA_APBDMA_CSR_FLOW;
-	csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
-	if (flags & DMA_PREP_INTERRUPT)
-		csr |= TEGRA_APBDMA_CSR_IE_EOC;
-
-	apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
-
 	dma_desc = tegra_dma_desc_get(tdc);
 	if (!dma_desc) {
 		dev_err(tdc2dev(tdc), "Dma descriptors not available\n");
@@ -1011,19 +1105,11 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 			return NULL;
 		}
 
-		ahb_seq |= get_burst_size(tdc, burst_size, slave_bw, len);
 		dma_desc->bytes_requested += len;
 
-		sg_req->ch_regs.apb_ptr = apb_ptr;
-		sg_req->ch_regs.ahb_ptr = mem;
-		sg_req->ch_regs.csr = csr;
-		tegra_dma_prep_wcount(tdc, &sg_req->ch_regs, len);
-		sg_req->ch_regs.apb_seq = apb_seq;
-		sg_req->ch_regs.ahb_seq = ahb_seq;
-		sg_req->configured = false;
-		sg_req->last_sg = false;
+		tegra_dma_set_xfer_params(tdc, sg_req, &sg_base, direction,
+					  mem, len);
 		sg_req->dma_desc = dma_desc;
-		sg_req->req_len = len;
 
 		list_add_tail(&sg_req->node, &dma_desc->tx_list);
 	}
@@ -1056,13 +1142,10 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	struct tegra_dma_desc *dma_desc = NULL;
-	struct tegra_dma_sg_req  *sg_req = NULL;
-	unsigned long csr, ahb_seq, apb_ptr, apb_seq;
+	struct tegra_dma_sg_req sg_base, *sg_req = NULL;
 	int len;
 	size_t remain_len;
 	dma_addr_t mem = buf_addr;
-	u32 burst_size;
-	enum dma_slave_buswidth slave_bw;
 
 	if (!buf_len || !period_len) {
 		dev_err(tdc2dev(tdc), "Invalid buffer/period len\n");
@@ -1101,22 +1184,10 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	if (get_transfer_param(tdc, direction, &apb_ptr, &apb_seq, &csr,
-				&burst_size, &slave_bw) < 0)
+	if (tegra_dma_get_xfer_params_cyclic(tdc, &sg_base, direction,
+					     flags) < 0)
 		return NULL;
 
-	ahb_seq = TEGRA_APBDMA_AHBSEQ_INTR_ENB;
-	ahb_seq |= TEGRA_APBDMA_AHBSEQ_WRAP_NONE <<
-					TEGRA_APBDMA_AHBSEQ_WRAP_SHIFT;
-	ahb_seq |= TEGRA_APBDMA_AHBSEQ_BUS_WIDTH_32;
-
-	csr |= TEGRA_APBDMA_CSR_FLOW;
-	if (flags & DMA_PREP_INTERRUPT)
-		csr |= TEGRA_APBDMA_CSR_IE_EOC;
-	csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
-
-	apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
-
 	dma_desc = tegra_dma_desc_get(tdc);
 	if (!dma_desc) {
 		dev_err(tdc2dev(tdc), "not enough descriptors available\n");
@@ -1140,17 +1211,9 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 			return NULL;
 		}
 
-		ahb_seq |= get_burst_size(tdc, burst_size, slave_bw, len);
-		sg_req->ch_regs.apb_ptr = apb_ptr;
-		sg_req->ch_regs.ahb_ptr = mem;
-		sg_req->ch_regs.csr = csr;
-		tegra_dma_prep_wcount(tdc, &sg_req->ch_regs, len);
-		sg_req->ch_regs.apb_seq = apb_seq;
-		sg_req->ch_regs.ahb_seq = ahb_seq;
-		sg_req->configured = false;
-		sg_req->last_sg = false;
+		tegra_dma_set_xfer_params(tdc, sg_req, &sg_base, direction,
+					  mem, len);
 		sg_req->dma_desc = dma_desc;
-		sg_req->req_len = len;
 
 		list_add_tail(&sg_req->node, &dma_desc->tx_list);
 		remain_len -= len;
-- 
2.1.4
