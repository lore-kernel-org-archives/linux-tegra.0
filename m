From: Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dma: tegra: Use runtime_pm for clk enable/disable
Date: Wed, 11 Dec 2013 14:19:16 +0530
Message-ID: <1386751756-12583-1-git-send-email-bandik@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Used runtime_pm APIs for clock enabling/disabling.
Made changes such that clock is not enabled during
idle. Also moved the usage of clk prepare/unprepare
such that they are not called in isr context.

Signed-off-by: Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Verified with audio playback on Dalmore and check runtime status.

 drivers/dma/tegra20-apb-dma.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 73654e3..355572d 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1,7 +1,7 @@
 /*
  * DMA driver for Nvidia's Tegra20 APB DMA controller.
  *
- * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2012-13, NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -580,6 +580,11 @@ static void handle_once_dma_done(struct tegra_dma_channel *tdc,
 	list_add_tail(&sgreq->node, &tdc->free_sg_req);
 
 	/* Do not start DMA if it is going to be terminate */
+	if (list_empty(&tdc->pending_sg_req) && (!to_terminate)) {
+		clk_disable(tdc->tdma->dma_clk);
+		pm_runtime_put(tdc->tdma->dev);
+	}
+
 	if (to_terminate || list_empty(&tdc->pending_sg_req))
 		return;
 
@@ -682,12 +687,21 @@ static void tegra_dma_issue_pending(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&tdc->lock, flags);
 	if (list_empty(&tdc->pending_sg_req)) {
 		dev_err(tdc2dev(tdc), "No DMA request\n");
 		goto end;
 	}
+
+	pm_runtime_get(tdc->tdma->dev);
+	ret = clk_enable(tdc->tdma->dma_clk);
+	if (ret < 0) {
+		dev_err(tdc2dev(tdc), "clk_enable failed: %d\n", ret);
+		return;
+	}
+
 	if (!tdc->busy) {
 		tdc_start_head_req(tdc);
 
@@ -744,6 +758,8 @@ static void tegra_dma_terminate_all(struct dma_chan *dc)
 				get_current_xferred_count(tdc, sgreq, status);
 	}
 	tegra_dma_resume(tdc);
+	clk_disable(tdc->tdma->dma_clk);
+	pm_runtime_put(tdc->tdma->dev);
 
 skip_dma_stop:
 	tegra_dma_abort_all(tdc);
@@ -1153,22 +1169,16 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 static int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-	struct tegra_dma *tdma = tdc->tdma;
-	int ret;
 
+	clk_prepare(tdc->tdma->dma_clk);
 	dma_cookie_init(&tdc->dma_chan);
 	tdc->config_init = false;
-	ret = clk_prepare_enable(tdma->dma_clk);
-	if (ret < 0)
-		dev_err(tdc2dev(tdc), "clk_prepare_enable failed: %d\n", ret);
-	return ret;
+	return 0;
 }
 
 static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-	struct tegra_dma *tdma = tdc->tdma;
-
 	struct tegra_dma_desc *dma_desc;
 	struct tegra_dma_sg_req *sg_req;
 	struct list_head dma_desc_list;
@@ -1182,7 +1192,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 
 	if (tdc->busy)
 		tegra_dma_terminate_all(dc);
-
+	clk_unprepare(tdc->tdma->dma_clk);
 	spin_lock_irqsave(&tdc->lock, flags);
 	list_splice_init(&tdc->pending_sg_req, &sg_req_list);
 	list_splice_init(&tdc->free_sg_req, &sg_req_list);
@@ -1204,7 +1214,6 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 		list_del(&sg_req->node);
 		kfree(sg_req);
 	}
-	clk_disable_unprepare(tdma->dma_clk);
 }
 
 /* Tegra20 specific DMA controller information */
@@ -1418,7 +1427,7 @@ static int tegra_dma_runtime_suspend(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct tegra_dma *tdma = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(tdma->dma_clk);
+	clk_disable(tdma->dma_clk);
 	return 0;
 }
 
@@ -1428,7 +1437,7 @@ static int tegra_dma_runtime_resume(struct device *dev)
 	struct tegra_dma *tdma = platform_get_drvdata(pdev);
 	int ret;
 
-	ret = clk_prepare_enable(tdma->dma_clk);
+	ret = clk_enable(tdma->dma_clk);
 	if (ret < 0) {
 		dev_err(dev, "clk_enable failed: %d\n", ret);
 		return ret;
-- 
1.8.1.5
