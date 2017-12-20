From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [RFC PATCH v2 1/1] drm/tegra: sor: Fix hang on tegra124 due to NULL clk_out
Date: Wed, 20 Dec 2017 11:32:23 +0000
Message-ID: <0f776b7500ee0e74b316b9803803b309779d2ff7.1513768618.git.guillaume.tucker@collabora.com>
References: <cover.1513768618.git.guillaume.tucker@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1513768618.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <cover.1513768618.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
References: <cover.1513768618.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When neither HDMI nor DP is supported such as on the tegra124, the
sor->clk_out is not initialised and remains NULL.  In this case, the
parent clock can't be assigned to it so revert to the previous
behaviour of assigning it to the main sor->clk instead.

This fixes a kernel hang on tegra124 and should also affect tegra210
as they both don't support HDMI and DP.  Tested on tegra124 only.

Fixes: e1335e2f0cfc ("drm/tegra: sor: Reimplement pad clock")
Signed-off-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
CC: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index b0a1dedac802..a344f66d4ecb 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -255,7 +255,7 @@ static int tegra_sor_set_parent_clock(struct tegra_sor *sor, struct clk *parent)
 
 	clk_disable_unprepare(sor->clk);
 
-	err = clk_set_parent(sor->clk_out, parent);
+	err = clk_set_parent(sor->clk_out ? sor->clk_out : sor->clk, parent);
 	if (err < 0)
 		return err;
 
-- 
2.11.0
