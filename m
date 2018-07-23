From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 08/12] i2c: tegra: use core to detect 'no zero length' quirk
Date: Mon, 23 Jul 2018 22:26:12 +0200
Message-ID: <20180723202617.15230-9-wsa+renesas@sang-engineering.com>
References: <20180723202617.15230-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723202617.15230-1-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

And don't reimplement in the driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Only build tested.

 drivers/i2c/busses/i2c-tegra.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 60c8561fbe65..437294ea2f0a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -684,9 +684,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	tegra_i2c_flush_fifos(i2c_dev);
 
-	if (msg->len == 0)
-		return -EINVAL;
-
 	i2c_dev->msg_buf = msg->buf;
 	i2c_dev->msg_buf_remaining = msg->len;
 	i2c_dev->msg_err = I2C_ERR_NONE;
@@ -831,6 +828,7 @@ static const struct i2c_algorithm tegra_i2c_algo = {
 
 /* payload size is only 12 bit */
 static const struct i2c_adapter_quirks tegra_i2c_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN,
 	.max_read_len = 4096,
 	.max_write_len = 4096,
 };
-- 
2.11.0
