From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: sor: Fix hang on Tegra124 eDP
Date: Wed, 10 Jan 2018 13:11:55 +0100
Message-ID: <20180110121155.26345-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The SOR0 found on Tegra124 and Tegra210 only supports eDP and LVDS and
therefore has a slightly different clock tree than the SOR1 which does
not support eDP, but HDMI and DP instead.

Commit e1335e2f0cfc ("drm/tegra: sor: Reimplement pad clock") breaks
setups with eDP because the sor->clk_out clock is uninitialized and
therefore setting the parent clock (either the safe clock or either of
the display PLLs) fails, which can cause hangs later on since there is
no clock driving the module.

Fix this by falling back to the module clock for sor->clk_out on those
setups. This guarantees that the module will always be clocked by an
enabled clock and hence prevents those hangs.

Fixes: e1335e2f0cfc ("drm/tegra: sor: Reimplement pad clock")
Reported-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index b0a1dedac802..476079f1255f 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2656,6 +2656,9 @@ static int tegra_sor_probe(struct platform_device *pdev)
 				name, err);
 			goto remove;
 		}
+	} else {
+		/* fall back to the module clock on SOR0 (eDP/LVDS only) */
+		sor->clk_out = sor->clk;
 	}
 
 	sor->clk_parent = devm_clk_get(&pdev->dev, "parent");
-- 
2.15.1
