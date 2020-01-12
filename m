From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] tty: serial: tegra: Optimize DMA buffer synchronization
Date: Sun, 12 Jan 2020 21:09:19 +0300
Message-ID: <20200112180919.5194-3-digetx@gmail.com>
References: <20200112180919.5194-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <20200112180919.5194-1-digetx@gmail.com>
Sender: linux-serial-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Synchronize only the dirty part of DMA buffer in order to avoid
unnecessary overhead of syncing of the clean part, which is the case
of every serial DMA transfer in practice.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/tty/serial/serial-tegra.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index 3b495e7c9534..33034b852a51 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -534,11 +534,12 @@ static int tegra_uart_start_tx_dma(struct tegra_uart_port *tup,
 	struct circ_buf *xmit = &tup->uport.state->xmit;
 	dma_addr_t tx_phys_addr;
 
-	dma_sync_single_for_device(tup->uport.dev, tup->tx_dma_buf_phys,
-				UART_XMIT_SIZE, DMA_TO_DEVICE);
-
 	tup->tx_bytes = count & ~(0xF);
 	tx_phys_addr = tup->tx_dma_buf_phys + xmit->tail;
+
+	dma_sync_single_for_device(tup->uport.dev, tx_phys_addr,
+				   tup->tx_bytes, DMA_TO_DEVICE);
+
 	tup->tx_dma_desc = dmaengine_prep_slave_single(tup->tx_dma_chan,
 				tx_phys_addr, tup->tx_bytes, DMA_MEM_TO_DEV,
 				DMA_PREP_INTERRUPT);
@@ -680,7 +681,7 @@ static void tegra_uart_copy_rx_to_tty(struct tegra_uart_port *tup,
 		return;
 
 	dma_sync_single_for_cpu(tup->uport.dev, tup->rx_dma_buf_phys,
-				TEGRA_UART_RX_DMA_BUFFER_SIZE, DMA_FROM_DEVICE);
+				count, DMA_FROM_DEVICE);
 	copied = tty_insert_flip_string(tty,
 			((unsigned char *)(tup->rx_dma_buf_virt)), count);
 	if (copied != count) {
@@ -688,7 +689,7 @@ static void tegra_uart_copy_rx_to_tty(struct tegra_uart_port *tup,
 		dev_err(tup->uport.dev, "RxData copy to tty layer failed\n");
 	}
 	dma_sync_single_for_device(tup->uport.dev, tup->rx_dma_buf_phys,
-				TEGRA_UART_RX_DMA_BUFFER_SIZE, DMA_TO_DEVICE);
+				   count, DMA_TO_DEVICE);
 }
 
 static void tegra_uart_rx_buffer_push(struct tegra_uart_port *tup,
@@ -788,8 +789,6 @@ static int tegra_uart_start_rx_dma(struct tegra_uart_port *tup)
 	tup->rx_dma_active = true;
 	tup->rx_dma_desc->callback = tegra_uart_rx_dma_complete;
 	tup->rx_dma_desc->callback_param = tup;
-	dma_sync_single_for_device(tup->uport.dev, tup->rx_dma_buf_phys,
-				count, DMA_TO_DEVICE);
 	tup->rx_bytes_requested = count;
 	tup->rx_cookie = dmaengine_submit(tup->rx_dma_desc);
 	dma_async_issue_pending(tup->rx_dma_chan);
@@ -1154,6 +1153,9 @@ static int tegra_uart_dma_channel_allocate(struct tegra_uart_port *tup,
 			dma_release_channel(dma_chan);
 			return -ENOMEM;
 		}
+		dma_sync_single_for_device(tup->uport.dev, dma_phys,
+					   TEGRA_UART_RX_DMA_BUFFER_SIZE,
+					   DMA_TO_DEVICE);
 		dma_sconfig.src_addr = tup->uport.mapbase;
 		dma_sconfig.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
 		dma_sconfig.src_maxburst = tup->cdata->max_dma_burst_bytes;
-- 
2.24.0
