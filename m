From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 12/16] dmaengine: tegra-apb: Clean up suspend-resume
Date: Thu, 30 Jan 2020 07:38:00 +0300
Message-ID: <20200130043804.32243-13-digetx@gmail.com>
References: <20200130043804.32243-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200130043804.32243-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

It is enough to check whether hardware is busy on suspend and to reset
it across of suspend-resume because channel's configuration is fully
re-programmed on each DMA transaction anyways and because save-restore
of an active channel won't end up well without pausing transfer prior to
saving of the state (note that all channels shall be idling at the time of
suspend, so save-restore is not needed at all).

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 133 ++++++++++++++++++----------------
 1 file changed, 69 insertions(+), 64 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 0ee28d8e3c96..4a371891b7c4 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1401,6 +1401,36 @@ static const struct tegra_dma_chip_data tegra148_dma_chip_data = {
 	.support_separate_wcount_reg = true,
 };
 
+static int tegra_dma_init_hw(struct tegra_dma *tdma)
+{
+	int err;
+
+	err = reset_control_assert(tdma->rst);
+	if (err) {
+		dev_err(tdma->dev, "failed to assert reset: %d\n", err);
+		return err;
+	}
+
+	err = clk_enable(tdma->dma_clk);
+	if (err) {
+		dev_err(tdma->dev, "failed to enable clk: %d\n", err);
+		return err;
+	}
+
+	/* reset DMA controller */
+	udelay(2);
+	reset_control_deassert(tdma->rst);
+
+	/* enable global DMA registers */
+	tdma_write(tdma, TEGRA_APBDMA_GENERAL, TEGRA_APBDMA_GENERAL_ENABLE);
+	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
+	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFF);
+
+	clk_disable(tdma->dma_clk);
+
+	return 0;
+}
+
 static int tegra_dma_probe(struct platform_device *pdev)
 {
 	const struct tegra_dma_chip_data *cdata;
@@ -1442,25 +1472,13 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = tegra_dma_init_hw(tdma);
+	if (ret)
+		goto err_clk_unprepare;
+
 	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0)
-		goto err_pm_disable;
-
-	/* Reset DMA controller */
-	reset_control_assert(tdma->rst);
-	udelay(2);
-	reset_control_deassert(tdma->rst);
-
-	/* Enable global DMA registers */
-	tdma_write(tdma, TEGRA_APBDMA_GENERAL, TEGRA_APBDMA_GENERAL_ENABLE);
-	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
-	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFFul);
-
-	pm_runtime_put(&pdev->dev);
-
 	INIT_LIST_HEAD(&tdma->dma_dev.channels);
 	for (i = 0; i < cdata->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
@@ -1558,6 +1576,8 @@ static int tegra_dma_probe(struct platform_device *pdev)
 
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
+
+err_clk_unprepare:
 	clk_unprepare(tdma->dma_clk);
 
 	return ret;
@@ -1577,26 +1597,6 @@ static int tegra_dma_remove(struct platform_device *pdev)
 static int tegra_dma_runtime_suspend(struct device *dev)
 {
 	struct tegra_dma *tdma = dev_get_drvdata(dev);
-	unsigned int i;
-
-	tdma->reg_gen = tdma_read(tdma, TEGRA_APBDMA_GENERAL);
-	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
-		struct tegra_dma_channel *tdc = &tdma->channels[i];
-		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
-
-		/* Only save the state of DMA channels that are in use */
-		if (!tdc->config_init)
-			continue;
-
-		ch_reg->csr = tdc_read(tdc, TEGRA_APBDMA_CHAN_CSR);
-		ch_reg->ahb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_AHBPTR);
-		ch_reg->apb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_APBPTR);
-		ch_reg->ahb_seq = tdc_read(tdc, TEGRA_APBDMA_CHAN_AHBSEQ);
-		ch_reg->apb_seq = tdc_read(tdc, TEGRA_APBDMA_CHAN_APBSEQ);
-		if (tdma->chip_data->support_separate_wcount_reg)
-			ch_reg->wcount = tdc_read(tdc,
-						  TEGRA_APBDMA_CHAN_WCOUNT);
-	}
 
 	clk_disable(tdma->dma_clk);
 
@@ -1606,46 +1606,51 @@ static int tegra_dma_runtime_suspend(struct device *dev)
 static int tegra_dma_runtime_resume(struct device *dev)
 {
 	struct tegra_dma *tdma = dev_get_drvdata(dev);
-	unsigned int i;
-	int ret;
 
-	ret = clk_enable(tdma->dma_clk);
-	if (ret < 0) {
-		dev_err(dev, "clk_enable failed: %d\n", ret);
-		return ret;
-	}
+	return clk_enable(tdma->dma_clk);
+}
 
-	tdma_write(tdma, TEGRA_APBDMA_GENERAL, tdma->reg_gen);
-	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
-	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFFul);
+static int __maybe_unused tegra_dma_dev_suspend(struct device *dev)
+{
+	struct tegra_dma *tdma = dev_get_drvdata(dev);
+	unsigned long flags;
+	unsigned int i;
+	bool busy;
 
 	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
-		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
-
-		/* Only restore the state of DMA channels that are in use */
-		if (!tdc->config_init)
-			continue;
-
-		if (tdma->chip_data->support_separate_wcount_reg)
-			tdc_write(tdc, TEGRA_APBDMA_CHAN_WCOUNT,
-				  ch_reg->wcount);
-		tdc_write(tdc, TEGRA_APBDMA_CHAN_APBSEQ, ch_reg->apb_seq);
-		tdc_write(tdc, TEGRA_APBDMA_CHAN_APBPTR, ch_reg->apb_ptr);
-		tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBSEQ, ch_reg->ahb_seq);
-		tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBPTR, ch_reg->ahb_ptr);
-		tdc_write(tdc, TEGRA_APBDMA_CHAN_CSR,
-			  ch_reg->csr & ~TEGRA_APBDMA_CSR_ENB);
+
+		tasklet_kill(&tdc->tasklet);
+
+		spin_lock_irqsave(&tdc->lock, flags);
+		busy = tdc->busy;
+		spin_unlock_irqrestore(&tdc->lock, flags);
+
+		if (busy) {
+			dev_err(tdma->dev, "channel %u busy\n", i);
+			return -EBUSY;
+		}
 	}
 
-	return 0;
+	return pm_runtime_force_suspend(dev);
+}
+
+static int __maybe_unused tegra_dma_dev_resume(struct device *dev)
+{
+	struct tegra_dma *tdma = dev_get_drvdata(dev);
+	int err;
+
+	err = tegra_dma_init_hw(tdma);
+	if (err)
+		return err;
+
+	return pm_runtime_force_resume(dev);
 }
 
 static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_dma_runtime_suspend, tegra_dma_runtime_resume,
 			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_resume)
 };
 
 static const struct of_device_id tegra_dma_of_match[] = {
-- 
2.24.0
