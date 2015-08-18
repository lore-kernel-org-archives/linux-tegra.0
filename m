From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 4/7] DMA: tegra-apb: Add a function table for functions dealing with registers
Date: Tue, 18 Aug 2015 14:49:12 +0100
Message-ID: <1439905755-25150-5-git-send-email-jonathanh@nvidia.com>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

In preparation for adding the Tegra210 ADMA driver, add a function table
for calling functions that access hardware registers. This way code that
is common between the Tegra20-APB DMA and Tegra210 DMA driver can be moved
into a separate source file and used by both DMA drivers.

Note that all function pointers in the table are compulsory and so no
checking that the function pointer is valid is performed.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c | 92 +++++++++++++++++++++++++++++++++----------
 1 file changed, 71 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index c1eb25075756..7947acdf23db 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -209,6 +209,33 @@ struct tegra_dma_channel {
 	struct tegra_dma_channel_regs	channel_reg;
 };
 
+struct tegra_dma_ops {
+	u32 (*get_xfer_count)(struct tegra_dma_channel *tdc);
+	int (*get_xfer_params_cyclic)(struct tegra_dma_channel *tdc,
+				      struct tegra_dma_sg_req *sg_req,
+				      enum dma_transfer_direction direction,
+				      unsigned int flags);
+	int (*get_xfer_params_sg)(struct tegra_dma_channel *tdc,
+				  struct tegra_dma_sg_req *sg_req,
+				  enum dma_transfer_direction direction,
+				  unsigned int flags);
+	u32 (*irq_clear)(struct tegra_dma_channel *tdc);
+	u32 (*irq_status)(struct tegra_dma_channel *tdc);
+	void (*pause)(struct tegra_dma_channel *tdc,
+		      bool wait_for_burst_complete);
+	void (*program)(struct tegra_dma_channel *tdc,
+			struct tegra_dma_sg_req *sg_req);
+	void (*resume)(struct tegra_dma_channel *tdc);
+	void (*set_xfer_params)(struct tegra_dma_channel *tdc,
+				struct tegra_dma_sg_req *sg_req,
+				struct tegra_dma_sg_req *sg_base,
+				enum dma_transfer_direction direction,
+				u32 mem, u32 len);
+	void (*start)(struct tegra_dma_channel *tdc,
+		      struct tegra_dma_sg_req *sg_req);
+	void (*stop)(struct tegra_dma_channel *tdc);
+};
+
 /* tegra_dma: Tegra DMA specific information */
 struct tegra_dma {
 	struct dma_device		dma_dev;
@@ -218,6 +245,7 @@ struct tegra_dma {
 	spinlock_t			global_lock;
 	void __iomem			*base_addr;
 	const struct tegra_dma_chip_data *chip_data;
+	const struct tegra_dma_ops	*ops;
 
 	/*
 	 * Counter for managing global pausing of the DMA controller.
@@ -504,6 +532,7 @@ static void tegra_dma_start(struct tegra_dma_channel *tdc,
 static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,
 		struct tegra_dma_sg_req *nsg_req)
 {
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
 	unsigned long status;
 
 	/*
@@ -517,8 +546,8 @@ static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,
 	 * If there is already IEC status then interrupt handler need to
 	 * load new configuration.
 	 */
-	tegra_dma_pause(tdc, false);
-	status = tegra_dma_irq_status(tdc);
+	ops->pause(tdc, false);
+	status = ops->irq_status(tdc);
 
 	/*
 	 * If interrupt is pending then do nothing as the ISR will handle
@@ -527,17 +556,18 @@ static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,
 	if (status) {
 		dev_err(tdc2dev(tdc),
 			"Skipping new configuration as interrupt is pending\n");
-		tegra_dma_resume(tdc);
+		ops->resume(tdc);
 		return;
 	}
 
 	/* Safe to program new configuration */
-	tegra_dma_program(tdc, nsg_req);
-	tegra_dma_resume(tdc);
+	ops->program(tdc, nsg_req);
+	ops->resume(tdc);
 }
 
 static void tdc_start_head_req(struct tegra_dma_channel *tdc)
 {
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
 	struct tegra_dma_sg_req *sg_req;
 
 	if (list_empty(&tdc->pending_sg_req))
@@ -545,7 +575,7 @@ static void tdc_start_head_req(struct tegra_dma_channel *tdc)
 
 	sg_req = list_first_entry(&tdc->pending_sg_req,
 					typeof(*sg_req), node);
-	tegra_dma_start(tdc, sg_req);
+	ops->start(tdc, sg_req);
 	sg_req->configured = true;
 	tdc->busy = true;
 }
@@ -599,11 +629,12 @@ static void tegra_dma_abort_all(struct tegra_dma_channel *tdc)
 static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
 		struct tegra_dma_sg_req *last_sg_req, bool to_terminate)
 {
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
 	struct tegra_dma_sg_req *hsgreq = NULL;
 
 	if (list_empty(&tdc->pending_sg_req)) {
 		dev_err(tdc2dev(tdc), "Dma is running without req\n");
-		tegra_dma_stop(tdc);
+		ops->stop(tdc);
 		return false;
 	}
 
@@ -614,7 +645,7 @@ static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
 	 */
 	hsgreq = list_first_entry(&tdc->pending_sg_req, typeof(*hsgreq), node);
 	if (!hsgreq->configured) {
-		tegra_dma_stop(tdc);
+		ops->stop(tdc);
 		dev_err(tdc2dev(tdc), "Error in dma transfer, aborting dma\n");
 		tegra_dma_abort_all(tdc);
 		return false;
@@ -710,12 +741,13 @@ static void tegra_dma_tasklet(unsigned long data)
 static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 {
 	struct tegra_dma_channel *tdc = dev_id;
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
 	unsigned long status;
 	unsigned long flags;
 
 	spin_lock_irqsave(&tdc->lock, flags);
 
-	status = tegra_dma_irq_clear(tdc);
+	status = ops->irq_clear(tdc);
 	if (status) {
 		tdc->isr_handler(tdc, false);
 		tasklet_schedule(&tdc->tasklet);
@@ -774,6 +806,7 @@ end:
 static int tegra_dma_terminate_all(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
 	struct tegra_dma_sg_req *sgreq;
 	struct tegra_dma_desc *dma_desc;
 	unsigned long flags;
@@ -791,18 +824,18 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 		goto skip_dma_stop;
 
 	/* Pause DMA before checking the queue status */
-	tegra_dma_pause(tdc, true);
+	ops->pause(tdc, true);
 
-	status = tegra_dma_irq_status(tdc);
+	status = ops->irq_status(tdc);
 	if (status) {
 		dev_dbg(tdc2dev(tdc), "%s():handling isr\n", __func__);
 		tdc->isr_handler(tdc, true);
 	}
 
-	wcount = tegra_dma_get_xfer_count(tdc);
+	wcount = ops->get_xfer_count(tdc);
 
 	was_busy = tdc->busy;
-	tegra_dma_stop(tdc);
+	ops->stop(tdc);
 
 	if (!list_empty(&tdc->pending_sg_req) && was_busy) {
 		sgreq = list_first_entry(&tdc->pending_sg_req,
@@ -810,7 +843,7 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 		sgreq->dma_desc->bytes_transferred +=
 				get_current_xferred_count(sgreq, wcount);
 	}
-	tegra_dma_resume(tdc);
+	ops->resume(tdc);
 
 skip_dma_stop:
 	tegra_dma_abort_all(tdc);
@@ -1036,6 +1069,7 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 	void *context)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
 	struct tegra_dma_desc *dma_desc;
 	unsigned int i;
 	struct scatterlist *sg;
@@ -1051,7 +1085,7 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 		return NULL;
 	}
 
-	if (tegra_dma_get_xfer_params_sg(tdc, &sg_base, direction, flags) < 0)
+	if (ops->get_xfer_params_sg(tdc, &sg_base, direction, flags) < 0)
 		return NULL;
 
 	INIT_LIST_HEAD(&req_list);
@@ -1092,8 +1126,8 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 
 		dma_desc->bytes_requested += len;
 
-		tegra_dma_set_xfer_params(tdc, sg_req, &sg_base, direction,
-					  mem, len);
+		ops->set_xfer_params(tdc, sg_req, &sg_base, direction, mem,
+				     len);
 		sg_req->dma_desc = dma_desc;
 
 		list_add_tail(&sg_req->node, &dma_desc->tx_list);
@@ -1126,6 +1160,7 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 	unsigned long flags)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
 	struct tegra_dma_desc *dma_desc = NULL;
 	struct tegra_dma_sg_req sg_base, *sg_req = NULL;
 	int len;
@@ -1169,8 +1204,7 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	if (tegra_dma_get_xfer_params_cyclic(tdc, &sg_base, direction,
-					     flags) < 0)
+	if (ops->get_xfer_params_cyclic(tdc, &sg_base, direction, flags) < 0)
 		return NULL;
 
 	dma_desc = tegra_dma_desc_get(tdc);
@@ -1196,8 +1230,8 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 			return NULL;
 		}
 
-		tegra_dma_set_xfer_params(tdc, sg_req, &sg_base, direction,
-					  mem, len);
+		ops->set_xfer_params(tdc, sg_req, &sg_base, direction, mem,
+				     len);
 		sg_req->dma_desc = dma_desc;
 
 		list_add_tail(&sg_req->node, &dma_desc->tx_list);
@@ -1354,6 +1388,20 @@ static const struct of_device_id tegra_dma_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_dma_of_match);
 
+static const struct tegra_dma_ops tegra_apb_ops = {
+	.get_xfer_count		= tegra_dma_get_xfer_count,
+	.get_xfer_params_cyclic	= tegra_dma_get_xfer_params_cyclic,
+	.get_xfer_params_sg	= tegra_dma_get_xfer_params_sg,
+	.irq_clear		= tegra_dma_irq_clear,
+	.irq_status		= tegra_dma_irq_status,
+	.pause			= tegra_dma_pause,
+	.program		= tegra_dma_program,
+	.resume			= tegra_dma_resume,
+	.set_xfer_params	= tegra_dma_set_xfer_params,
+	.start			= tegra_dma_start,
+	.stop			= tegra_dma_stop,
+};
+
 static int tegra_dma_probe(struct platform_device *pdev)
 {
 	struct resource	*res;
@@ -1495,6 +1543,8 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
 	tdma->dma_dev.device_issue_pending = tegra_dma_issue_pending;
 
+	tdma->ops = &tegra_apb_ops;
+
 	ret = dma_async_device_register(&tdma->dma_dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev,
-- 
2.1.4
