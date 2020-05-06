From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/5] i2c: tegra: Synchronize DMA before termination
Date: Wed,  6 May 2020 21:33:58 +0200
Message-ID: <20200506193358.2807244-6-thierry.reding@gmail.com>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200506193358.2807244-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

DMA transfer could be completed, but CPU (which handles DMA interrupt)
may get too busy and can't handle the interrupt in a timely manner,
despite of DMA IRQ being raised. In this case the DMA state needs to
synchronized before terminating DMA transfer in order not to miss the
DMA transfer completion.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d504e272d9fa..4cee596a604d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1219,6 +1219,15 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		time_left = tegra_i2c_wait_completion_timeout(
 				i2c_dev, &i2c_dev->dma_complete, xfer_time);
 
+		/*
+		 * Synchronize DMA first, since dmaengine_terminate_sync()
+		 * performs synchronization after the transfer's termination
+		 * and we want to get a completion if transfer succeeded.
+		 */
+		dmaengine_synchronize(i2c_dev->msg_read ?
+				      i2c_dev->rx_dma_chan :
+				      i2c_dev->tx_dma_chan);
+
 		dmaengine_terminate_sync(i2c_dev->msg_read ?
 					 i2c_dev->rx_dma_chan :
 					 i2c_dev->tx_dma_chan);
-- 
2.24.1
