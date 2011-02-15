From: vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Subject: [PATCH] mfd: tps6586x: avoid burst writes
Date: Tue, 15 Feb 2011 15:33:42 +0530
Message-ID: <1297764222-29803-1-git-send-email-vwadekar@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ARitger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bnihalani-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

tps6586 does not support burst writes. i2c writes have to be
1 byte at a time.

Signed-off-by: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/mfd/tps6586x.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index c937742..0aa9186 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -150,12 +150,12 @@ static inline int __tps6586x_write(struct i2c_client *client,
 static inline int __tps6586x_writes(struct i2c_client *client, int reg,
 				  int len, uint8_t *val)
 {
-	int ret;
+	int ret, i;
 
-	ret = i2c_smbus_write_i2c_block_data(client, reg, len, val);
-	if (ret < 0) {
-		dev_err(&client->dev, "failed writings to 0x%02x\n", reg);
-		return ret;
+	for (i = 0; i < len; i++) {
+		ret = __tps6586x_write(client, reg + i, *(val + i));
+		if (ret < 0)
+			return ret;
 	}
 
 	return 0;
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
