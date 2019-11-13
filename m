From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 2/3] tty: serial: msm_serial: Use dma_request_chan() directly for channel request
Date: Wed, 13 Nov 2019 11:46:17 +0200
Message-ID: <20191113094618.1725-3-peter.ujfalusi@ti.com>
References: <20191113094618.1725-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191113094618.1725-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, linux@armlinux.org.uk, agross@kernel.org, bjorn.andersson@linaro.org, ldewangan@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: vkoul@kernel.org, jslaby@suse.com, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

dma_request_slave_channel_reason() is:
#define dma_request_slave_channel_reason(dev, name) \
	dma_request_chan(dev, name)

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/tty/serial/msm_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 00964b6e4ac1..1cbae0768b1f 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -301,7 +301,7 @@ static void msm_request_tx_dma(struct msm_port *msm_port, resource_size_t base)
 	dma = &msm_port->tx_dma;
 
 	/* allocate DMA resources, if available */
-	dma->chan = dma_request_slave_channel_reason(dev, "tx");
+	dma->chan = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan))
 		goto no_tx;
 
@@ -344,7 +344,7 @@ static void msm_request_rx_dma(struct msm_port *msm_port, resource_size_t base)
 	dma = &msm_port->rx_dma;
 
 	/* allocate DMA resources, if available */
-	dma->chan = dma_request_slave_channel_reason(dev, "rx");
+	dma->chan = dma_request_chan(dev, "rx");
 	if (IS_ERR(dma->chan))
 		goto no_rx;
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
