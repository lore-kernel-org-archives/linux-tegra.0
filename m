From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] serial: tegra: drop bogus NULL tty-port checks
Date: Fri, 10 Jul 2020 15:59:47 +0200
Message-ID: <20200710135947.2737-3-johan@kernel.org>
References: <20200710135947.2737-1-johan@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200710135947.2737-1-johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The struct tty_port is part of the uart state and will never be NULL in
the receive helpers. Drop the bogus NULL checks and rename the
pointer-variables "port" to differentiate them from struct tty_struct
pointers (which can be NULL).

Fixes: 962963e4ee23 ("serial: tegra: Switch to using struct tty_port")
Signed-off-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/tty/serial/serial-tegra.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index b3bbee6b6702..04d1b0807e66 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -635,7 +635,7 @@ static void tegra_uart_handle_tx_pio(struct tegra_uart_port *tup)
 }
 
 static void tegra_uart_handle_rx_pio(struct tegra_uart_port *tup,
-		struct tty_port *tty)
+		struct tty_port *port)
 {
 	do {
 		char flag = TTY_NORMAL;
@@ -659,13 +659,12 @@ static void tegra_uart_handle_rx_pio(struct tegra_uart_port *tup,
 		if (tup->uport.ignore_status_mask & UART_LSR_DR)
 			continue;
 
-		if (tty)
-			tty_insert_flip_char(tty, ch, flag);
+		tty_insert_flip_char(port, ch, flag);
 	} while (1);
 }
 
 static void tegra_uart_copy_rx_to_tty(struct tegra_uart_port *tup,
-				      struct tty_port *tty,
+				      struct tty_port *port,
 				      unsigned int count)
 {
 	int copied;
@@ -675,17 +674,13 @@ static void tegra_uart_copy_rx_to_tty(struct tegra_uart_port *tup,
 		return;
 
 	tup->uport.icount.rx += count;
-	if (!tty) {
-		dev_err(tup->uport.dev, "No tty port\n");
-		return;
-	}
 
 	if (tup->uport.ignore_status_mask & UART_LSR_DR)
 		return;
 
 	dma_sync_single_for_cpu(tup->uport.dev, tup->rx_dma_buf_phys,
 				count, DMA_FROM_DEVICE);
-	copied = tty_insert_flip_string(tty,
+	copied = tty_insert_flip_string(port,
 			((unsigned char *)(tup->rx_dma_buf_virt)), count);
 	if (copied != count) {
 		WARN_ON(1);
-- 
2.26.2
