From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 3/4] i2c: sh_mobile: Use dma_request_chan() directly for channel request
Date: Wed, 13 Nov 2019 11:22:34 +0200
Message-ID: <20191113092235.30440-4-peter.ujfalusi@ti.com>
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
 drivers/i2c/busses/i2c-sh_mobile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 8777af4c695e..82b3b795e0bd 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -486,7 +486,7 @@ static struct dma_chan *sh_mobile_i2c_request_dma_chan(struct device *dev,
 	char *chan_name = dir == DMA_MEM_TO_DEV ? "tx" : "rx";
 	int ret;
 
-	chan = dma_request_slave_channel_reason(dev, chan_name);
+	chan = dma_request_chan(dev, chan_name);
 	if (IS_ERR(chan)) {
 		dev_dbg(dev, "request_channel failed for %s (%ld)\n", chan_name,
 			PTR_ERR(chan));
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
