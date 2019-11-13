From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 2/4] i2c: qup: Use dma_request_chan() directly for channel request
Date: Wed, 13 Nov 2019 11:22:33 +0200
Message-ID: <20191113092235.30440-3-peter.ujfalusi@ti.com>
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
 drivers/i2c/busses/i2c-qup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index e09cd0775ae9..2d7dabe12723 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -628,7 +628,7 @@ static int qup_i2c_req_dma(struct qup_i2c_dev *qup)
 	int err;
 
 	if (!qup->btx.dma) {
-		qup->btx.dma = dma_request_slave_channel_reason(qup->dev, "tx");
+		qup->btx.dma = dma_request_chan(qup->dev, "tx");
 		if (IS_ERR(qup->btx.dma)) {
 			err = PTR_ERR(qup->btx.dma);
 			qup->btx.dma = NULL;
@@ -638,7 +638,7 @@ static int qup_i2c_req_dma(struct qup_i2c_dev *qup)
 	}
 
 	if (!qup->brx.dma) {
-		qup->brx.dma = dma_request_slave_channel_reason(qup->dev, "rx");
+		qup->brx.dma = dma_request_chan(qup->dev, "rx");
 		if (IS_ERR(qup->brx.dma)) {
 			dev_err(qup->dev, "\n rx channel not available");
 			err = PTR_ERR(qup->brx.dma);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
