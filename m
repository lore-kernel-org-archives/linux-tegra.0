From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 5/7] DMA: tegra-apb: Move common code into separate source files
Date: Tue, 18 Aug 2015 14:49:13 +0100
Message-ID: <1439905755-25150-6-git-send-email-jonathanh@nvidia.com>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439905755-25150-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Move code that is common between the Tegra20-APB DMA and Tegra210 ADMA
driver into separate source files.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/Kconfig           |   4 +
 drivers/dma/Makefile          |   1 +
 drivers/dma/tegra-common.c    | 733 ++++++++++++++++++++++++++++++++++
 drivers/dma/tegra-common.h    | 226 +++++++++++
 drivers/dma/tegra20-apb-dma.c | 910 +-----------------------------------------
 5 files changed, 972 insertions(+), 902 deletions(-)
 create mode 100644 drivers/dma/tegra-common.c
 create mode 100644 drivers/dma/tegra-common.h

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index ff50af3f1bb0..dd79b0bf0876 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -189,10 +189,14 @@ config TXX9_DMAC
 	  Support the TXx9 SoC internal DMA controller.  This can be
 	  integrated in chips such as the Toshiba TX4927/38/39.
 
+config TEGRA_DMA_COMMON
+	bool
+
 config TEGRA20_APB_DMA
 	bool "NVIDIA Tegra20 APB DMA support"
 	depends on ARCH_TEGRA
 	select DMA_ENGINE
+	select TEGRA_DMA_COMMON
 	help
 	  Support for the NVIDIA Tegra20 APB DMA controller driver. The
 	  DMA controller is having multiple DMA channel which can be
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index 264eb3c52446..d9c2bf5ef0bd 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_SIRF_DMA) += sirf-dma.o
 obj-$(CONFIG_TI_EDMA) += edma.o
 obj-$(CONFIG_STE_DMA40) += ste_dma40.o ste_dma40_ll.o
 obj-$(CONFIG_TEGRA20_APB_DMA) += tegra20-apb-dma.o
+obj-$(CONFIG_TEGRA_DMA_COMMON) += tegra-common.o
 obj-$(CONFIG_S3C24XX_DMAC) += s3c24xx-dma.o
 obj-$(CONFIG_PL330_DMA) += pl330.o
 obj-$(CONFIG_PCH_DMA) += pch_dma.o
diff --git a/drivers/dma/tegra-common.c b/drivers/dma/tegra-common.c
new file mode 100644
index 000000000000..fff0a143f5bb
--- /dev/null
+++ b/drivers/dma/tegra-common.c
@@ -0,0 +1,733 @@
+/*
+ * Helper functions for NVIDIA DMA drivers.
+ *
+ * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ */
+
+#include <linux/delay.h>
+#include <linux/dmaengine.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include "dmaengine.h"
+#include "tegra-common.h"
+
+static dma_cookie_t tegra_dma_tx_submit(struct dma_async_tx_descriptor *txd)
+{
+	struct tegra_dma_desc *dma_desc = txd_to_tegra_dma_desc(txd);
+	struct tegra_dma_channel *tdc = to_tegra_dma_chan(txd->chan);
+	unsigned long flags;
+	dma_cookie_t cookie;
+
+	spin_lock_irqsave(&tdc->lock, flags);
+	dma_desc->dma_status = DMA_IN_PROGRESS;
+	cookie = dma_cookie_assign(&dma_desc->txd);
+	list_splice_tail_init(&dma_desc->tx_list, &tdc->pending_sg_req);
+	spin_unlock_irqrestore(&tdc->lock, flags);
+	return cookie;
+}
+
+/* Get DMA desc from free list, if not there then allocate it.  */
+static struct tegra_dma_desc *tegra_dma_desc_get(struct tegra_dma_channel *tdc)
+{
+	struct tegra_dma_desc *dma_desc;
+	unsigned long flags;
+
+	spin_lock_irqsave(&tdc->lock, flags);
+
+	/* Do not allocate if desc are waiting for ack */
+	list_for_each_entry(dma_desc, &tdc->free_dma_desc, node) {
+		if (async_tx_test_ack(&dma_desc->txd)) {
+			list_del(&dma_desc->node);
+			spin_unlock_irqrestore(&tdc->lock, flags);
+			dma_desc->txd.flags = 0;
+			return dma_desc;
+		}
+	}
+
+	spin_unlock_irqrestore(&tdc->lock, flags);
+
+	/* Allocate DMA desc */
+	dma_desc = kzalloc(sizeof(*dma_desc), GFP_ATOMIC);
+	if (!dma_desc)
+		return NULL;
+
+	dma_async_tx_descriptor_init(&dma_desc->txd, &tdc->dma_chan);
+	dma_desc->txd.tx_submit = tegra_dma_tx_submit;
+	dma_desc->txd.flags = 0;
+	return dma_desc;
+}
+
+static void tegra_dma_desc_put(struct tegra_dma_channel *tdc,
+			       struct tegra_dma_desc *dma_desc)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&tdc->lock, flags);
+	if (!list_empty(&dma_desc->tx_list))
+		list_splice_init(&dma_desc->tx_list, &tdc->free_sg_req);
+	list_add_tail(&dma_desc->node, &tdc->free_dma_desc);
+	spin_unlock_irqrestore(&tdc->lock, flags);
+}
+
+static struct tegra_dma_sg_req *tegra_dma_sg_req_get(
+		struct tegra_dma_channel *tdc)
+{
+	struct tegra_dma_sg_req *sg_req = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&tdc->lock, flags);
+	if (!list_empty(&tdc->free_sg_req)) {
+		sg_req = list_first_entry(&tdc->free_sg_req,
+					typeof(*sg_req), node);
+		list_del(&sg_req->node);
+		spin_unlock_irqrestore(&tdc->lock, flags);
+		return sg_req;
+	}
+	spin_unlock_irqrestore(&tdc->lock, flags);
+
+	return kzalloc(sizeof(struct tegra_dma_sg_req), GFP_ATOMIC);
+}
+
+static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,
+					 struct tegra_dma_sg_req *nsg_req)
+{
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
+	unsigned long status;
+
+	/*
+	 * The DMA controller reloads the new configuration for next transfer
+	 * after last burst of current transfer completes.
+	 * If there is no IEC status then this makes sure that last burst
+	 * has not be completed. There may be case that last burst is on
+	 * flight and so it can complete but because DMA is paused, it
+	 * will not generates interrupt as well as not reload the new
+	 * configuration.
+	 * If there is already IEC status then interrupt handler need to
+	 * load new configuration.
+	 */
+	ops->pause(tdc, false);
+	status = ops->irq_status(tdc);
+
+	/*
+	 * If interrupt is pending then do nothing as the ISR will handle
+	 * the programing for new request.
+	 */
+	if (status) {
+		dev_err(tdc2dev(tdc),
+			"Skipping new configuration as interrupt is pending\n");
+		ops->resume(tdc);
+		return;
+	}
+
+	/* Safe to program new configuration */
+	ops->program(tdc, nsg_req);
+	ops->resume(tdc);
+}
+
+static void tdc_start_head_req(struct tegra_dma_channel *tdc)
+{
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
+	struct tegra_dma_sg_req *sg_req;
+
+	if (list_empty(&tdc->pending_sg_req))
+		return;
+
+	sg_req = list_first_entry(&tdc->pending_sg_req,
+					typeof(*sg_req), node);
+	ops->start(tdc, sg_req);
+	sg_req->configured = true;
+	tdc->busy = true;
+}
+
+static void tdc_configure_next_head_desc(struct tegra_dma_channel *tdc)
+{
+	struct tegra_dma_sg_req *hsgreq;
+	struct tegra_dma_sg_req *hnsgreq;
+
+	if (list_empty(&tdc->pending_sg_req))
+		return;
+
+	hsgreq = list_first_entry(&tdc->pending_sg_req, typeof(*hsgreq), node);
+	if (!list_is_last(&hsgreq->node, &tdc->pending_sg_req)) {
+		hnsgreq = list_first_entry(&hsgreq->node,
+					typeof(*hnsgreq), node);
+		tegra_dma_configure_for_next(tdc, hnsgreq);
+	}
+}
+
+static inline int get_current_xferred_count(struct tegra_dma_sg_req *sg_req,
+					    unsigned long wcount)
+{
+	return sg_req->req_len - wcount;
+}
+
+static void tegra_dma_abort_all(struct tegra_dma_channel *tdc)
+{
+	struct tegra_dma_sg_req *sgreq;
+	struct tegra_dma_desc *dma_desc;
+
+	while (!list_empty(&tdc->pending_sg_req)) {
+		sgreq = list_first_entry(&tdc->pending_sg_req,
+						typeof(*sgreq), node);
+		list_move_tail(&sgreq->node, &tdc->free_sg_req);
+		if (sgreq->last_sg) {
+			dma_desc = sgreq->dma_desc;
+			dma_desc->dma_status = DMA_ERROR;
+			list_add_tail(&dma_desc->node, &tdc->free_dma_desc);
+
+			/* Add in cb list if it is not there. */
+			if (!dma_desc->cb_count)
+				list_add_tail(&dma_desc->cb_node,
+							&tdc->cb_desc);
+			dma_desc->cb_count++;
+		}
+	}
+	tdc->isr_handler = NULL;
+}
+
+static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
+					   struct tegra_dma_sg_req *last_sg_req,
+					   bool to_terminate)
+{
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
+	struct tegra_dma_sg_req *hsgreq = NULL;
+
+	if (list_empty(&tdc->pending_sg_req)) {
+		dev_err(tdc2dev(tdc), "Dma is running without req\n");
+		ops->stop(tdc);
+		return false;
+	}
+
+	/*
+	 * Check that head req on list should be in flight.
+	 * If it is not in flight then abort transfer as
+	 * looping of transfer can not continue.
+	 */
+	hsgreq = list_first_entry(&tdc->pending_sg_req, typeof(*hsgreq), node);
+	if (!hsgreq->configured) {
+		ops->stop(tdc);
+		dev_err(tdc2dev(tdc), "Error in dma transfer, aborting dma\n");
+		tegra_dma_abort_all(tdc);
+		return false;
+	}
+
+	/* Configure next request */
+	if (!to_terminate)
+		tdc_configure_next_head_desc(tdc);
+	return true;
+}
+
+static void handle_once_dma_done(struct tegra_dma_channel *tdc,
+				 bool to_terminate)
+{
+	struct tegra_dma_sg_req *sgreq;
+	struct tegra_dma_desc *dma_desc;
+
+	tdc->busy = false;
+	sgreq = list_first_entry(&tdc->pending_sg_req, typeof(*sgreq), node);
+	dma_desc = sgreq->dma_desc;
+	dma_desc->bytes_transferred += sgreq->req_len;
+
+	list_del(&sgreq->node);
+	if (sgreq->last_sg) {
+		dma_desc->dma_status = DMA_COMPLETE;
+		dma_cookie_complete(&dma_desc->txd);
+		if (!dma_desc->cb_count)
+			list_add_tail(&dma_desc->cb_node, &tdc->cb_desc);
+		dma_desc->cb_count++;
+		list_add_tail(&dma_desc->node, &tdc->free_dma_desc);
+	}
+	list_add_tail(&sgreq->node, &tdc->free_sg_req);
+
+	/* Do not start DMA if it is going to be terminate */
+	if (to_terminate || list_empty(&tdc->pending_sg_req))
+		return;
+
+	tdc_start_head_req(tdc);
+}
+
+static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
+					    bool to_terminate)
+{
+	struct tegra_dma_sg_req *sgreq;
+	struct tegra_dma_desc *dma_desc;
+	bool st;
+
+	sgreq = list_first_entry(&tdc->pending_sg_req, typeof(*sgreq), node);
+	dma_desc = sgreq->dma_desc;
+	dma_desc->bytes_transferred += sgreq->req_len;
+
+	/* Callback need to be call */
+	if (!dma_desc->cb_count)
+		list_add_tail(&dma_desc->cb_node, &tdc->cb_desc);
+	dma_desc->cb_count++;
+
+	/* If not last req then put at end of pending list */
+	if (!list_is_last(&sgreq->node, &tdc->pending_sg_req)) {
+		list_move_tail(&sgreq->node, &tdc->pending_sg_req);
+		sgreq->configured = false;
+		st = handle_continuous_head_request(tdc, sgreq, to_terminate);
+		if (!st)
+			dma_desc->dma_status = DMA_ERROR;
+	}
+}
+
+int tegra_dma_slave_config(struct dma_chan *dc,
+			   struct dma_slave_config *sconfig)
+{
+	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+
+	if (!list_empty(&tdc->pending_sg_req)) {
+		dev_err(tdc2dev(tdc), "Configuration not allowed\n");
+		return -EBUSY;
+	}
+
+	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
+	if (!tdc->slave_id)
+		tdc->slave_id = sconfig->slave_id;
+	tdc->config_init = true;
+	return 0;
+}
+
+void tegra_dma_tasklet(unsigned long data)
+{
+	struct tegra_dma_channel *tdc = (struct tegra_dma_channel *)data;
+	dma_async_tx_callback callback = NULL;
+	void *callback_param = NULL;
+	struct tegra_dma_desc *dma_desc;
+	unsigned long flags;
+	int cb_count;
+
+	spin_lock_irqsave(&tdc->lock, flags);
+	while (!list_empty(&tdc->cb_desc)) {
+		dma_desc  = list_first_entry(&tdc->cb_desc,
+					typeof(*dma_desc), cb_node);
+		list_del(&dma_desc->cb_node);
+		callback = dma_desc->txd.callback;
+		callback_param = dma_desc->txd.callback_param;
+		cb_count = dma_desc->cb_count;
+		dma_desc->cb_count = 0;
+		spin_unlock_irqrestore(&tdc->lock, flags);
+		while (cb_count-- && callback)
+			callback(callback_param);
+		spin_lock_irqsave(&tdc->lock, flags);
+	}
+	spin_unlock_irqrestore(&tdc->lock, flags);
+}
+
+irqreturn_t tegra_dma_isr(int irq, void *dev_id)
+{
+	struct tegra_dma_channel *tdc = dev_id;
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
+	unsigned long status;
+	unsigned long flags;
+
+	spin_lock_irqsave(&tdc->lock, flags);
+
+	status = ops->irq_clear(tdc);
+	if (status) {
+		tdc->isr_handler(tdc, false);
+		tasklet_schedule(&tdc->tasklet);
+		spin_unlock_irqrestore(&tdc->lock, flags);
+		return IRQ_HANDLED;
+	}
+
+	spin_unlock_irqrestore(&tdc->lock, flags);
+	dev_info(tdc2dev(tdc),
+		"Interrupt already served status 0x%08lx\n", status);
+	return IRQ_NONE;
+}
+
+void tegra_dma_issue_pending(struct dma_chan *dc)
+{
+	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&tdc->lock, flags);
+	if (list_empty(&tdc->pending_sg_req)) {
+		dev_err(tdc2dev(tdc), "No DMA request\n");
+		goto end;
+	}
+	if (!tdc->busy) {
+		tdc_start_head_req(tdc);
+
+		/* Continuous single mode: Configure next req */
+		if (tdc->cyclic) {
+			/*
+			 * Wait for 1 burst time for configure DMA for
+			 * next transfer.
+			 */
+			udelay(tdc->tdma->chip_data->burst_time);
+			tdc_configure_next_head_desc(tdc);
+		}
+	}
+end:
+	spin_unlock_irqrestore(&tdc->lock, flags);
+}
+
+int tegra_dma_terminate_all(struct dma_chan *dc)
+{
+	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
+	struct tegra_dma_sg_req *sgreq;
+	struct tegra_dma_desc *dma_desc;
+	unsigned long flags;
+	unsigned long status;
+	unsigned long wcount;
+	bool was_busy;
+
+	spin_lock_irqsave(&tdc->lock, flags);
+	if (list_empty(&tdc->pending_sg_req)) {
+		spin_unlock_irqrestore(&tdc->lock, flags);
+		return 0;
+	}
+
+	if (!tdc->busy)
+		goto skip_dma_stop;
+
+	/* Pause DMA before checking the queue status */
+	ops->pause(tdc, true);
+
+	status = ops->irq_status(tdc);
+	if (status) {
+		dev_dbg(tdc2dev(tdc), "%s():handling isr\n", __func__);
+		tdc->isr_handler(tdc, true);
+	}
+
+	wcount = ops->get_xfer_count(tdc);
+
+	was_busy = tdc->busy;
+	ops->stop(tdc);
+
+	if (!list_empty(&tdc->pending_sg_req) && was_busy) {
+		sgreq = list_first_entry(&tdc->pending_sg_req,
+					typeof(*sgreq), node);
+		sgreq->dma_desc->bytes_transferred +=
+				get_current_xferred_count(sgreq, wcount);
+	}
+	ops->resume(tdc);
+
+skip_dma_stop:
+	tegra_dma_abort_all(tdc);
+
+	while (!list_empty(&tdc->cb_desc)) {
+		dma_desc  = list_first_entry(&tdc->cb_desc,
+					typeof(*dma_desc), cb_node);
+		list_del(&dma_desc->cb_node);
+		dma_desc->cb_count = 0;
+	}
+	spin_unlock_irqrestore(&tdc->lock, flags);
+	return 0;
+}
+
+enum dma_status tegra_dma_tx_status(struct dma_chan *dc, dma_cookie_t cookie,
+				    struct dma_tx_state *txstate)
+{
+	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	struct tegra_dma_desc *dma_desc;
+	struct tegra_dma_sg_req *sg_req;
+	enum dma_status ret;
+	unsigned long flags;
+	unsigned int residual;
+
+	ret = dma_cookie_status(dc, cookie, txstate);
+	if (ret == DMA_COMPLETE)
+		return ret;
+
+	spin_lock_irqsave(&tdc->lock, flags);
+
+	/* Check on wait_ack desc status */
+	list_for_each_entry(dma_desc, &tdc->free_dma_desc, node) {
+		if (dma_desc->txd.cookie == cookie) {
+			residual =  dma_desc->bytes_requested -
+					(dma_desc->bytes_transferred %
+						dma_desc->bytes_requested);
+			dma_set_residue(txstate, residual);
+			ret = dma_desc->dma_status;
+			spin_unlock_irqrestore(&tdc->lock, flags);
+			return ret;
+		}
+	}
+
+	/* Check in pending list */
+	list_for_each_entry(sg_req, &tdc->pending_sg_req, node) {
+		dma_desc = sg_req->dma_desc;
+		if (dma_desc->txd.cookie == cookie) {
+			residual =  dma_desc->bytes_requested -
+					(dma_desc->bytes_transferred %
+						dma_desc->bytes_requested);
+			dma_set_residue(txstate, residual);
+			ret = dma_desc->dma_status;
+			spin_unlock_irqrestore(&tdc->lock, flags);
+			return ret;
+		}
+	}
+
+	dev_dbg(tdc2dev(tdc), "cookie %d does not found\n", cookie);
+	spin_unlock_irqrestore(&tdc->lock, flags);
+	return ret;
+}
+
+struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
+	struct dma_chan *dc, struct scatterlist *sgl, unsigned int sg_len,
+	enum dma_transfer_direction direction, unsigned long flags,
+	void *context)
+{
+	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
+	struct tegra_dma_desc *dma_desc;
+	unsigned int i;
+	struct scatterlist *sg;
+	struct list_head req_list;
+	struct tegra_dma_sg_req sg_base, *sg_req = NULL;
+
+	if (!tdc->config_init) {
+		dev_err(tdc2dev(tdc), "dma channel is not configured\n");
+		return NULL;
+	}
+	if (sg_len < 1) {
+		dev_err(tdc2dev(tdc), "Invalid segment length %d\n", sg_len);
+		return NULL;
+	}
+
+	if (ops->get_xfer_params_sg(tdc, &sg_base, direction, flags) < 0)
+		return NULL;
+
+	INIT_LIST_HEAD(&req_list);
+
+	dma_desc = tegra_dma_desc_get(tdc);
+	if (!dma_desc) {
+		dev_err(tdc2dev(tdc), "Dma descriptors not available\n");
+		return NULL;
+	}
+	INIT_LIST_HEAD(&dma_desc->tx_list);
+	INIT_LIST_HEAD(&dma_desc->cb_node);
+	dma_desc->cb_count = 0;
+	dma_desc->bytes_requested = 0;
+	dma_desc->bytes_transferred = 0;
+	dma_desc->dma_status = DMA_IN_PROGRESS;
+
+	/* Make transfer requests */
+	for_each_sg(sgl, sg, sg_len, i) {
+		u32 len, mem;
+
+		mem = sg_dma_address(sg);
+		len = sg_dma_len(sg);
+
+		if ((len & 3) || (mem & 3) ||
+				(len > tdc->tdma->chip_data->max_dma_count)) {
+			dev_err(tdc2dev(tdc),
+				"Dma length/memory address is not supported\n");
+			tegra_dma_desc_put(tdc, dma_desc);
+			return NULL;
+		}
+
+		sg_req = tegra_dma_sg_req_get(tdc);
+		if (!sg_req) {
+			dev_err(tdc2dev(tdc), "Dma sg-req not available\n");
+			tegra_dma_desc_put(tdc, dma_desc);
+			return NULL;
+		}
+
+		dma_desc->bytes_requested += len;
+
+		ops->set_xfer_params(tdc, sg_req, &sg_base, direction, mem,
+				     len);
+		sg_req->dma_desc = dma_desc;
+
+		list_add_tail(&sg_req->node, &dma_desc->tx_list);
+	}
+	sg_req->last_sg = true;
+	if (flags & DMA_CTRL_ACK)
+		dma_desc->txd.flags = DMA_CTRL_ACK;
+
+	/*
+	 * Make sure that mode should not be conflicting with currently
+	 * configured mode.
+	 */
+	if (!tdc->isr_handler) {
+		tdc->isr_handler = handle_once_dma_done;
+		tdc->cyclic = false;
+	} else {
+		if (tdc->cyclic) {
+			dev_err(tdc2dev(tdc), "DMA configured in cyclic mode\n");
+			tegra_dma_desc_put(tdc, dma_desc);
+			return NULL;
+		}
+	}
+
+	return &dma_desc->txd;
+}
+
+struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
+	struct dma_chan *dc, dma_addr_t buf_addr, size_t buf_len,
+	size_t period_len, enum dma_transfer_direction direction,
+	unsigned long flags)
+{
+	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	const struct tegra_dma_ops *ops = tdc->tdma->ops;
+	struct tegra_dma_desc *dma_desc = NULL;
+	struct tegra_dma_sg_req sg_base, *sg_req = NULL;
+	int len;
+	size_t remain_len;
+	dma_addr_t mem = buf_addr;
+
+	if (!buf_len || !period_len) {
+		dev_err(tdc2dev(tdc), "Invalid buffer/period len\n");
+		return NULL;
+	}
+
+	if (!tdc->config_init) {
+		dev_err(tdc2dev(tdc), "DMA slave is not configured\n");
+		return NULL;
+	}
+
+	/*
+	 * We allow to take more number of requests till DMA is
+	 * not started. The driver will loop over all requests.
+	 * Once DMA is started then new requests can be queued only after
+	 * terminating the DMA.
+	 */
+	if (tdc->busy) {
+		dev_err(tdc2dev(tdc), "Request not allowed when dma running\n");
+		return NULL;
+	}
+
+	/*
+	 * We only support cycle transfer when buf_len is multiple of
+	 * period_len.
+	 */
+	if (buf_len % period_len) {
+		dev_err(tdc2dev(tdc), "buf_len is not multiple of period_len\n");
+		return NULL;
+	}
+
+	len = period_len;
+	if ((len & 3) || (buf_addr & 3) ||
+			(len > tdc->tdma->chip_data->max_dma_count)) {
+		dev_err(tdc2dev(tdc), "Req len/mem address is not correct\n");
+		return NULL;
+	}
+
+	if (ops->get_xfer_params_cyclic(tdc, &sg_base, direction, flags) < 0)
+		return NULL;
+
+	dma_desc = tegra_dma_desc_get(tdc);
+	if (!dma_desc) {
+		dev_err(tdc2dev(tdc), "not enough descriptors available\n");
+		return NULL;
+	}
+
+	INIT_LIST_HEAD(&dma_desc->tx_list);
+	INIT_LIST_HEAD(&dma_desc->cb_node);
+	dma_desc->cb_count = 0;
+
+	dma_desc->bytes_transferred = 0;
+	dma_desc->bytes_requested = buf_len;
+	remain_len = buf_len;
+
+	/* Split transfer equal to period size */
+	while (remain_len) {
+		sg_req = tegra_dma_sg_req_get(tdc);
+		if (!sg_req) {
+			dev_err(tdc2dev(tdc), "Dma sg-req not available\n");
+			tegra_dma_desc_put(tdc, dma_desc);
+			return NULL;
+		}
+
+		ops->set_xfer_params(tdc, sg_req, &sg_base, direction, mem,
+				     len);
+		sg_req->dma_desc = dma_desc;
+
+		list_add_tail(&sg_req->node, &dma_desc->tx_list);
+		remain_len -= len;
+		mem += len;
+	}
+	sg_req->last_sg = true;
+	if (flags & DMA_CTRL_ACK)
+		dma_desc->txd.flags = DMA_CTRL_ACK;
+
+	/*
+	 * Make sure that mode should not be conflicting with currently
+	 * configured mode.
+	 */
+	if (!tdc->isr_handler) {
+		tdc->isr_handler = handle_cont_sngl_cycle_dma_done;
+		tdc->cyclic = true;
+	} else {
+		if (!tdc->cyclic) {
+			dev_err(tdc2dev(tdc), "DMA configuration conflict\n");
+			tegra_dma_desc_put(tdc, dma_desc);
+			return NULL;
+		}
+	}
+
+	return &dma_desc->txd;
+}
+
+int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
+{
+	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	struct tegra_dma *tdma = tdc->tdma;
+
+	dma_cookie_init(&tdc->dma_chan);
+	tdc->config_init = false;
+
+	return pm_runtime_get_sync(tdma->dev);
+}
+
+void tegra_dma_free_chan_resources(struct dma_chan *dc)
+{
+	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	struct tegra_dma *tdma = tdc->tdma;
+
+	struct tegra_dma_desc *dma_desc;
+	struct tegra_dma_sg_req *sg_req;
+	struct list_head dma_desc_list;
+	struct list_head sg_req_list;
+	unsigned long flags;
+
+	INIT_LIST_HEAD(&dma_desc_list);
+	INIT_LIST_HEAD(&sg_req_list);
+
+	dev_dbg(tdc2dev(tdc), "Freeing channel %d\n", tdc->id);
+
+	if (tdc->busy)
+		tegra_dma_terminate_all(dc);
+
+	spin_lock_irqsave(&tdc->lock, flags);
+	list_splice_init(&tdc->pending_sg_req, &sg_req_list);
+	list_splice_init(&tdc->free_sg_req, &sg_req_list);
+	list_splice_init(&tdc->free_dma_desc, &dma_desc_list);
+	INIT_LIST_HEAD(&tdc->cb_desc);
+	tdc->config_init = false;
+	tdc->isr_handler = NULL;
+	spin_unlock_irqrestore(&tdc->lock, flags);
+
+	while (!list_empty(&dma_desc_list)) {
+		dma_desc = list_first_entry(&dma_desc_list,
+					typeof(*dma_desc), node);
+		list_del(&dma_desc->node);
+		kfree(dma_desc);
+	}
+
+	while (!list_empty(&sg_req_list)) {
+		sg_req = list_first_entry(&sg_req_list, typeof(*sg_req), node);
+		list_del(&sg_req->node);
+		kfree(sg_req);
+	}
+	pm_runtime_put(tdma->dev);
+
+	tdc->slave_id = 0;
+}
diff --git a/drivers/dma/tegra-common.h b/drivers/dma/tegra-common.h
new file mode 100644
index 000000000000..e0d4d2b13cb8
--- /dev/null
+++ b/drivers/dma/tegra-common.h
@@ -0,0 +1,226 @@
+/*
+ * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
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
+/*
+ * tegra_dma_chip_data Tegra chip specific DMA data
+ * @nr_channels: Number of channels available in the controller.
+ * @channel_reg_size: Channel register size/stride.
+ * @max_dma_count: Maximum DMA transfer count supported by DMA controller.
+ * @support_channel_pause: Support channel wise pause of dma.
+ * @support_separate_wcount_reg: Support separate word count register.
+ */
+struct tegra_dma_chip_data {
+	int burst_time;
+	int nr_channels;
+	int channel_reg_size;
+	int max_dma_count;
+	bool support_channel_pause;
+	bool support_separate_wcount_reg;
+};
+
+/*
+ * DMA channel registers
+ */
+struct tegra_dma_channel_regs {
+	unsigned long	csr;
+	unsigned long	ahb_ptr;
+	unsigned long	apb_ptr;
+	unsigned long	ahb_seq;
+	unsigned long	apb_seq;
+	unsigned long	wcount;
+};
+
+/*
+ * tegra_dma_sg_req: Dma request details to configure hardware. This
+ * contains the details for one transfer to configure DMA hw.
+ * The client's request for data transfer can be broken into multiple
+ * sub-transfer as per requester details and hw support.
+ * This sub transfer get added in the list of transfer and point to Tegra
+ * DMA descriptor which manages the transfer details.
+ */
+struct tegra_dma_sg_req {
+	struct tegra_dma_channel_regs	ch_regs;
+	int				req_len;
+	bool				configured;
+	bool				last_sg;
+	struct list_head		node;
+	struct tegra_dma_desc		*dma_desc;
+};
+
+/*
+ * tegra_dma_desc: Tegra DMA descriptors which manages the client requests.
+ * This descriptor keep track of transfer status, callbacks and request
+ * counts etc.
+ */
+struct tegra_dma_desc {
+	struct dma_async_tx_descriptor	txd;
+	int				bytes_requested;
+	int				bytes_transferred;
+	enum dma_status			dma_status;
+	struct list_head		node;
+	struct list_head		tx_list;
+	struct list_head		cb_node;
+	int				cb_count;
+};
+
+struct tegra_dma_channel;
+
+typedef void (*dma_isr_handler)(struct tegra_dma_channel *tdc,
+				bool to_terminate);
+
+/*
+ * tegra_dma_channel: Channel specific information
+ */
+struct tegra_dma_channel {
+	struct dma_chan		dma_chan;
+	char			name[30];
+	bool			config_init;
+	int			id;
+	int			irq;
+	void __iomem		*chan_addr;
+	spinlock_t		lock;
+	bool			busy;
+	struct tegra_dma	*tdma;
+	bool			cyclic;
+
+	/* Different lists for managing the requests */
+	struct list_head	free_sg_req;
+	struct list_head	pending_sg_req;
+	struct list_head	free_dma_desc;
+	struct list_head	cb_desc;
+
+	/* ISR handler and tasklet for bottom half of isr handling */
+	dma_isr_handler		isr_handler;
+	struct tasklet_struct	tasklet;
+
+	/* Channel-slave specific configuration */
+	unsigned int slave_id;
+	struct dma_slave_config dma_sconfig;
+	struct tegra_dma_channel_regs	channel_reg;
+};
+
+/*
+ * tegra_dma_ops: Tegra DMA function table
+ */
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
+/*
+ * tegra_dma: Tegra DMA specific information
+ */
+struct tegra_dma {
+	struct dma_device		dma_dev;
+	struct device			*dev;
+	struct clk			*dma_clk;
+	struct reset_control		*rst;
+	spinlock_t			global_lock;
+	void __iomem			*base_addr;
+	const struct tegra_dma_chip_data *chip_data;
+	const struct tegra_dma_ops	*ops;
+
+	/*
+	 * Counter for managing global pausing of the DMA controller.
+	 * Only applicable for devices that don't support individual
+	 * channel pausing.
+	 */
+	u32				global_pause_count;
+
+	/* Some register need to be cache before suspend */
+	u32				reg_gen;
+
+	/* Last member of the structure */
+	struct tegra_dma_channel channels[0];
+};
+
+static inline void tdma_write(struct tegra_dma *tdma, u32 reg, u32 val)
+{
+	writel(val, tdma->base_addr + reg);
+}
+
+static inline u32 tdma_read(struct tegra_dma *tdma, u32 reg)
+{
+	return readl(tdma->base_addr + reg);
+}
+
+static inline void tdc_write(struct tegra_dma_channel *tdc,
+		u32 reg, u32 val)
+{
+	writel(val, tdc->chan_addr + reg);
+}
+
+static inline u32 tdc_read(struct tegra_dma_channel *tdc, u32 reg)
+{
+	return readl(tdc->chan_addr + reg);
+}
+
+static inline struct tegra_dma_channel *to_tegra_dma_chan(struct dma_chan *dc)
+{
+	return container_of(dc, struct tegra_dma_channel, dma_chan);
+}
+
+static inline struct tegra_dma_desc *txd_to_tegra_dma_desc(
+		struct dma_async_tx_descriptor *td)
+{
+	return container_of(td, struct tegra_dma_desc, txd);
+}
+
+static inline struct device *tdc2dev(struct tegra_dma_channel *tdc)
+{
+	return &tdc->dma_chan.dev->device;
+}
+
+irqreturn_t tegra_dma_isr(int irq, void *dev_id);
+void tegra_dma_issue_pending(struct dma_chan *dc);
+int tegra_dma_slave_config(struct dma_chan *dc,
+			   struct dma_slave_config *sconfig);
+void tegra_dma_tasklet(unsigned long data);
+enum dma_status tegra_dma_tx_status(struct dma_chan *dc, dma_cookie_t cookie,
+				    struct dma_tx_state *txstate);
+int tegra_dma_terminate_all(struct dma_chan *dc);
+struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
+	struct dma_chan *dc, struct scatterlist *sgl, unsigned int sg_len,
+	enum dma_transfer_direction direction, unsigned long flags,
+	void *context);
+struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
+	struct dma_chan *dc, dma_addr_t buf_addr, size_t buf_len,
+	size_t period_len, enum dma_transfer_direction direction,
+	unsigned long flags);
+int tegra_dma_alloc_chan_resources(struct dma_chan *dc);
+void tegra_dma_free_chan_resources(struct dma_chan *dc);
diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 7947acdf23db..0895732aaa28 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -38,6 +38,8 @@
 
 #include "dmaengine.h"
 
+#include "tegra-common.h"
+
 #define TEGRA_APBDMA_GENERAL			0x0
 #define TEGRA_APBDMA_GENERAL_ENABLE		BIT(31)
 
@@ -114,279 +116,9 @@
 /* Channel base address offset from APBDMA base address */
 #define TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET	0x1000
 
-struct tegra_dma;
-
-/*
- * tegra_dma_chip_data Tegra chip specific DMA data
- * @nr_channels: Number of channels available in the controller.
- * @channel_reg_size: Channel register size/stride.
- * @max_dma_count: Maximum DMA transfer count supported by DMA controller.
- * @support_channel_pause: Support channel wise pause of dma.
- * @support_separate_wcount_reg: Support separate word count register.
- */
-struct tegra_dma_chip_data {
-	int nr_channels;
-	int channel_reg_size;
-	int max_dma_count;
-	bool support_channel_pause;
-	bool support_separate_wcount_reg;
-};
-
-/* DMA channel registers */
-struct tegra_dma_channel_regs {
-	unsigned long	csr;
-	unsigned long	ahb_ptr;
-	unsigned long	apb_ptr;
-	unsigned long	ahb_seq;
-	unsigned long	apb_seq;
-	unsigned long	wcount;
-};
-
-/*
- * tegra_dma_sg_req: Dma request details to configure hardware. This
- * contains the details for one transfer to configure DMA hw.
- * The client's request for data transfer can be broken into multiple
- * sub-transfer as per requester details and hw support.
- * This sub transfer get added in the list of transfer and point to Tegra
- * DMA descriptor which manages the transfer details.
- */
-struct tegra_dma_sg_req {
-	struct tegra_dma_channel_regs	ch_regs;
-	int				req_len;
-	bool				configured;
-	bool				last_sg;
-	struct list_head		node;
-	struct tegra_dma_desc		*dma_desc;
-};
-
-/*
- * tegra_dma_desc: Tegra DMA descriptors which manages the client requests.
- * This descriptor keep track of transfer status, callbacks and request
- * counts etc.
- */
-struct tegra_dma_desc {
-	struct dma_async_tx_descriptor	txd;
-	int				bytes_requested;
-	int				bytes_transferred;
-	enum dma_status			dma_status;
-	struct list_head		node;
-	struct list_head		tx_list;
-	struct list_head		cb_node;
-	int				cb_count;
-};
-
-struct tegra_dma_channel;
-
-typedef void (*dma_isr_handler)(struct tegra_dma_channel *tdc,
-				bool to_terminate);
-
-/* tegra_dma_channel: Channel specific information */
-struct tegra_dma_channel {
-	struct dma_chan		dma_chan;
-	char			name[30];
-	bool			config_init;
-	int			id;
-	int			irq;
-	void __iomem		*chan_addr;
-	spinlock_t		lock;
-	bool			busy;
-	struct tegra_dma	*tdma;
-	bool			cyclic;
-
-	/* Different lists for managing the requests */
-	struct list_head	free_sg_req;
-	struct list_head	pending_sg_req;
-	struct list_head	free_dma_desc;
-	struct list_head	cb_desc;
-
-	/* ISR handler and tasklet for bottom half of isr handling */
-	dma_isr_handler		isr_handler;
-	struct tasklet_struct	tasklet;
-
-	/* Channel-slave specific configuration */
-	unsigned int slave_id;
-	struct dma_slave_config dma_sconfig;
-	struct tegra_dma_channel_regs	channel_reg;
-};
-
-struct tegra_dma_ops {
-	u32 (*get_xfer_count)(struct tegra_dma_channel *tdc);
-	int (*get_xfer_params_cyclic)(struct tegra_dma_channel *tdc,
-				      struct tegra_dma_sg_req *sg_req,
-				      enum dma_transfer_direction direction,
-				      unsigned int flags);
-	int (*get_xfer_params_sg)(struct tegra_dma_channel *tdc,
-				  struct tegra_dma_sg_req *sg_req,
-				  enum dma_transfer_direction direction,
-				  unsigned int flags);
-	u32 (*irq_clear)(struct tegra_dma_channel *tdc);
-	u32 (*irq_status)(struct tegra_dma_channel *tdc);
-	void (*pause)(struct tegra_dma_channel *tdc,
-		      bool wait_for_burst_complete);
-	void (*program)(struct tegra_dma_channel *tdc,
-			struct tegra_dma_sg_req *sg_req);
-	void (*resume)(struct tegra_dma_channel *tdc);
-	void (*set_xfer_params)(struct tegra_dma_channel *tdc,
-				struct tegra_dma_sg_req *sg_req,
-				struct tegra_dma_sg_req *sg_base,
-				enum dma_transfer_direction direction,
-				u32 mem, u32 len);
-	void (*start)(struct tegra_dma_channel *tdc,
-		      struct tegra_dma_sg_req *sg_req);
-	void (*stop)(struct tegra_dma_channel *tdc);
-};
-
-/* tegra_dma: Tegra DMA specific information */
-struct tegra_dma {
-	struct dma_device		dma_dev;
-	struct device			*dev;
-	struct clk			*dma_clk;
-	struct reset_control		*rst;
-	spinlock_t			global_lock;
-	void __iomem			*base_addr;
-	const struct tegra_dma_chip_data *chip_data;
-	const struct tegra_dma_ops	*ops;
-
-	/*
-	 * Counter for managing global pausing of the DMA controller.
-	 * Only applicable for devices that don't support individual
-	 * channel pausing.
-	 */
-	u32				global_pause_count;
-
-	/* Some register need to be cache before suspend */
-	u32				reg_gen;
-
-	/* Last member of the structure */
-	struct tegra_dma_channel channels[0];
-};
-
-static inline void tdma_write(struct tegra_dma *tdma, u32 reg, u32 val)
-{
-	writel(val, tdma->base_addr + reg);
-}
-
-static inline u32 tdma_read(struct tegra_dma *tdma, u32 reg)
-{
-	return readl(tdma->base_addr + reg);
-}
-
-static inline void tdc_write(struct tegra_dma_channel *tdc,
-		u32 reg, u32 val)
-{
-	writel(val, tdc->chan_addr + reg);
-}
-
-static inline u32 tdc_read(struct tegra_dma_channel *tdc, u32 reg)
-{
-	return readl(tdc->chan_addr + reg);
-}
-
-static inline struct tegra_dma_channel *to_tegra_dma_chan(struct dma_chan *dc)
-{
-	return container_of(dc, struct tegra_dma_channel, dma_chan);
-}
-
-static inline struct tegra_dma_desc *txd_to_tegra_dma_desc(
-		struct dma_async_tx_descriptor *td)
-{
-	return container_of(td, struct tegra_dma_desc, txd);
-}
-
-static inline struct device *tdc2dev(struct tegra_dma_channel *tdc)
-{
-	return &tdc->dma_chan.dev->device;
-}
-
-static dma_cookie_t tegra_dma_tx_submit(struct dma_async_tx_descriptor *tx);
 static int tegra_dma_runtime_suspend(struct device *dev);
 static int tegra_dma_runtime_resume(struct device *dev);
 
-/* Get DMA desc from free list, if not there then allocate it.  */
-static struct tegra_dma_desc *tegra_dma_desc_get(
-		struct tegra_dma_channel *tdc)
-{
-	struct tegra_dma_desc *dma_desc;
-	unsigned long flags;
-
-	spin_lock_irqsave(&tdc->lock, flags);
-
-	/* Do not allocate if desc are waiting for ack */
-	list_for_each_entry(dma_desc, &tdc->free_dma_desc, node) {
-		if (async_tx_test_ack(&dma_desc->txd)) {
-			list_del(&dma_desc->node);
-			spin_unlock_irqrestore(&tdc->lock, flags);
-			dma_desc->txd.flags = 0;
-			return dma_desc;
-		}
-	}
-
-	spin_unlock_irqrestore(&tdc->lock, flags);
-
-	/* Allocate DMA desc */
-	dma_desc = kzalloc(sizeof(*dma_desc), GFP_ATOMIC);
-	if (!dma_desc) {
-		dev_err(tdc2dev(tdc), "dma_desc alloc failed\n");
-		return NULL;
-	}
-
-	dma_async_tx_descriptor_init(&dma_desc->txd, &tdc->dma_chan);
-	dma_desc->txd.tx_submit = tegra_dma_tx_submit;
-	dma_desc->txd.flags = 0;
-	return dma_desc;
-}
-
-static void tegra_dma_desc_put(struct tegra_dma_channel *tdc,
-		struct tegra_dma_desc *dma_desc)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&tdc->lock, flags);
-	if (!list_empty(&dma_desc->tx_list))
-		list_splice_init(&dma_desc->tx_list, &tdc->free_sg_req);
-	list_add_tail(&dma_desc->node, &tdc->free_dma_desc);
-	spin_unlock_irqrestore(&tdc->lock, flags);
-}
-
-static struct tegra_dma_sg_req *tegra_dma_sg_req_get(
-		struct tegra_dma_channel *tdc)
-{
-	struct tegra_dma_sg_req *sg_req = NULL;
-	unsigned long flags;
-
-	spin_lock_irqsave(&tdc->lock, flags);
-	if (!list_empty(&tdc->free_sg_req)) {
-		sg_req = list_first_entry(&tdc->free_sg_req,
-					typeof(*sg_req), node);
-		list_del(&sg_req->node);
-		spin_unlock_irqrestore(&tdc->lock, flags);
-		return sg_req;
-	}
-	spin_unlock_irqrestore(&tdc->lock, flags);
-
-	sg_req = kzalloc(sizeof(struct tegra_dma_sg_req), GFP_ATOMIC);
-	if (!sg_req)
-		dev_err(tdc2dev(tdc), "sg_req alloc failed\n");
-	return sg_req;
-}
-
-static int tegra_dma_slave_config(struct dma_chan *dc,
-		struct dma_slave_config *sconfig)
-{
-	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-
-	if (!list_empty(&tdc->pending_sg_req)) {
-		dev_err(tdc2dev(tdc), "Configuration not allowed\n");
-		return -EBUSY;
-	}
-
-	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
-	if (!tdc->slave_id)
-		tdc->slave_id = sconfig->slave_id;
-	tdc->config_init = true;
-	return 0;
-}
-
 static u32 tegra_dma_get_xfer_count(struct tegra_dma_channel *tdc)
 {
 	u32 wcount;
@@ -409,7 +141,7 @@ static void tegra_dma_global_pause(struct tegra_dma_channel *tdc,
 	if (tdc->tdma->global_pause_count == 0) {
 		tdma_write(tdma, TEGRA_APBDMA_GENERAL, 0);
 		if (wait_for_burst_complete)
-			udelay(TEGRA_APBDMA_BURST_COMPLETE_TIME);
+			udelay(tdma->chip_data->burst_time);
 	}
 
 	tdc->tdma->global_pause_count++;
@@ -475,7 +207,7 @@ static void tegra_dma_pause(struct tegra_dma_channel *tdc,
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_CSRE,
 				TEGRA_APBDMA_CHAN_CSRE_PAUSE);
 		if (wait_for_burst_complete)
-			udelay(TEGRA_APBDMA_BURST_COMPLETE_TIME);
+			udelay(tdma->chip_data->burst_time);
 	} else {
 		tegra_dma_global_pause(tdc, wait_for_burst_complete);
 	}
@@ -529,383 +261,6 @@ static void tegra_dma_start(struct tegra_dma_channel *tdc,
 				ch_regs->csr | TEGRA_APBDMA_CSR_ENB);
 }
 
-static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,
-		struct tegra_dma_sg_req *nsg_req)
-{
-	const struct tegra_dma_ops *ops = tdc->tdma->ops;
-	unsigned long status;
-
-	/*
-	 * The DMA controller reloads the new configuration for next transfer
-	 * after last burst of current transfer completes.
-	 * If there is no IEC status then this makes sure that last burst
-	 * has not be completed. There may be case that last burst is on
-	 * flight and so it can complete but because DMA is paused, it
-	 * will not generates interrupt as well as not reload the new
-	 * configuration.
-	 * If there is already IEC status then interrupt handler need to
-	 * load new configuration.
-	 */
-	ops->pause(tdc, false);
-	status = ops->irq_status(tdc);
-
-	/*
-	 * If interrupt is pending then do nothing as the ISR will handle
-	 * the programing for new request.
-	 */
-	if (status) {
-		dev_err(tdc2dev(tdc),
-			"Skipping new configuration as interrupt is pending\n");
-		ops->resume(tdc);
-		return;
-	}
-
-	/* Safe to program new configuration */
-	ops->program(tdc, nsg_req);
-	ops->resume(tdc);
-}
-
-static void tdc_start_head_req(struct tegra_dma_channel *tdc)
-{
-	const struct tegra_dma_ops *ops = tdc->tdma->ops;
-	struct tegra_dma_sg_req *sg_req;
-
-	if (list_empty(&tdc->pending_sg_req))
-		return;
-
-	sg_req = list_first_entry(&tdc->pending_sg_req,
-					typeof(*sg_req), node);
-	ops->start(tdc, sg_req);
-	sg_req->configured = true;
-	tdc->busy = true;
-}
-
-static void tdc_configure_next_head_desc(struct tegra_dma_channel *tdc)
-{
-	struct tegra_dma_sg_req *hsgreq;
-	struct tegra_dma_sg_req *hnsgreq;
-
-	if (list_empty(&tdc->pending_sg_req))
-		return;
-
-	hsgreq = list_first_entry(&tdc->pending_sg_req, typeof(*hsgreq), node);
-	if (!list_is_last(&hsgreq->node, &tdc->pending_sg_req)) {
-		hnsgreq = list_first_entry(&hsgreq->node,
-					typeof(*hnsgreq), node);
-		tegra_dma_configure_for_next(tdc, hnsgreq);
-	}
-}
-
-static inline int get_current_xferred_count(struct tegra_dma_sg_req *sg_req,
-					    unsigned long wcount)
-{
-	return sg_req->req_len - wcount;
-}
-
-static void tegra_dma_abort_all(struct tegra_dma_channel *tdc)
-{
-	struct tegra_dma_sg_req *sgreq;
-	struct tegra_dma_desc *dma_desc;
-
-	while (!list_empty(&tdc->pending_sg_req)) {
-		sgreq = list_first_entry(&tdc->pending_sg_req,
-						typeof(*sgreq), node);
-		list_move_tail(&sgreq->node, &tdc->free_sg_req);
-		if (sgreq->last_sg) {
-			dma_desc = sgreq->dma_desc;
-			dma_desc->dma_status = DMA_ERROR;
-			list_add_tail(&dma_desc->node, &tdc->free_dma_desc);
-
-			/* Add in cb list if it is not there. */
-			if (!dma_desc->cb_count)
-				list_add_tail(&dma_desc->cb_node,
-							&tdc->cb_desc);
-			dma_desc->cb_count++;
-		}
-	}
-	tdc->isr_handler = NULL;
-}
-
-static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
-		struct tegra_dma_sg_req *last_sg_req, bool to_terminate)
-{
-	const struct tegra_dma_ops *ops = tdc->tdma->ops;
-	struct tegra_dma_sg_req *hsgreq = NULL;
-
-	if (list_empty(&tdc->pending_sg_req)) {
-		dev_err(tdc2dev(tdc), "Dma is running without req\n");
-		ops->stop(tdc);
-		return false;
-	}
-
-	/*
-	 * Check that head req on list should be in flight.
-	 * If it is not in flight then abort transfer as
-	 * looping of transfer can not continue.
-	 */
-	hsgreq = list_first_entry(&tdc->pending_sg_req, typeof(*hsgreq), node);
-	if (!hsgreq->configured) {
-		ops->stop(tdc);
-		dev_err(tdc2dev(tdc), "Error in dma transfer, aborting dma\n");
-		tegra_dma_abort_all(tdc);
-		return false;
-	}
-
-	/* Configure next request */
-	if (!to_terminate)
-		tdc_configure_next_head_desc(tdc);
-	return true;
-}
-
-static void handle_once_dma_done(struct tegra_dma_channel *tdc,
-	bool to_terminate)
-{
-	struct tegra_dma_sg_req *sgreq;
-	struct tegra_dma_desc *dma_desc;
-
-	tdc->busy = false;
-	sgreq = list_first_entry(&tdc->pending_sg_req, typeof(*sgreq), node);
-	dma_desc = sgreq->dma_desc;
-	dma_desc->bytes_transferred += sgreq->req_len;
-
-	list_del(&sgreq->node);
-	if (sgreq->last_sg) {
-		dma_desc->dma_status = DMA_COMPLETE;
-		dma_cookie_complete(&dma_desc->txd);
-		if (!dma_desc->cb_count)
-			list_add_tail(&dma_desc->cb_node, &tdc->cb_desc);
-		dma_desc->cb_count++;
-		list_add_tail(&dma_desc->node, &tdc->free_dma_desc);
-	}
-	list_add_tail(&sgreq->node, &tdc->free_sg_req);
-
-	/* Do not start DMA if it is going to be terminate */
-	if (to_terminate || list_empty(&tdc->pending_sg_req))
-		return;
-
-	tdc_start_head_req(tdc);
-}
-
-static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
-		bool to_terminate)
-{
-	struct tegra_dma_sg_req *sgreq;
-	struct tegra_dma_desc *dma_desc;
-	bool st;
-
-	sgreq = list_first_entry(&tdc->pending_sg_req, typeof(*sgreq), node);
-	dma_desc = sgreq->dma_desc;
-	dma_desc->bytes_transferred += sgreq->req_len;
-
-	/* Callback need to be call */
-	if (!dma_desc->cb_count)
-		list_add_tail(&dma_desc->cb_node, &tdc->cb_desc);
-	dma_desc->cb_count++;
-
-	/* If not last req then put at end of pending list */
-	if (!list_is_last(&sgreq->node, &tdc->pending_sg_req)) {
-		list_move_tail(&sgreq->node, &tdc->pending_sg_req);
-		sgreq->configured = false;
-		st = handle_continuous_head_request(tdc, sgreq, to_terminate);
-		if (!st)
-			dma_desc->dma_status = DMA_ERROR;
-	}
-}
-
-static void tegra_dma_tasklet(unsigned long data)
-{
-	struct tegra_dma_channel *tdc = (struct tegra_dma_channel *)data;
-	dma_async_tx_callback callback = NULL;
-	void *callback_param = NULL;
-	struct tegra_dma_desc *dma_desc;
-	unsigned long flags;
-	int cb_count;
-
-	spin_lock_irqsave(&tdc->lock, flags);
-	while (!list_empty(&tdc->cb_desc)) {
-		dma_desc  = list_first_entry(&tdc->cb_desc,
-					typeof(*dma_desc), cb_node);
-		list_del(&dma_desc->cb_node);
-		callback = dma_desc->txd.callback;
-		callback_param = dma_desc->txd.callback_param;
-		cb_count = dma_desc->cb_count;
-		dma_desc->cb_count = 0;
-		spin_unlock_irqrestore(&tdc->lock, flags);
-		while (cb_count-- && callback)
-			callback(callback_param);
-		spin_lock_irqsave(&tdc->lock, flags);
-	}
-	spin_unlock_irqrestore(&tdc->lock, flags);
-}
-
-static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
-{
-	struct tegra_dma_channel *tdc = dev_id;
-	const struct tegra_dma_ops *ops = tdc->tdma->ops;
-	unsigned long status;
-	unsigned long flags;
-
-	spin_lock_irqsave(&tdc->lock, flags);
-
-	status = ops->irq_clear(tdc);
-	if (status) {
-		tdc->isr_handler(tdc, false);
-		tasklet_schedule(&tdc->tasklet);
-		spin_unlock_irqrestore(&tdc->lock, flags);
-		return IRQ_HANDLED;
-	}
-
-	spin_unlock_irqrestore(&tdc->lock, flags);
-	dev_info(tdc2dev(tdc),
-		"Interrupt already served status 0x%08lx\n", status);
-	return IRQ_NONE;
-}
-
-static dma_cookie_t tegra_dma_tx_submit(struct dma_async_tx_descriptor *txd)
-{
-	struct tegra_dma_desc *dma_desc = txd_to_tegra_dma_desc(txd);
-	struct tegra_dma_channel *tdc = to_tegra_dma_chan(txd->chan);
-	unsigned long flags;
-	dma_cookie_t cookie;
-
-	spin_lock_irqsave(&tdc->lock, flags);
-	dma_desc->dma_status = DMA_IN_PROGRESS;
-	cookie = dma_cookie_assign(&dma_desc->txd);
-	list_splice_tail_init(&dma_desc->tx_list, &tdc->pending_sg_req);
-	spin_unlock_irqrestore(&tdc->lock, flags);
-	return cookie;
-}
-
-static void tegra_dma_issue_pending(struct dma_chan *dc)
-{
-	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-	unsigned long flags;
-
-	spin_lock_irqsave(&tdc->lock, flags);
-	if (list_empty(&tdc->pending_sg_req)) {
-		dev_err(tdc2dev(tdc), "No DMA request\n");
-		goto end;
-	}
-	if (!tdc->busy) {
-		tdc_start_head_req(tdc);
-
-		/* Continuous single mode: Configure next req */
-		if (tdc->cyclic) {
-			/*
-			 * Wait for 1 burst time for configure DMA for
-			 * next transfer.
-			 */
-			udelay(TEGRA_APBDMA_BURST_COMPLETE_TIME);
-			tdc_configure_next_head_desc(tdc);
-		}
-	}
-end:
-	spin_unlock_irqrestore(&tdc->lock, flags);
-}
-
-static int tegra_dma_terminate_all(struct dma_chan *dc)
-{
-	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-	const struct tegra_dma_ops *ops = tdc->tdma->ops;
-	struct tegra_dma_sg_req *sgreq;
-	struct tegra_dma_desc *dma_desc;
-	unsigned long flags;
-	unsigned long status;
-	unsigned long wcount;
-	bool was_busy;
-
-	spin_lock_irqsave(&tdc->lock, flags);
-	if (list_empty(&tdc->pending_sg_req)) {
-		spin_unlock_irqrestore(&tdc->lock, flags);
-		return 0;
-	}
-
-	if (!tdc->busy)
-		goto skip_dma_stop;
-
-	/* Pause DMA before checking the queue status */
-	ops->pause(tdc, true);
-
-	status = ops->irq_status(tdc);
-	if (status) {
-		dev_dbg(tdc2dev(tdc), "%s():handling isr\n", __func__);
-		tdc->isr_handler(tdc, true);
-	}
-
-	wcount = ops->get_xfer_count(tdc);
-
-	was_busy = tdc->busy;
-	ops->stop(tdc);
-
-	if (!list_empty(&tdc->pending_sg_req) && was_busy) {
-		sgreq = list_first_entry(&tdc->pending_sg_req,
-					typeof(*sgreq), node);
-		sgreq->dma_desc->bytes_transferred +=
-				get_current_xferred_count(sgreq, wcount);
-	}
-	ops->resume(tdc);
-
-skip_dma_stop:
-	tegra_dma_abort_all(tdc);
-
-	while (!list_empty(&tdc->cb_desc)) {
-		dma_desc  = list_first_entry(&tdc->cb_desc,
-					typeof(*dma_desc), cb_node);
-		list_del(&dma_desc->cb_node);
-		dma_desc->cb_count = 0;
-	}
-	spin_unlock_irqrestore(&tdc->lock, flags);
-	return 0;
-}
-
-static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
-	dma_cookie_t cookie, struct dma_tx_state *txstate)
-{
-	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-	struct tegra_dma_desc *dma_desc;
-	struct tegra_dma_sg_req *sg_req;
-	enum dma_status ret;
-	unsigned long flags;
-	unsigned int residual;
-
-	ret = dma_cookie_status(dc, cookie, txstate);
-	if (ret == DMA_COMPLETE)
-		return ret;
-
-	spin_lock_irqsave(&tdc->lock, flags);
-
-	/* Check on wait_ack desc status */
-	list_for_each_entry(dma_desc, &tdc->free_dma_desc, node) {
-		if (dma_desc->txd.cookie == cookie) {
-			residual =  dma_desc->bytes_requested -
-					(dma_desc->bytes_transferred %
-						dma_desc->bytes_requested);
-			dma_set_residue(txstate, residual);
-			ret = dma_desc->dma_status;
-			spin_unlock_irqrestore(&tdc->lock, flags);
-			return ret;
-		}
-	}
-
-	/* Check in pending list */
-	list_for_each_entry(sg_req, &tdc->pending_sg_req, node) {
-		dma_desc = sg_req->dma_desc;
-		if (dma_desc->txd.cookie == cookie) {
-			residual =  dma_desc->bytes_requested -
-					(dma_desc->bytes_transferred %
-						dma_desc->bytes_requested);
-			dma_set_residue(txstate, residual);
-			ret = dma_desc->dma_status;
-			spin_unlock_irqrestore(&tdc->lock, flags);
-			return ret;
-		}
-	}
-
-	dev_dbg(tdc2dev(tdc), "cookie %d does not found\n", cookie);
-	spin_unlock_irqrestore(&tdc->lock, flags);
-	return ret;
-}
-
 static inline int get_bus_width(struct tegra_dma_channel *tdc,
 		enum dma_slave_buswidth slave_bw)
 {
@@ -1063,259 +418,6 @@ static void tegra_dma_set_xfer_params(struct tegra_dma_channel *tdc,
 	sg_req->req_len = len;
 }
 
-static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
-	struct dma_chan *dc, struct scatterlist *sgl, unsigned int sg_len,
-	enum dma_transfer_direction direction, unsigned long flags,
-	void *context)
-{
-	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-	const struct tegra_dma_ops *ops = tdc->tdma->ops;
-	struct tegra_dma_desc *dma_desc;
-	unsigned int i;
-	struct scatterlist *sg;
-	struct list_head req_list;
-	struct tegra_dma_sg_req sg_base, *sg_req = NULL;
-
-	if (!tdc->config_init) {
-		dev_err(tdc2dev(tdc), "dma channel is not configured\n");
-		return NULL;
-	}
-	if (sg_len < 1) {
-		dev_err(tdc2dev(tdc), "Invalid segment length %d\n", sg_len);
-		return NULL;
-	}
-
-	if (ops->get_xfer_params_sg(tdc, &sg_base, direction, flags) < 0)
-		return NULL;
-
-	INIT_LIST_HEAD(&req_list);
-
-	dma_desc = tegra_dma_desc_get(tdc);
-	if (!dma_desc) {
-		dev_err(tdc2dev(tdc), "Dma descriptors not available\n");
-		return NULL;
-	}
-	INIT_LIST_HEAD(&dma_desc->tx_list);
-	INIT_LIST_HEAD(&dma_desc->cb_node);
-	dma_desc->cb_count = 0;
-	dma_desc->bytes_requested = 0;
-	dma_desc->bytes_transferred = 0;
-	dma_desc->dma_status = DMA_IN_PROGRESS;
-
-	/* Make transfer requests */
-	for_each_sg(sgl, sg, sg_len, i) {
-		u32 len, mem;
-
-		mem = sg_dma_address(sg);
-		len = sg_dma_len(sg);
-
-		if ((len & 3) || (mem & 3) ||
-				(len > tdc->tdma->chip_data->max_dma_count)) {
-			dev_err(tdc2dev(tdc),
-				"Dma length/memory address is not supported\n");
-			tegra_dma_desc_put(tdc, dma_desc);
-			return NULL;
-		}
-
-		sg_req = tegra_dma_sg_req_get(tdc);
-		if (!sg_req) {
-			dev_err(tdc2dev(tdc), "Dma sg-req not available\n");
-			tegra_dma_desc_put(tdc, dma_desc);
-			return NULL;
-		}
-
-		dma_desc->bytes_requested += len;
-
-		ops->set_xfer_params(tdc, sg_req, &sg_base, direction, mem,
-				     len);
-		sg_req->dma_desc = dma_desc;
-
-		list_add_tail(&sg_req->node, &dma_desc->tx_list);
-	}
-	sg_req->last_sg = true;
-	if (flags & DMA_CTRL_ACK)
-		dma_desc->txd.flags = DMA_CTRL_ACK;
-
-	/*
-	 * Make sure that mode should not be conflicting with currently
-	 * configured mode.
-	 */
-	if (!tdc->isr_handler) {
-		tdc->isr_handler = handle_once_dma_done;
-		tdc->cyclic = false;
-	} else {
-		if (tdc->cyclic) {
-			dev_err(tdc2dev(tdc), "DMA configured in cyclic mode\n");
-			tegra_dma_desc_put(tdc, dma_desc);
-			return NULL;
-		}
-	}
-
-	return &dma_desc->txd;
-}
-
-static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
-	struct dma_chan *dc, dma_addr_t buf_addr, size_t buf_len,
-	size_t period_len, enum dma_transfer_direction direction,
-	unsigned long flags)
-{
-	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-	const struct tegra_dma_ops *ops = tdc->tdma->ops;
-	struct tegra_dma_desc *dma_desc = NULL;
-	struct tegra_dma_sg_req sg_base, *sg_req = NULL;
-	int len;
-	size_t remain_len;
-	dma_addr_t mem = buf_addr;
-
-	if (!buf_len || !period_len) {
-		dev_err(tdc2dev(tdc), "Invalid buffer/period len\n");
-		return NULL;
-	}
-
-	if (!tdc->config_init) {
-		dev_err(tdc2dev(tdc), "DMA slave is not configured\n");
-		return NULL;
-	}
-
-	/*
-	 * We allow to take more number of requests till DMA is
-	 * not started. The driver will loop over all requests.
-	 * Once DMA is started then new requests can be queued only after
-	 * terminating the DMA.
-	 */
-	if (tdc->busy) {
-		dev_err(tdc2dev(tdc), "Request not allowed when dma running\n");
-		return NULL;
-	}
-
-	/*
-	 * We only support cycle transfer when buf_len is multiple of
-	 * period_len.
-	 */
-	if (buf_len % period_len) {
-		dev_err(tdc2dev(tdc), "buf_len is not multiple of period_len\n");
-		return NULL;
-	}
-
-	len = period_len;
-	if ((len & 3) || (buf_addr & 3) ||
-			(len > tdc->tdma->chip_data->max_dma_count)) {
-		dev_err(tdc2dev(tdc), "Req len/mem address is not correct\n");
-		return NULL;
-	}
-
-	if (ops->get_xfer_params_cyclic(tdc, &sg_base, direction, flags) < 0)
-		return NULL;
-
-	dma_desc = tegra_dma_desc_get(tdc);
-	if (!dma_desc) {
-		dev_err(tdc2dev(tdc), "not enough descriptors available\n");
-		return NULL;
-	}
-
-	INIT_LIST_HEAD(&dma_desc->tx_list);
-	INIT_LIST_HEAD(&dma_desc->cb_node);
-	dma_desc->cb_count = 0;
-
-	dma_desc->bytes_transferred = 0;
-	dma_desc->bytes_requested = buf_len;
-	remain_len = buf_len;
-
-	/* Split transfer equal to period size */
-	while (remain_len) {
-		sg_req = tegra_dma_sg_req_get(tdc);
-		if (!sg_req) {
-			dev_err(tdc2dev(tdc), "Dma sg-req not available\n");
-			tegra_dma_desc_put(tdc, dma_desc);
-			return NULL;
-		}
-
-		ops->set_xfer_params(tdc, sg_req, &sg_base, direction, mem,
-				     len);
-		sg_req->dma_desc = dma_desc;
-
-		list_add_tail(&sg_req->node, &dma_desc->tx_list);
-		remain_len -= len;
-		mem += len;
-	}
-	sg_req->last_sg = true;
-	if (flags & DMA_CTRL_ACK)
-		dma_desc->txd.flags = DMA_CTRL_ACK;
-
-	/*
-	 * Make sure that mode should not be conflicting with currently
-	 * configured mode.
-	 */
-	if (!tdc->isr_handler) {
-		tdc->isr_handler = handle_cont_sngl_cycle_dma_done;
-		tdc->cyclic = true;
-	} else {
-		if (!tdc->cyclic) {
-			dev_err(tdc2dev(tdc), "DMA configuration conflict\n");
-			tegra_dma_desc_put(tdc, dma_desc);
-			return NULL;
-		}
-	}
-
-	return &dma_desc->txd;
-}
-
-static int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
-{
-	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-	struct tegra_dma *tdma = tdc->tdma;
-
-	dma_cookie_init(&tdc->dma_chan);
-	tdc->config_init = false;
-
-	return pm_runtime_get_sync(tdma->dev);
-}
-
-static void tegra_dma_free_chan_resources(struct dma_chan *dc)
-{
-	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-	struct tegra_dma *tdma = tdc->tdma;
-
-	struct tegra_dma_desc *dma_desc;
-	struct tegra_dma_sg_req *sg_req;
-	struct list_head dma_desc_list;
-	struct list_head sg_req_list;
-	unsigned long flags;
-
-	INIT_LIST_HEAD(&dma_desc_list);
-	INIT_LIST_HEAD(&sg_req_list);
-
-	dev_dbg(tdc2dev(tdc), "Freeing channel %d\n", tdc->id);
-
-	if (tdc->busy)
-		tegra_dma_terminate_all(dc);
-
-	spin_lock_irqsave(&tdc->lock, flags);
-	list_splice_init(&tdc->pending_sg_req, &sg_req_list);
-	list_splice_init(&tdc->free_sg_req, &sg_req_list);
-	list_splice_init(&tdc->free_dma_desc, &dma_desc_list);
-	INIT_LIST_HEAD(&tdc->cb_desc);
-	tdc->config_init = false;
-	tdc->isr_handler = NULL;
-	spin_unlock_irqrestore(&tdc->lock, flags);
-
-	while (!list_empty(&dma_desc_list)) {
-		dma_desc = list_first_entry(&dma_desc_list,
-					typeof(*dma_desc), node);
-		list_del(&dma_desc->node);
-		kfree(dma_desc);
-	}
-
-	while (!list_empty(&sg_req_list)) {
-		sg_req = list_first_entry(&sg_req_list, typeof(*sg_req), node);
-		list_del(&sg_req->node);
-		kfree(sg_req);
-	}
-	pm_runtime_put(tdma->dev);
-
-	tdc->slave_id = 0;
-}
-
 static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
 					   struct of_dma *ofdma)
 {
@@ -1335,6 +437,7 @@ static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
 
 /* Tegra20 specific DMA controller information */
 static const struct tegra_dma_chip_data tegra20_dma_chip_data = {
+	.burst_time		= TEGRA_APBDMA_BURST_COMPLETE_TIME,
 	.nr_channels		= 16,
 	.channel_reg_size	= 0x20,
 	.max_dma_count		= 1024UL * 64,
@@ -1344,6 +447,7 @@ static const struct tegra_dma_chip_data tegra20_dma_chip_data = {
 
 /* Tegra30 specific DMA controller information */
 static const struct tegra_dma_chip_data tegra30_dma_chip_data = {
+	.burst_time		= TEGRA_APBDMA_BURST_COMPLETE_TIME,
 	.nr_channels		= 32,
 	.channel_reg_size	= 0x20,
 	.max_dma_count		= 1024UL * 64,
@@ -1353,6 +457,7 @@ static const struct tegra_dma_chip_data tegra30_dma_chip_data = {
 
 /* Tegra114 specific DMA controller information */
 static const struct tegra_dma_chip_data tegra114_dma_chip_data = {
+	.burst_time		= TEGRA_APBDMA_BURST_COMPLETE_TIME,
 	.nr_channels		= 32,
 	.channel_reg_size	= 0x20,
 	.max_dma_count		= 1024UL * 64,
@@ -1362,6 +467,7 @@ static const struct tegra_dma_chip_data tegra114_dma_chip_data = {
 
 /* Tegra148 specific DMA controller information */
 static const struct tegra_dma_chip_data tegra148_dma_chip_data = {
+	.burst_time		= TEGRA_APBDMA_BURST_COMPLETE_TIME,
 	.nr_channels		= 32,
 	.channel_reg_size	= 0x40,
 	.max_dma_count		= 1024UL * 64,
-- 
2.1.4
