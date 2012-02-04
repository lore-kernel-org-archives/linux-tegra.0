From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] i2c: tegra: Remove unnecessary write to INT_STATUS
Date: Fri,  3 Feb 2012 17:10:17 -0700
Message-ID: <1328314217-16632-2-git-send-email-swarren@nvidia.com>
References: <1328314217-16632-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328314217-16632-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The write is not necessary and may cause the I2C controller to misbehave.
With this fix, I2C on Tegra30 works (at least, running i2cdump repeatedly
on the WM8903 on Cardhu's I2C5/DVC bus).

Originally by Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, but S-o-b missing in our
internal repo.

[swarren: Reworded commit description]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a546ede..edac27b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -456,7 +456,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	int ret;
 
 	tegra_i2c_flush_fifos(i2c_dev);
-	i2c_writel(i2c_dev, 0xFF, I2C_INT_STATUS);
 
 	if (msg->len == 0)
 		return -EINVAL;
-- 
1.7.0.4
