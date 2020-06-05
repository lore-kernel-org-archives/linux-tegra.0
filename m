From: =?UTF-8?q?Randolph=20Maa=C3=9Fen?= <gaireg-a1pNmjaJ30GzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] serial: serial-tegra: reduce irq-latency after rx errors
Date: Fri,  5 Jun 2020 16:57:14 +0200
Message-ID: <20200605145714.9964-1-gaireg@gaireg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Randolph=20Maa=C3=9Fen?= <gaireg-a1pNmjaJ30GzQB+pC5nmwQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Since dev_err() calls can lead to synchronous writes to another serial
console these calls can provide significant latency during irq-handling
in tegra_uart_isr(). With this latency another interrupt is likely to
apper during handling of the first interrupt, which might lock up the
kernel completely.

These errors are reported to the error counters so converting the
dev_err() to dev_dbg() is appropriate.

Signed-off-by: Randolph Maaßen <gaireg-a1pNmjaJ30GzQB+pC5nmwQ@public.gmane.org>
---
 drivers/tty/serial/serial-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index 8de8bac9c6c7..d3fef5ab289a 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -439,16 +439,16 @@ static char tegra_uart_decode_rx_error(struct tegra_uart_port *tup,
 			/* Overrrun error */
 			flag = TTY_OVERRUN;
 			tup->uport.icount.overrun++;
-			dev_err(tup->uport.dev, "Got overrun errors\n");
+			dev_dbg(tup->uport.dev, "Got overrun errors\n");
 		} else if (lsr & UART_LSR_PE) {
 			/* Parity error */
 			flag = TTY_PARITY;
 			tup->uport.icount.parity++;
-			dev_err(tup->uport.dev, "Got Parity errors\n");
+			dev_dbg(tup->uport.dev, "Got Parity errors\n");
 		} else if (lsr & UART_LSR_FE) {
 			flag = TTY_FRAME;
 			tup->uport.icount.frame++;
-			dev_err(tup->uport.dev, "Got frame errors\n");
+			dev_dbg(tup->uport.dev, "Got frame errors\n");
 		} else if (lsr & UART_LSR_BI) {
 			/*
 			 * Break error
-- 
2.11.0
