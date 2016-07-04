From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [patch] drm/tegra: sor: Double free on error
Date: Mon, 4 Jul 2016 10:45:01 +0300
Message-ID: <20160704074501.GA4849@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

"brick" is allocated with devm_kzalloc() so freeing it with kfree()
leads to a double free.  We can just delete it.

Fixes: a7ba8310c7f5 ('drm/tegra: sor: Implement sor1_brick clock')
Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 8425eda..e750ced 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -345,7 +345,6 @@ static struct clk *tegra_clk_sor_brick_register(struct tegra_sor *sor,
 {
 	struct tegra_clk_sor_brick *brick;
 	struct clk_init_data init;
-	struct clk *clk;
 
 	brick = devm_kzalloc(sor->dev, sizeof(*brick), GFP_KERNEL);
 	if (!brick)
@@ -361,11 +360,7 @@ static struct clk *tegra_clk_sor_brick_register(struct tegra_sor *sor,
 
 	brick->hw.init = &init;
 
-	clk = devm_clk_register(sor->dev, &brick->hw);
-	if (IS_ERR(clk))
-		kfree(brick);
-
-	return clk;
+	return devm_clk_register(sor->dev, &brick->hw);
 }
 
 static int tegra_sor_dp_train_fast(struct tegra_sor *sor,
