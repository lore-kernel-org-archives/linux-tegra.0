From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH for 5.6 v1] tty: serial: Handle RX transfer in PIO mode if DMA wasn't started
Date: Mon,  3 Feb 2020 00:28:44 +0300
Message-ID: <20200202212844.11592-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

It is possible to get an instant RX timeout or end-of-transfer interrupt
before RX DMA was started, if transaction is less than 16 bytes. Transfer
should be handled in PIO mode in this case because DMA can't handle it.
This patch brings back the original behaviour of the driver that was
changed by accident by a previous commit, it fixes occasional Bluetooth HW
initialization failures which I started to notice recently.

Fixes: d5e3fadb7012 ("tty: serial: tegra: Activate RX DMA transfer by request")
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/tty/serial/serial-tegra.c | 35 ++++++++++++++-----------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index 33034b852a51..8de8bac9c6c7 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -692,11 +692,22 @@ static void tegra_uart_copy_rx_to_tty(struct tegra_uart_port *tup,
 				   count, DMA_TO_DEVICE);
 }
 
+static void do_handle_rx_pio(struct tegra_uart_port *tup)
+{
+	struct tty_struct *tty = tty_port_tty_get(&tup->uport.state->port);
+	struct tty_port *port = &tup->uport.state->port;
+
+	tegra_uart_handle_rx_pio(tup, port);
+	if (tty) {
+		tty_flip_buffer_push(port);
+		tty_kref_put(tty);
+	}
+}
+
 static void tegra_uart_rx_buffer_push(struct tegra_uart_port *tup,
 				      unsigned int residue)
 {
 	struct tty_port *port = &tup->uport.state->port;
-	struct tty_struct *tty = tty_port_tty_get(port);
 	unsigned int count;
 
 	async_tx_ack(tup->rx_dma_desc);
@@ -705,11 +716,7 @@ static void tegra_uart_rx_buffer_push(struct tegra_uart_port *tup,
 	/* If we are here, DMA is stopped */
 	tegra_uart_copy_rx_to_tty(tup, port, count);
 
-	tegra_uart_handle_rx_pio(tup, port);
-	if (tty) {
-		tty_flip_buffer_push(port);
-		tty_kref_put(tty);
-	}
+	do_handle_rx_pio(tup);
 }
 
 static void tegra_uart_rx_dma_complete(void *args)
@@ -749,8 +756,10 @@ static void tegra_uart_terminate_rx_dma(struct tegra_uart_port *tup)
 {
 	struct dma_tx_state state;
 
-	if (!tup->rx_dma_active)
+	if (!tup->rx_dma_active) {
+		do_handle_rx_pio(tup);
 		return;
+	}
 
 	dmaengine_terminate_all(tup->rx_dma_chan);
 	dmaengine_tx_status(tup->rx_dma_chan, tup->rx_cookie, &state);
@@ -816,18 +825,6 @@ static void tegra_uart_handle_modem_signal_change(struct uart_port *u)
 		uart_handle_cts_change(&tup->uport, msr & UART_MSR_CTS);
 }
 
-static void do_handle_rx_pio(struct tegra_uart_port *tup)
-{
-	struct tty_struct *tty = tty_port_tty_get(&tup->uport.state->port);
-	struct tty_port *port = &tup->uport.state->port;
-
-	tegra_uart_handle_rx_pio(tup, port);
-	if (tty) {
-		tty_flip_buffer_push(port);
-		tty_kref_put(tty);
-	}
-}
-
 static irqreturn_t tegra_uart_isr(int irq, void *data)
 {
 	struct tegra_uart_port *tup = data;
-- 
2.24.0
