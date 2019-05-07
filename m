From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 8/8] dmaengine: sh: usb-dmac: Let the core do the device node validation
Date: Tue,  7 May 2019 14:09:45 +0800
Message-ID: <6dc4f90df68276e6c21f7e0087b91e95b153f85f.1557206859.git.baolin.wang@linaro.org>
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
 drivers/dma/sh/usb-dmac.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index 59403f6..0afabf3 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -636,9 +636,6 @@ static bool usb_dmac_chan_filter(struct dma_chan *chan, void *arg)
 	struct usb_dmac_chan *uchan = to_usb_dmac_chan(chan);
 	struct of_phandle_args *dma_spec = arg;
 
-	if (dma_spec->np != chan->device->dev->of_node)
-		return false;
-
 	/* USB-DMAC should be used with fixed usb controller's FIFO */
 	if (uchan->index != dma_spec->args[0])
 		return false;
@@ -659,7 +656,8 @@ static struct dma_chan *usb_dmac_of_xlate(struct of_phandle_args *dma_spec,
 	dma_cap_zero(mask);
 	dma_cap_set(DMA_SLAVE, mask);
 
-	chan = dma_request_channel(mask, usb_dmac_chan_filter, dma_spec);
+	chan = __dma_request_channel(&mask, usb_dmac_chan_filter, dma_spec,
+				     ofdma->of_node);
 	if (!chan)
 		return NULL;
 
-- 
1.7.9.5
