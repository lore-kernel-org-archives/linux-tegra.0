From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3] i2c: tegra: Maintain CPU endianness
Date: Mon, 26 Jan 2015 19:55:02 +0300
Message-ID: <1422291305-32514-1-git-send-email-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Support CPU BE mode by adding endianness conversion for memcpy interactions.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changelog:
v2: For consistency cpu_to_le32() changed to le32_to_cpu() because
    i2c_writel() takes BE value in BE CPU mode and value is in LE format.
v3: Removed "val = 0;", it turned out it wasn't needed. For some reason
    it wasn't working at first time, hope it was just me doing something
    wrong and it's not a heisenbug. I've checked kernel with all memory
    corruption detection options enabled and it didn't show any problems.

 drivers/i2c/busses/i2c-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 28b87e6..29f1433 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -286,6 +286,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	if (rx_fifo_avail > 0 && buf_remaining > 0) {
 		BUG_ON(buf_remaining > 3);
 		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
+		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
 		buf_remaining = 0;
 		rx_fifo_avail--;
@@ -344,6 +345,7 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	if (tx_fifo_avail > 0 && buf_remaining > 0) {
 		BUG_ON(buf_remaining > 3);
 		memcpy(&val, buf, buf_remaining);
+		val = le32_to_cpu(val);
 
 		/* Again update before writing to FIFO to make sure isr sees. */
 		i2c_dev->msg_buf_remaining = 0;
-- 
2.2.1
