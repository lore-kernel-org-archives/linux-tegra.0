From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 4/8] dmaengine: dma-jz4780: Let the core do the device node validation
Date: Mon, 20 May 2019 19:32:17 +0800
Message-ID: <231f063f65d0f4ca9a69edfb267fb82500954415.1558351667.git.baolin.wang@linaro.org>
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
 drivers/dma/dma-jz4780.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 9ce0a38..7e1d381 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -160,7 +160,6 @@ struct jz4780_dma_dev {
 };
 
 struct jz4780_dma_filter_data {
-	struct device_node *of_node;
 	uint32_t transfer_type;
 	int channel;
 };
@@ -765,8 +764,6 @@ static bool jz4780_dma_filter_fn(struct dma_chan *chan, void *param)
 	struct jz4780_dma_dev *jzdma = jz4780_dma_chan_parent(jzchan);
 	struct jz4780_dma_filter_data *data = param;
 
-	if (jzdma->dma_device.dev->of_node != data->of_node)
-		return false;
 
 	if (data->channel > -1) {
 		if (data->channel != jzchan->id)
@@ -790,7 +787,6 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
 	if (dma_spec->args_count != 2)
 		return NULL;
 
-	data.of_node = ofdma->of_node;
 	data.transfer_type = dma_spec->args[0];
 	data.channel = dma_spec->args[1];
 
@@ -815,7 +811,8 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
 		return dma_get_slave_channel(
 			&jzdma->chan[data.channel].vchan.chan);
 	} else {
-		return dma_request_channel(mask, jz4780_dma_filter_fn, &data);
+		return __dma_request_channel(&mask, jz4780_dma_filter_fn, &data,
+					     ofdma->of_node);
 	}
 }
 
-- 
1.7.9.5
