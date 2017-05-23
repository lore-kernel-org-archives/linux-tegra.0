From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/22] drm/tegra: Fix lockup on a use of staging API
Date: Tue, 23 May 2017 03:14:16 +0300
Message-ID: <1f58132d9a6580a74e78b30d567fb2c874466def.1495498184.git.digetx@gmail.com>
References: <cover.1495498184.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit bdd2f9cd ("Don't leak kernel pointer to userspace") added a mutex
around staging IOCTL's, some of those mutexes are taken twice.

Fixes: bdd2f9cd10eb ("drm/tegra: Don't leak kernel pointer to userspace")
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 51c48a8e00ec..b49d32a89f40 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -451,18 +451,6 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 
 
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
@@ -606,7 +594,7 @@ static int tegra_close_channel(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = tegra_drm_file_get_context(fpriv, args->context);
+	context = idr_find(&fpriv->contexts, args->context);
 	if (!context) {
 		err = -EINVAL;
 		goto unlock;
@@ -631,7 +619,7 @@ static int tegra_get_syncpt(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = tegra_drm_file_get_context(fpriv, args->context);
+	context = idr_find(&fpriv->contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -660,7 +648,7 @@ static int tegra_submit(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = tegra_drm_file_get_context(fpriv, args->context);
+	context = idr_find(&fpriv->contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -685,7 +673,7 @@ static int tegra_get_syncpt_base(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = tegra_drm_file_get_context(fpriv, args->context);
+	context = idr_find(&fpriv->contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
-- 
2.13.0
