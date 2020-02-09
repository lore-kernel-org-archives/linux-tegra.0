From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v8 07/19] dmaengine: tegra-apb: Use devm_request_irq
Date: Sun,  9 Feb 2020 19:33:44 +0300
Message-ID: <20200209163356.6439-8-digetx@gmail.com>
References: <20200209163356.6439-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200209163356.6439-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Use resource-managed variant of request_irq for brevity.

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index f44291207928..dff21e80ffa4 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -182,7 +182,6 @@ struct tegra_dma_channel {
 	char			name[12];
 	bool			config_init;
 	int			id;
-	int			irq;
 	void __iomem		*chan_addr;
 	spinlock_t		lock;
 	bool			busy;
@@ -1380,7 +1379,6 @@ static const struct tegra_dma_chip_data tegra148_dma_chip_data = {
 
 static int tegra_dma_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct tegra_dma *tdma;
 	int ret;
 	int i;
@@ -1446,25 +1444,27 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&tdma->dma_dev.channels);
 	for (i = 0; i < cdata->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
+		int irq;
 
 		tdc->chan_addr = tdma->base_addr +
 				 TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET +
 				 (i * cdata->channel_reg_size);
 
-		res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
-		if (!res) {
-			ret = -EINVAL;
+		irq = platform_get_irq(pdev, i);
+		if (irq < 0) {
+			ret = irq;
 			dev_err(&pdev->dev, "No irq resource for chan %d\n", i);
-			goto err_irq;
+			goto err_pm_disable;
 		}
-		tdc->irq = res->start;
+
 		snprintf(tdc->name, sizeof(tdc->name), "apbdma.%d", i);
-		ret = request_irq(tdc->irq, tegra_dma_isr, 0, tdc->name, tdc);
+		ret = devm_request_irq(&pdev->dev, irq, tegra_dma_isr, 0,
+				       tdc->name, tdc);
 		if (ret) {
 			dev_err(&pdev->dev,
 				"request_irq failed with err %d channel %d\n",
 				ret, i);
-			goto err_irq;
+			goto err_pm_disable;
 		}
 
 		tdc->dma_chan.device = &tdma->dma_dev;
@@ -1517,7 +1517,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"Tegra20 APB DMA driver registration failed %d\n", ret);
-		goto err_irq;
+		goto err_pm_disable;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node,
@@ -1534,13 +1534,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma_dev:
 	dma_async_device_unregister(&tdma->dma_dev);
-err_irq:
-	while (--i >= 0) {
-		struct tegra_dma_channel *tdc = &tdma->channels[i];
-
-		free_irq(tdc->irq, tdc);
-	}
-
+err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra_dma_runtime_suspend(&pdev->dev);
@@ -1550,16 +1544,9 @@ static int tegra_dma_probe(struct platform_device *pdev)
 static int tegra_dma_remove(struct platform_device *pdev)
 {
 	struct tegra_dma *tdma = platform_get_drvdata(pdev);
-	int i;
-	struct tegra_dma_channel *tdc;
 
 	dma_async_device_unregister(&tdma->dma_dev);
 
-	for (i = 0; i < tdma->chip_data->nr_channels; ++i) {
-		tdc = &tdma->channels[i];
-		free_irq(tdc->irq, tdc);
-	}
-
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra_dma_runtime_suspend(&pdev->dev);
-- 
2.24.0
