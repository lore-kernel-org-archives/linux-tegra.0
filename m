From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 20/31] i2c: tegra: use reset framework
Date: Fri, 15 Nov 2013 13:54:15 -0700
Message-ID: <1384548866-13141-21-git-send-email-swarren@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384548866-13141-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra's clock driver now provides an implementation of the common
reset API (include/linux/reset.h). Use this instead of the old Tegra-
specific API; that will soon be removed.

Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch is part of a series with strong internal depdendencies. I'm
looking for an ack so that I can take the entire series through the Tegra
and arm-soc trees. The series will be part of a stable branch that can be
merged into other subsystems if needed to avoid/resolve dependencies.
---
 drivers/i2c/busses/i2c-tegra.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e661edee4d0c..9704537aee3c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -27,7 +27,7 @@
 #include <linux/slab.h>
 #include <linux/of_device.h>
 #include <linux/module.h>
-#include <linux/clk/tegra.h>
+#include <linux/reset.h>
 
 #include <asm/unaligned.h>
 
@@ -160,6 +160,7 @@ struct tegra_i2c_dev {
 	struct i2c_adapter adapter;
 	struct clk *div_clk;
 	struct clk *fast_clk;
+	struct reset_control *rst;
 	void __iomem *base;
 	int cont_id;
 	int irq;
@@ -415,9 +416,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		return err;
 	}
 
-	tegra_periph_reset_assert(i2c_dev->div_clk);
+	reset_control_assert(i2c_dev->rst);
 	udelay(2);
-	tegra_periph_reset_deassert(i2c_dev->div_clk);
+	reset_control_deassert(i2c_dev->rst);
 
 	if (i2c_dev->is_dvc)
 		tegra_dvc_init(i2c_dev);
@@ -743,6 +744,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->cont_id = pdev->id;
 	i2c_dev->dev = &pdev->dev;
 
+	i2c_dev->rst = devm_reset_control_get(&pdev->dev, "i2c");
+	if (IS_ERR(i2c_dev->rst)) {
+		dev_err(&pdev->dev, "missing controller reset");
+		return PTR_ERR(i2c_dev->rst);
+	}
+
 	ret = of_property_read_u32(i2c_dev->dev->of_node, "clock-frequency",
 					&i2c_dev->bus_clk_rate);
 	if (ret)
-- 
1.8.1.5
