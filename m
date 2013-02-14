From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] i2c: tegra: remove warning dump if timeout happen in transfer
Date: Thu, 14 Feb 2013 18:13:33 +0530
Message-ID: <1360845813-11334-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If timeout error occurs in the i2c transfer then it was dumping warning
of call stack.

Remove the warning dump as there is may be possibility that some slave
devices are busy and not responding the i2c communication.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
The patch is generated based on discussion happen between Stephena and
Wolfram on the patch:
 i2c: add bcm2835 driver

resending patch as Wolfram's email id has been changed.

 drivers/i2c/busses/i2c-tegra.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ae2e027..36704e3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -587,7 +587,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	ret = wait_for_completion_timeout(&i2c_dev->msg_complete, TEGRA_I2C_TIMEOUT);
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
-	if (WARN_ON(ret == 0)) {
+	if (ret == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
 
 		tegra_i2c_init(i2c_dev);
-- 
1.7.1.1
