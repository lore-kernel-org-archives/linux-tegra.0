From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 7/8] i2c: tegra: Always terminate DMA transfer
Date: Tue, 14 Jan 2020 04:34:41 +0300
Message-ID: <20200114013442.28448-8-digetx@gmail.com>
References: <20200114013442.28448-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200114013442.28448-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

It is possible that I2C could error out in the middle of DMA transfer and
in this case DMA channel needs to be reset, otherwise a follow up transfer
will fail because DMA channel stays blocked.

Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1a390e1bff72..3c7c86d4b0e4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1220,11 +1220,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		time_left = tegra_i2c_wait_completion_timeout(
 				i2c_dev, &i2c_dev->dma_complete, xfer_time);
 
+		dmaengine_terminate_sync(i2c_dev->msg_read ?
+					 i2c_dev->rx_dma_chan :
+					 i2c_dev->tx_dma_chan);
+
 		if (time_left == 0) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
-			dmaengine_terminate_sync(i2c_dev->msg_read ?
-						 i2c_dev->rx_dma_chan :
-						 i2c_dev->tx_dma_chan);
 			tegra_i2c_init(i2c_dev, true);
 			return -ETIMEDOUT;
 		}
@@ -1237,11 +1238,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
 			       msg->len);
 		}
-
-		if (i2c_dev->msg_err != I2C_ERR_NONE)
-			dmaengine_synchronize(i2c_dev->msg_read ?
-					      i2c_dev->rx_dma_chan :
-					      i2c_dev->tx_dma_chan);
 	}
 
 	time_left = tegra_i2c_wait_completion_timeout(
-- 
2.24.0
