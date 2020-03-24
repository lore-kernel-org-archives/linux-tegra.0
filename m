From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 2/2] i2c: tegra: Synchronize DMA before termination
Date: Tue, 24 Mar 2020 22:12:17 +0300
Message-ID: <20200324191217.1829-3-digetx@gmail.com>
References: <20200324191217.1829-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200324191217.1829-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

DMA transfer could be completed, but CPU (which handles DMA interrupt)
may get too busy and can't handle the interrupt in a timely manner,
despite of DMA IRQ being raised. In this case the DMA state needs to
synchronized before terminating DMA transfer in order not to miss the
DMA transfer completion.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 0daa863fb26f..0c6dac770fc3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1223,6 +1223,15 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
2.25.1
