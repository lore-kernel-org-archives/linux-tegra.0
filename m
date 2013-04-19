From: Hendrik Lippek <hendrik.lippek-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] i2c: tegra: Retry transfer when no_ack status is detected
Date: Fri, 19 Apr 2013 13:43:24 +0200
Message-ID: <1366371804-7901-1-git-send-email-hendrik.lippek@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hendrik Lippek <hendrik.lippek-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In such conditions return -EAGAIN from driver.
This will cause the i2c-core to retry
the transmission as per the retry count and time-out specified by the
platform data of the adapter.

This fix is adapted from chromeos
commit:	16d971dd7ee9571746ff1d352fa3c0092a36478d

Signed-off-by: Hendrik Lippek <hendrik.lippek-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c1bd68d..81a6170 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -756,7 +756,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_bus *i2c_bus,
 	if (i2c_dev->msg_err == I2C_ERR_NO_ACK) {
 		if (msg->flags & I2C_M_IGNORE_NAK)
 			return 0;
-		return -EREMOTEIO;
+		return -EAGAIN;
 	}
 
 	if (i2c_dev->msg_err & I2C_ERR_UNEXPECTED_STATUS)
-- 
1.7.10.4
