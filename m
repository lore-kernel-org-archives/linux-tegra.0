From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] i2c: tegra: Fix assignment of boolean variables
Date: Tue, 6 Sep 2016 10:50:45 +0100
Message-ID: <1473155445-3046-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fix the following warnings reported by coccinelle for the Tegra I2C
driver.

drivers/i2c/busses/i2c-tegra.c:513:2-23: WARNING: Assignment of bool to 0/1
drivers/i2c/busses/i2c-tegra.c:539:3-24: WARNING: Assignment of bool to 0/1

Reported-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d86a993b75d6..7398930172f3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -510,7 +510,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	}
 
 	if (i2c_dev->irq_disabled) {
-		i2c_dev->irq_disabled = 0;
+		i2c_dev->irq_disabled = false;
 		enable_irq(i2c_dev->irq);
 	}
 
@@ -536,7 +536,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 		if (!i2c_dev->irq_disabled) {
 			disable_irq_nosync(i2c_dev->irq);
-			i2c_dev->irq_disabled = 1;
+			i2c_dev->irq_disabled = true;
 		}
 		goto err;
 	}
-- 
2.1.4
