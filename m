From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH RESEND 2/4] drm/tegra: switch to postclose
Date: Mon,  8 May 2017 10:26:31 +0200
Message-ID: <20170508082633.4214-2-daniel.vetter@ffwll.ch>
References: <20170508082633.4214-1-daniel.vetter@ffwll.ch>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170508082633.4214-1-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I didn't spot anything that would require ordering here (well not
anywhere else either), and I'm trying to unify at least modern drivers
on one close hook.

Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Reviewed-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 9a1e34e48f64..51c48a8e00ec 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -892,7 +892,7 @@ static int tegra_drm_context_cleanup(int id, void *p, void *data)
 	return 0;
 }
 
-static void tegra_drm_preclose(struct drm_device *drm, struct drm_file *file)
+static void tegra_drm_postclose(struct drm_device *drm, struct drm_file *file)
 {
 	struct tegra_drm_file *fpriv = file->driver_priv;
 
@@ -960,7 +960,7 @@ static struct drm_driver tegra_drm_driver = {
 	.load = tegra_drm_load,
 	.unload = tegra_drm_unload,
 	.open = tegra_drm_open,
-	.preclose = tegra_drm_preclose,
+	.postclose = tegra_drm_postclose,
 	.lastclose = tegra_drm_lastclose,
 
 #if defined(CONFIG_DEBUG_FS)
-- 
2.11.0
