From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 1/4] i2c: at91: Use dma_request_chan() directly for channel request
Date: Wed, 13 Nov 2019 11:22:32 +0200
Message-ID: <20191113092235.30440-2-peter.ujfalusi@ti.com>
References: <20191113092235.30440-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191113092235.30440-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ludovic.desroches@microchip.com, agross@kernel.org, wsa+renesas@sang-engineering.com, ldewangan@nvidia.com
Cc: vkoul@kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, digetx@gmail.com, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, bjorn.andersson@linaro.org
List-Id: linux-tegra@vger.kernel.org

dma_request_slave_channel_reason() is:
#define dma_request_slave_channel_reason(dev, name) \
	dma_request_chan(dev, name)

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/i2c/busses/i2c-at91-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 6e0b554dcd4e..7a862e00b475 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -758,14 +758,14 @@ static int at91_twi_configure_dma(struct at91_twi_dev *dev, u32 phy_addr)
 	slave_config.dst_maxburst = 1;
 	slave_config.device_fc = false;
 
-	dma->chan_tx = dma_request_slave_channel_reason(dev->dev, "tx");
+	dma->chan_tx = dma_request_chan(dev->dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
 		ret = PTR_ERR(dma->chan_tx);
 		dma->chan_tx = NULL;
 		goto error;
 	}
 
-	dma->chan_rx = dma_request_slave_channel_reason(dev->dev, "rx");
+	dma->chan_rx = dma_request_chan(dev->dev, "rx");
 	if (IS_ERR(dma->chan_rx)) {
 		ret = PTR_ERR(dma->chan_rx);
 		dma->chan_rx = NULL;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
