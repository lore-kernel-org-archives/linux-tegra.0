From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] i2c: tegra: Fix compile when !CONFIG_OF
Date: Wed, 13 Jul 2011 14:36:58 -0600
Message-ID: <1310589418-15821-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When !CONFIG_OF, <linux/of.h> doesn't prototype of_get_property(), which
causes i2c-tegra.c to fail to compile. Make the references to this
function conditional to solve this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Grant, is this the correct way to solve this? Other solutions I can see are:
a) Make ARM or Tegra select CONFIG_OF, now that ARM is moving to Device Tree.
b) Make <linux/of.h> provide dummy inline versions of its functions when
   !CONFIG_OF.

 drivers/i2c/busses/i2c-tegra.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2440b74..5a18d6d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -610,12 +610,15 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (pdata) {
 		i2c_dev->bus_clk_rate = pdata->bus_clk_rate;
 
-	} else if (i2c_dev->dev->of_node) {    /* if there is a device tree node ... */
+	}
+#ifdef CONFIG_OF
+	else if (i2c_dev->dev->of_node) {    /* if there is a device tree node ... */
 		prop = of_get_property(i2c_dev->dev->of_node,
 				"clock-frequency", NULL);
 		if (prop)
 			i2c_dev->bus_clk_rate = be32_to_cpup(prop);
 	}
+#endif
 
 	if (pdev->id == 3)
 		i2c_dev->is_dvc = 1;
-- 
1.7.0.4
