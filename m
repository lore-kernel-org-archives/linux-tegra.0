From: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 1/4] i2c: tegra: disable clock before returning error
Date: Mon, 25 Apr 2016 17:15:15 +0530
Message-ID: <1461584718-23217-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Disable clock before returning error in tegra_i2c_init()

Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Changes since v1:
- Move current patch as separate patch
---
 drivers/i2c/busses/i2c-tegra.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d764d64..e8507f6 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -483,19 +483,21 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 			if (time_after(jiffies, timeout)) {
 				dev_warn(i2c_dev->dev,
 					"timeout waiting for config load\n");
-				return -ETIMEDOUT;
+				err = -ETIMEDOUT;
+				goto err;
 			}
 			msleep(1);
 		}
 	}
 
-	tegra_i2c_clock_disable(i2c_dev);
 
 	if (i2c_dev->irq_disabled) {
 		i2c_dev->irq_disabled = 0;
 		enable_irq(i2c_dev->irq);
 	}
 
+err:
+	tegra_i2c_clock_disable(i2c_dev);
 	return err;
 }
 
-- 
1.8.1.5
