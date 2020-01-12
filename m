From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 5/8] i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
Date: Sun, 12 Jan 2020 20:14:27 +0300
Message-ID: <20200112171430.27219-6-digetx@gmail.com>
References: <20200112171430.27219-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200112171430.27219-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

DMA is preferred for a larger transfers, while PIO is preferred for a
smaller transfers to avoid unnecessary DMA overhead. There is no strict
size limitations for the PIO-mode transfers, so let's rename the constant
for clarity.

Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 0245fc2b5684..e0eb8f5dcd6b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -131,11 +131,12 @@
 #define I2C_PACKET_HEADER_SIZE			12
 
 /*
- * Upto I2C_PIO_MODE_MAX_LEN bytes, controller will use PIO mode,
- * above this, controller will use DMA to fill FIFO.
- * MAX PIO len is 20 bytes excluding packet header.
+ * I2C Controller will use PIO mode for transfers up to 32 bytes in order to
+ * avoid DMA overhead, otherwise external APB DMA controller will be used.
+ * Note that the actual MAX PIO length is 20 bytes because 32 bytes include
+ * I2C_PACKET_HEADER_SIZE.
  */
-#define I2C_PIO_MODE_MAX_LEN			32
+#define I2C_PIO_MODE_PREFERRED_LEN		32
 
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
@@ -1110,7 +1111,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
-	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_MAX_LEN) &&
+	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
-- 
2.24.0
