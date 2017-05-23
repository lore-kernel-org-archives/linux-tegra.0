From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/22] drm/tegra: dc: Drop the reset asserts to workaround a bug
Date: Tue, 23 May 2017 03:14:23 +0300
Message-ID: <35e1ef44da98701b2c507c31ecc0812530303d2d.1495498184.git.digetx@gmail.com>
References: <cover.1495498184.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 33a8eb8 ("Implement runtime PM") introduced HW reset control. It
causes a hang on Tegra20 if both display controllers are utilized (RGB
panel and HDMI). The TRM suggests that each display controller has its own
reset control, apparently it is not correct. Let's remove the interaction
with the resets for now as a workaround.

Fixes: 33a8eb8d40ee ("drm/tegra: dc: Implement runtime PM")
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 95b373f739f2..5c9b93981af2 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1989,8 +1989,6 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->rst);
 	}
 
-	reset_control_assert(dc->rst);
-
 	if (dc->soc->has_powergate) {
 		if (dc->pipe == 0)
 			dc->powergate = TEGRA_POWERGATE_DIS;
@@ -2061,13 +2059,6 @@ static int tegra_dc_remove(struct platform_device *pdev)
 static int tegra_dc_suspend(struct device *dev)
 {
 	struct tegra_dc *dc = dev_get_drvdata(dev);
-	int err;
-
-	err = reset_control_assert(dc->rst);
-	if (err < 0) {
-		dev_err(dev, "failed to assert reset: %d\n", err);
-		return err;
-	}
 
 	if (dc->soc->has_powergate)
 		tegra_powergate_power_off(dc->powergate);
@@ -2095,12 +2086,6 @@ static int tegra_dc_resume(struct device *dev)
 			dev_err(dev, "failed to enable clock: %d\n", err);
 			return err;
 		}
-
-		err = reset_control_deassert(dc->rst);
-		if (err < 0) {
-			dev_err(dev, "failed to deassert reset: %d\n", err);
-			return err;
-		}
 	}
 
 	return 0;
-- 
2.13.0
