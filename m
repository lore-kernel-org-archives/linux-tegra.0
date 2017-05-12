From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] drm/tegra: Fix lockup on a use of staging API
Date: Fri, 12 May 2017 22:00:43 +0300
Message-ID: <20170512190044.17541-1-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit bdd2f9cd ("Don't leak kernel pointer to userspace") added a mutex
around staging IOCTL's, some of those mutexes are taken twice.

Fixes: bdd2f9cd10eb ("drm/tegra: Don't leak kernel pointer to userspace")
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ab2dfd4e4bd9..768750226452 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -430,18 +430,6 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 
 
 #ifdef CONFIG_DRM_TEGRA_STAGING
-static struct tegra_drm_context *
-tegra_drm_file_get_context(struct tegra_drm_file *file, u32 id)
-{
-	struct tegra_drm_context *context;
-
-	mutex_lock(&file->lock);
-	context = idr_find(&file->contexts, id);
-	mutex_unlock(&file->lock);
-
-	return context;
-}
-
 static int tegra_gem_create(struct drm_device *drm, void *data,
 			    struct drm_file *file)
 {
@@ -585,7 +573,7 @@ static int tegra_close_channel(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = tegra_drm_file_get_context(fpriv, args->context);
+	context = idr_find(&fpriv->contexts, args->context);
 	if (!context) {
 		err = -EINVAL;
 		goto unlock;
@@ -610,7 +598,7 @@ static int tegra_get_syncpt(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = tegra_drm_file_get_context(fpriv, args->context);
+	context = idr_find(&fpriv->contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -639,7 +627,7 @@ static int tegra_submit(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = tegra_drm_file_get_context(fpriv, args->context);
+	context = idr_find(&fpriv->contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -664,7 +652,7 @@ static int tegra_get_syncpt_base(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = tegra_drm_file_get_context(fpriv, args->context);
+	context = idr_find(&fpriv->contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
-- 
2.12.2
