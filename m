From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH -next] drm/tegra: fix return value check
Date: Mon, 21 Oct 2013 11:34:07 +0800
Message-ID: <CAPgLHd_JqYS5DC4tmzgGVEYmJpeM96FAEDvmM3cUUep+1jj7mA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

In case of error, the function clk_get_parent() and devm_ioremap_resource()
returns ERR_PTR() and never returns NULL. The NULL test in the return value
check should be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/gpu/drm/tegra/dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 1cfbace..7bc2eeb 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -914,7 +914,7 @@ static int tegra_dsi_setup_clocks(struct tegra_dsi *dsi)
 	int err;
 
 	parent = clk_get_parent(dsi->clk);
-	if (!parent)
+	if (IS_ERR(parent))
 		return -EINVAL;
 
 	err = clk_set_parent(parent, dsi->clk_parent);
@@ -969,8 +969,8 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dsi->regs = devm_ioremap_resource(&pdev->dev, regs);
-	if (!dsi->regs)
-		return -EADDRNOTAVAIL;
+	if (IS_ERR(dsi->regs))
+		return PTR_ERR(dsi->regs);
 
 	INIT_LIST_HEAD(&dsi->client.list);
 	dsi->client.ops = &dsi_client_ops;
