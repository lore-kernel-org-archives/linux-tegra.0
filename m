From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 6/8] dmaengine: mxs-dma: Let the core do the device node validation
Date: Mon, 20 May 2019 19:32:19 +0800
Message-ID: <15bd5303ecf61f3a3aacd0b078d13f042dea73c6.1558351667.git.baolin.wang@linaro.org>
References: <cover.1558351667.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1558351667.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1558351667.git.baolin.wang@linaro.org>
References: <cover.1558351667.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dan.j.williams@intel.com, vkoul@kernel.org
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, wsa+renesas@sang-engineering.com, jroedel@suse.de, vincent.guittot@linaro.org, baolin.wang@linaro.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Let the DMA engine core do the device node validation instead of drivers.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/dma/mxs-dma.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 22cc7f6..8ce5e79 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -716,7 +716,6 @@ static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
 }
 
 struct mxs_dma_filter_param {
-	struct device_node *of_node;
 	unsigned int chan_id;
 };
 
@@ -727,9 +726,6 @@ static bool mxs_dma_filter_fn(struct dma_chan *chan, void *fn_param)
 	struct mxs_dma_engine *mxs_dma = mxs_chan->mxs_dma;
 	int chan_irq;
 
-	if (mxs_dma->dma_device.dev->of_node != param->of_node)
-		return false;
-
 	if (chan->chan_id != param->chan_id)
 		return false;
 
@@ -752,13 +748,13 @@ static struct dma_chan *mxs_dma_xlate(struct of_phandle_args *dma_spec,
 	if (dma_spec->args_count != 1)
 		return NULL;
 
-	param.of_node = ofdma->of_node;
 	param.chan_id = dma_spec->args[0];
 
 	if (param.chan_id >= mxs_dma->nr_channels)
 		return NULL;
 
-	return dma_request_channel(mask, mxs_dma_filter_fn, &param);
+	return __dma_request_channel(&mask, mxs_dma_filter_fn, &param,
+				     ofdma->of_node);
 }
 
 static int __init mxs_dma_probe(struct platform_device *pdev)
-- 
1.7.9.5
