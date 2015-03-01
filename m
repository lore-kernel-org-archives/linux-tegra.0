From: Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH] i2c: tegra: match return type of wait_for_completion_timeout
Date: Sun,  1 Mar 2015 09:17:41 -0500
Message-ID: <1425219461-3261-1-git-send-email-hofrat@osadl.org>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

return type of wait_for_completion_timeout is unsigned long not int. As ret
was only used for wait_for_completion_timeout here it is renamed to time_left
the type changed to unsigned long and references fixed up.

Signed-off-by: Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
---

This patch was only compile tested with tegra_defconfig
(implies CONFIG_I2C_TEGRA=y)

Patch is against 4.0-rc1 (localversion-next is -next-20150227)

 drivers/i2c/busses/i2c-tegra.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 29f1433..1bcd75e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -532,7 +532,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 {
 	u32 packet_header;
 	u32 int_mask;
-	int ret;
+	unsigned long time_left;
 
 	tegra_i2c_flush_fifos(i2c_dev);
 
@@ -585,18 +585,20 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
-	ret = wait_for_completion_timeout(&i2c_dev->msg_complete, TEGRA_I2C_TIMEOUT);
+	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
+						TEGRA_I2C_TIMEOUT);
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
-	if (ret == 0) {
+	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
 
 		tegra_i2c_init(i2c_dev);
 		return -ETIMEDOUT;
 	}
 
-	dev_dbg(i2c_dev->dev, "transfer complete: %d %d %d\n",
-		ret, completion_done(&i2c_dev->msg_complete), i2c_dev->msg_err);
+	dev_dbg(i2c_dev->dev, "transfer complete: %lu %d %d\n",
+		time_left, completion_done(&i2c_dev->msg_complete),
+		i2c_dev->msg_err);
 
 	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
 		return 0;
-- 
1.7.10.4
