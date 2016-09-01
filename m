From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dmaengine: tegra210-adma: Add some necessary dev_err() before error out
Date: Thu,  1 Sep 2016 15:43:17 -0700
Message-ID: <1472769797-31650-2-git-send-email-nicoleotsuka@gmail.com>
References: <1472769797-31650-1-git-send-email-nicoleotsuka@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472769797-31650-1-git-send-email-nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

There could be something going wrong during the probe() part,
so it would not be ideal for debugging by silently returning.

This patches adds some necessary dev_err() to give the hints.

Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/tegra210-adma.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index b10cbaa..09b46f7 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -218,8 +218,10 @@ static int tegra_adma_init(struct tegra_adma *tdma)
 	ret = readx_poll_timeout(readl,
 				 tdma->base_addr + ADMA_GLOBAL_SOFT_RESET,
 				 status, status == 0, 20, 10000);
-	if (ret)
+	if (ret) {
+		dev_err(tdma->dev, "Timeout waiting for soft reset\n");
 		return ret;
+	}
 
 	/* Enable global ADMA registers */
 	tdma_write(tdma, ADMA_GLOBAL_CMD, 1);
@@ -581,6 +583,7 @@ static int tegra_adma_alloc_chan_resources(struct dma_chan *dc)
 
 	ret = pm_runtime_get_sync(tdc2dev(tdc));
 	if (ret < 0) {
+		dev_err(tdc2dev(tdc), "failed to get pm runtime: %d\n", ret);
 		free_irq(tdc->irq, tdc);
 		return ret;
 	}
@@ -647,8 +650,10 @@ static int tegra_adma_runtime_resume(struct device *dev)
 	int ret;
 
 	ret = pm_clk_resume(dev);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "failed to resume pm clock: %d\n", ret);
 		return ret;
+	}
 
 	tdma_write(tdma, ADMA_GLOBAL_CMD, tdma->global_cmd);
 
@@ -718,6 +723,9 @@ static int tegra_adma_probe(struct platform_device *pdev)
 
 		tdc->irq = of_irq_get(pdev->dev.of_node, i);
 		if (tdc->irq < 0) {
+			dev_err(&pdev->dev,
+				"failed to get irq for channel %d: %d\n",
+				i + 1, tdc->irq);
 			ret = tdc->irq;
 			goto irq_dispose;
 		}
-- 
2.1.4
