From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/2] serial: tegra: fix CREAD handling for PIO
Date: Fri, 10 Jul 2020 15:59:46 +0200
Message-ID: <20200710135947.2737-2-johan@kernel.org>
References: <20200710135947.2737-1-johan@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200710135947.2737-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>, Shardar Shariff Md <smohammed@nvidia.com>, Krishna Yarlagadda <kyarlagadda@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Commit 33ae787b74fc ("serial: tegra: add support to ignore read") added
support for dropping input in case CREAD isn't set, but for PIO the
ignore_status_mask wasn't checked until after the character had been
put in the receive buffer.

Note that the NULL tty-port test is bogus and will be removed by a
follow-on patch.

Fixes: 33ae787b74fc ("serial: tegra: add support to ignore read")
Cc: stable <stable@vger.kernel.org>     # 5.4
Cc: Shardar Shariff Md <smohammed@nvidia.com>
Cc: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/tty/serial/serial-tegra.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index 8de8bac9c6c7..b3bbee6b6702 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -653,11 +653,14 @@ static void tegra_uart_handle_rx_pio(struct tegra_uart_port *tup,
 		ch = (unsigned char) tegra_uart_read(tup, UART_RX);
 		tup->uport.icount.rx++;
 
-		if (!uart_handle_sysrq_char(&tup->uport, ch) && tty)
-			tty_insert_flip_char(tty, ch, flag);
+		if (uart_handle_sysrq_char(&tup->uport, ch))
+			continue;
 
 		if (tup->uport.ignore_status_mask & UART_LSR_DR)
 			continue;
+
+		if (tty)
+			tty_insert_flip_char(tty, ch, flag);
 	} while (1);
 }
 
-- 
2.26.2
