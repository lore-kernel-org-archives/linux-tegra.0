From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH AUTOSEL 5.4 060/205] drm/tegra: Fix ordering of cleanup code
Date: Thu, 16 Jan 2020 11:40:35 -0500
Message-ID: <20200116164300.6705-60-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200116164300.6705-1-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

[ Upstream commit 051172e8c1ceef8749f19faacc1d3bef65d20d8d ]

Commit Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after
initialization") changed the initialization order of the IOMMU related
bits but didn't update the cleanup path accordingly. This asymmetry can
cause failures during error recovery.

Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after initialization")
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6fb7d74ff553..bc7cc32140f8 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -201,19 +201,19 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 	if (tegra->hub)
 		tegra_display_hub_cleanup(tegra->hub);
 device:
-	host1x_device_exit(device);
-fbdev:
-	drm_kms_helper_poll_fini(drm);
-	tegra_drm_fb_free(drm);
-config:
-	drm_mode_config_cleanup(drm);
-
 	if (tegra->domain) {
 		mutex_destroy(&tegra->mm_lock);
 		drm_mm_takedown(&tegra->mm);
 		put_iova_domain(&tegra->carveout.domain);
 		iova_cache_put();
 	}
+
+	host1x_device_exit(device);
+fbdev:
+	drm_kms_helper_poll_fini(drm);
+	tegra_drm_fb_free(drm);
+config:
+	drm_mode_config_cleanup(drm);
 domain:
 	if (tegra->domain)
 		iommu_domain_free(tegra->domain);
-- 
2.20.1
