From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 04/27] drm/tegra: Rename host1x_drm_file to tegra_drm_file
Date: Mon,  7 Oct 2013 10:34:21 +0200
Message-ID: <1381134884-5816-5-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This structure extends drm_file with Tegra DRM specific fields and has
nothing to do with host1x. Rename the structure to more clearly mark the
boundaries between host1x and Tegra DRM.

While at it, move the structure definition out of the header. It's never
used outside of the drm.c source file, so it can be defined within that.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/drm.c | 26 +++++++++++++++-----------
 drivers/gpu/host1x/drm/drm.h |  4 ----
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.c
index 7230b40..67fd856 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -30,6 +30,10 @@
 #define DRIVER_MINOR 0
 #define DRIVER_PATCHLEVEL 0
 
+struct tegra_drm_file {
+	struct list_head contexts;
+};
+
 struct host1x_subdev {
 	struct host1x_client *client;
 	struct device_node *np;
@@ -290,7 +294,7 @@ static int tegra_drm_unload(struct drm_device *drm)
 
 static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 {
-	struct host1x_drm_file *fpriv;
+	struct tegra_drm_file *fpriv;
 
 	fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
 	if (!fpriv)
@@ -316,8 +320,8 @@ static void tegra_drm_lastclose(struct drm_device *drm)
 }
 
 #ifdef CONFIG_DRM_TEGRA_STAGING
-static bool host1x_drm_file_owns_context(struct host1x_drm_file *file,
-					 struct host1x_drm_context *context)
+static bool tegra_drm_file_owns_context(struct tegra_drm_file *file,
+					struct host1x_drm_context *context)
 {
 	struct host1x_drm_context *ctx;
 
@@ -406,7 +410,7 @@ static int tegra_syncpt_wait(struct drm_device *drm, void *data,
 static int tegra_open_channel(struct drm_device *drm, void *data,
 			      struct drm_file *file)
 {
-	struct host1x_drm_file *fpriv = file->driver_priv;
+	struct tegra_drm_file *fpriv = file->driver_priv;
 	struct tegra_drm *tegra = drm->dev_private;
 	struct drm_tegra_open_channel *args = data;
 	struct host1x_drm_context *context;
@@ -437,11 +441,11 @@ static int tegra_close_channel(struct drm_device *drm, void *data,
 			       struct drm_file *file)
 {
 	struct drm_tegra_close_channel *args = data;
-	struct host1x_drm_file *fpriv = file->driver_priv;
+	struct tegra_drm_file *fpriv = file->driver_priv;
 	struct host1x_drm_context *context =
 		(struct host1x_drm_context *)(uintptr_t)args->context;
 
-	if (!host1x_drm_file_owns_context(fpriv, context))
+	if (!tegra_drm_file_owns_context(fpriv, context))
 		return -EINVAL;
 
 	list_del(&context->list);
@@ -453,13 +457,13 @@ static int tegra_close_channel(struct drm_device *drm, void *data,
 static int tegra_get_syncpt(struct drm_device *drm, void *data,
 			    struct drm_file *file)
 {
+	struct tegra_drm_file *fpriv = file->driver_priv;
 	struct drm_tegra_get_syncpt *args = data;
-	struct host1x_drm_file *fpriv = file->driver_priv;
 	struct host1x_drm_context *context =
 		(struct host1x_drm_context *)(uintptr_t)args->context;
 	struct host1x_syncpt *syncpt;
 
-	if (!host1x_drm_file_owns_context(fpriv, context))
+	if (!tegra_drm_file_owns_context(fpriv, context))
 		return -ENODEV;
 
 	if (args->index >= context->client->num_syncpts)
@@ -474,12 +478,12 @@ static int tegra_get_syncpt(struct drm_device *drm, void *data,
 static int tegra_submit(struct drm_device *drm, void *data,
 			struct drm_file *file)
 {
+	struct tegra_drm_file *fpriv = file->driver_priv;
 	struct drm_tegra_submit *args = data;
-	struct host1x_drm_file *fpriv = file->driver_priv;
 	struct host1x_drm_context *context =
 		(struct host1x_drm_context *)(uintptr_t)args->context;
 
-	if (!host1x_drm_file_owns_context(fpriv, context))
+	if (!tegra_drm_file_owns_context(fpriv, context))
 		return -ENODEV;
 
 	return context->client->ops->submit(context, args, drm, file);
@@ -558,7 +562,7 @@ static void tegra_drm_disable_vblank(struct drm_device *drm, int pipe)
 
 static void tegra_drm_preclose(struct drm_device *drm, struct drm_file *file)
 {
-	struct host1x_drm_file *fpriv = file->driver_priv;
+	struct tegra_drm_file *fpriv = file->driver_priv;
 	struct host1x_drm_context *context, *tmp;
 	struct drm_crtc *crtc;
 
diff --git a/drivers/gpu/host1x/drm/drm.h b/drivers/gpu/host1x/drm/drm.h
index 858bfc0..74869d3 100644
--- a/drivers/gpu/host1x/drm/drm.h
+++ b/drivers/gpu/host1x/drm/drm.h
@@ -63,10 +63,6 @@ struct host1x_client_ops {
 		      struct drm_file *file);
 };
 
-struct host1x_drm_file {
-	struct list_head contexts;
-};
-
 struct host1x_client {
 	struct tegra_drm *tegra;
 	struct device *dev;
-- 
1.8.4
