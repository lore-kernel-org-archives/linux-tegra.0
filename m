From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] drm/tegra: sor: Use sor1_src clock to set parent for HDMI
Date: Thu, 23 Jun 2016 12:27:59 +0200
Message-ID: <20160623102759.23078-2-thierry.reding@gmail.com>
References: <20160623102759.23078-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623102759.23078-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When running in HDMI mode, the sor1 IP block needs to use the sor1_src
as parent clock, and in turn configure the sor1_src to use pll_d2_out0
as its parent.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 6887e52318e2..7405c39f6db3 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -172,6 +172,7 @@ struct tegra_sor {
 	struct clk *clk_parent;
 	struct clk *clk_brick;
 	struct clk *clk_safe;
+	struct clk *clk_src;
 	struct clk *clk_dp;
 	struct clk *clk;
 
@@ -2140,7 +2141,11 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 	tegra_sor_writel(sor, 0x00000000, SOR_XBAR_POL);
 
 	/* switch to parent clock */
-	err = tegra_sor_set_parent_clock(clk, sor->clk_parent);
+	err = clk_set_parent(sor->clk_src, sor->clk_parent);
+	if (err < 0)
+		dev_err(sor->dev, "failed to set source clock: %d\n", err);
+
+	err = tegra_sor_set_parent_clock(sor, sor->clk_src);
 	if (err < 0)
 		dev_err(sor->dev, "failed to set parent clock: %d\n", err);
 
@@ -2645,6 +2650,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
+	sor->clk_src = devm_clk_get(&pdev->dev, "source");
+	if (IS_ERR(sor->clk_src)) {
+		err = PTR_ERR(sor->clk_src);
+		dev_err(&pdev->dev, "failed to get source clock: %d\n", err);
+		goto remove;
+	}
+
 	sor->clk_parent = devm_clk_get(&pdev->dev, "parent");
 	if (IS_ERR(sor->clk_parent)) {
 		err = PTR_ERR(sor->clk_parent);
-- 
2.8.3
