From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH 2/2] drm/tegra: sor: Fix hang on tegra124 due to NULL clk_out
Date: Mon,  4 Dec 2017 18:37:59 +0000
Message-ID: <79b4a60f1d624b16eaef06258318861d4407fecd.1512411775.git.guillaume.tucker@collabora.com>
References: <be610a7596ad8fee7da092161888c532c2eb2908.1512411775.git.guillaume.tucker@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <be610a7596ad8fee7da092161888c532c2eb2908.1512411775.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <be610a7596ad8fee7da092161888c532c2eb2908.1512411775.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
References: <be610a7596ad8fee7da092161888c532c2eb2908.1512411775.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When neither HDMI nor DP is supported such as on the tegra124, the
sor->clk_out is not initialised and remains NULL.  In this case, the
parent clock can't be assigned to it so revert to the previous
behaviour of assigning it to the main sor->clock instead.

This fixes a kernel hang on tegra124.

Fixes: e1335e2f0cfc ("drm/tegra: sor: Reimplement pad clock")
Signed-off-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
CC: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index b0a1dedac802..8d2e29c9ab2b 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -255,7 +255,7 @@ static int tegra_sor_set_parent_clock(struct tegra_sor *sor, struct clk *parent)
 
 	clk_disable_unprepare(sor->clk);
 
-	err = clk_set_parent(sor->clk_out, parent);
+	err = clk_set_parent(sor->clk_out ? sor->clk_out : sor->clk, parent);
 	if (err < 0)
 		return err;
 
@@ -2698,15 +2698,19 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		sor->clk_pad = NULL;
 	}
 
-	/*
-	 * The bootloader may have set up the SOR such that it's module clock
-	 * is sourced by one of the display PLLs. However, that doesn't work
-	 * without properly having set up other bits of the SOR.
-	 */
-	err = clk_set_parent(sor->clk_out, sor->clk_safe);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to use safe clock: %d\n", err);
-		goto remove;
+	if (sor->clk_out) {
+		/*
+		 * The bootloader may have set up the SOR such that its module
+		 * clock is sourced by one of the display PLLs. However, that
+		 * doesn't work without properly having set up other bits of
+		 * the SOR.
+		 */
+		err = clk_set_parent(sor->clk_out, sor->clk_safe);
+		if (err < 0) {
+			dev_err(&pdev->dev, "failed to use safe clock: %d\n",
+				err);
+			goto remove;
+		}
 	}
 
 	platform_set_drvdata(pdev, sor);
-- 
2.11.0
