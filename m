From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 3/8] dmaengine: imx-sdma: Let the core do the device node validation
Date: Tue,  7 May 2019 14:09:40 +0800
Message-ID: <60acb5443a9bc18789bd86d6722f4726bf372fbc.1557206859.git.baolin.wang@linaro.org>
References: <cover.1557206859.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1557206859.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1557206859.git.baolin.wang@linaro.org>
References: <cover.1557206859.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dan.j.williams@intel.com, vkoul@kernel.org
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, Zubair.Kakakhel@imgtec.com, wsa+renesas@sang-engineering.com, jroedel@suse.de, vincent.guittot@linaro.org, baolin.wang@linaro.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Let the DMA engine core do the device node validation instead of drivers.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/dma/imx-sdma.c                |    9 ++-------
 include/linux/platform_data/dma-imx.h |    1 -
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 5f3c137..1a11118 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -1921,16 +1921,11 @@ static int sdma_init(struct sdma_engine *sdma)
 static bool sdma_filter_fn(struct dma_chan *chan, void *fn_param)
 {
 	struct sdma_channel *sdmac = to_sdma_chan(chan);
-	struct sdma_engine *sdma = sdmac->sdma;
 	struct imx_dma_data *data = fn_param;
 
 	if (!imx_dma_is_general_purpose(chan))
 		return false;
 
-	/* return false if it's not the right device */
-	if (sdma->dev->of_node != data->of_node)
-		return false;
-
 	sdmac->data = *data;
 	chan->private = &sdmac->data;
 
@@ -1958,9 +1953,9 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
 	 * be set to sdmac->event_id1.
 	 */
 	data.dma_request2 = 0;
-	data.of_node = ofdma->of_node;
 
-	return dma_request_channel(mask, sdma_filter_fn, &data);
+	return __dma_request_channel(&mask, sdma_filter_fn, &data,
+				     ofdma->of_node);
 }
 
 static int sdma_probe(struct platform_device *pdev)
diff --git a/include/linux/platform_data/dma-imx.h b/include/linux/platform_data/dma-imx.h
index 9daea8d..7d964e7 100644
--- a/include/linux/platform_data/dma-imx.h
+++ b/include/linux/platform_data/dma-imx.h
@@ -55,7 +55,6 @@ struct imx_dma_data {
 	int dma_request2; /* secondary DMA request line */
 	enum sdma_peripheral_type peripheral_type;
 	int priority;
-	struct device_node *of_node;
 };
 
 static inline int imx_dma_is_ipu(struct dma_chan *chan)
-- 
1.7.9.5
