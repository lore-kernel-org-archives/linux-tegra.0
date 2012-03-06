From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/2] i2c: tegra: Remove unnecessary write to INT_STATUS
Date: Tue, 6 Mar 2012 09:37:07 +0530
Message-ID: <7A0BFCFE3DA5CD47B0FB7984326F201A136B88647E@BGMAIL01.nvidia.com>
References: <1328314217-16632-1-git-send-email-swarren@nvidia.com>
 <1328314217-16632-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328314217-16632-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


-----Original Message-----
From: Stephen Warren 
Sent: Saturday, February 04, 2012 5:40 AM
To: Ben Dooks; Wolfram Sang
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Alok Chauhan; Stephen Warren
Subject: [PATCH 2/2] i2c: tegra: Remove unnecessary write to INT_STATUS

From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The write is not necessary and may cause the I2C controller to misbehave.
With this fix, I2C on Tegra30 works (at least, running i2cdump repeatedly on the WM8903 on Cardhu's I2C5/DVC bus).

Originally by Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, but S-o-b missing in our internal repo.

[swarren: Reworded commit description]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c index a546ede..edac27b 100644
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
