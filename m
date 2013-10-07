From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 05/27] drm/tegra: Rename host1x_drm_context to tegra_drm_context
Date: Mon,  7 Oct 2013 10:34:22 +0200
Message-ID: <1381134884-5816-6-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The structure represents a context associated with a particular process
that has opened the Tegra DRM device and requested a channel. This is a
very DRM-specific notion and has nothing to do with host1x. Rename the
structure to more clearly mark the boundaries between the two.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/drm.c  | 34 +++++++++++++++++++++-------------
 drivers/gpu/host1x/drm/drm.h  |  8 ++++----
 drivers/gpu/host1x/drm/gr2d.c |  6 +++---
 3 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.c
index 67fd856..7f8f419 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -306,7 +306,7 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 	return 0;
 }
 
-static void host1x_drm_context_free(struct host1x_drm_context *context)
+static void tegra_drm_context_free(struct tegra_drm_context *context)
 {
 	context->client->ops->close_channel(context);
 	kfree(context);
@@ -320,10 +320,15 @@ static void tegra_drm_lastclose(struct drm_device *drm)
 }
 
 #ifdef CONFIG_DRM_TEGRA_STAGING
+static struct tegra_drm_context *tegra_drm_get_context(__u64 context)
+{
+	return (struct tegra_drm_context *)(uintptr_t)context;
+}
+
 static bool tegra_drm_file_owns_context(struct tegra_drm_file *file,
-					struct host1x_drm_context *context)
+					struct tegra_drm_context *context)
 {
-	struct host1x_drm_context *ctx;
+	struct tegra_drm_context *ctx;
 
 	list_for_each_entry(ctx, &file->contexts, list)
 		if (ctx == context)
@@ -413,7 +418,7 @@ static int tegra_open_channel(struct drm_device *drm, void *data,
 	struct tegra_drm_file *fpriv = file->driver_priv;
 	struct tegra_drm *tegra = drm->dev_private;
 	struct drm_tegra_open_channel *args = data;
-	struct host1x_drm_context *context;
+	struct tegra_drm_context *context;
 	struct host1x_client *client;
 	int err = -ENODEV;
 
@@ -442,14 +447,15 @@ static int tegra_close_channel(struct drm_device *drm, void *data,
 {
 	struct drm_tegra_close_channel *args = data;
 	struct tegra_drm_file *fpriv = file->driver_priv;
-	struct host1x_drm_context *context =
-		(struct host1x_drm_context *)(uintptr_t)args->context;
+	struct tegra_drm_context *context;
+
+	context = tegra_drm_get_context(args->context);
 
 	if (!tegra_drm_file_owns_context(fpriv, context))
 		return -EINVAL;
 
 	list_del(&context->list);
-	host1x_drm_context_free(context);
+	tegra_drm_context_free(context);
 
 	return 0;
 }
@@ -459,10 +465,11 @@ static int tegra_get_syncpt(struct drm_device *drm, void *data,
 {
 	struct tegra_drm_file *fpriv = file->driver_priv;
 	struct drm_tegra_get_syncpt *args = data;
-	struct host1x_drm_context *context =
-		(struct host1x_drm_context *)(uintptr_t)args->context;
+	struct tegra_drm_context *context;
 	struct host1x_syncpt *syncpt;
 
+	context = tegra_drm_get_context(args->context);
+
 	if (!tegra_drm_file_owns_context(fpriv, context))
 		return -ENODEV;
 
@@ -480,8 +487,9 @@ static int tegra_submit(struct drm_device *drm, void *data,
 {
 	struct tegra_drm_file *fpriv = file->driver_priv;
 	struct drm_tegra_submit *args = data;
-	struct host1x_drm_context *context =
-		(struct host1x_drm_context *)(uintptr_t)args->context;
+	struct tegra_drm_context *context;
+
+	context = tegra_drm_get_context(args->context);
 
 	if (!tegra_drm_file_owns_context(fpriv, context))
 		return -ENODEV;
@@ -563,14 +571,14 @@ static void tegra_drm_disable_vblank(struct drm_device *drm, int pipe)
 static void tegra_drm_preclose(struct drm_device *drm, struct drm_file *file)
 {
 	struct tegra_drm_file *fpriv = file->driver_priv;
-	struct host1x_drm_context *context, *tmp;
+	struct tegra_drm_context *context, *tmp;
 	struct drm_crtc *crtc;
 
 	list_for_each_entry(crtc, &drm->mode_config.crtc_list, head)
 		tegra_dc_cancel_page_flip(crtc, file);
 
 	list_for_each_entry_safe(context, tmp, &fpriv->contexts, list)
-		host1x_drm_context_free(context);
+		tegra_drm_context_free(context);
 
 	kfree(fpriv);
 }
diff --git a/drivers/gpu/host1x/drm/drm.h b/drivers/gpu/host1x/drm/drm.h
index 74869d3..dd6b98b 100644
--- a/drivers/gpu/host1x/drm/drm.h
+++ b/drivers/gpu/host1x/drm/drm.h
@@ -46,7 +46,7 @@ struct tegra_drm {
 
 struct host1x_client;
 
-struct host1x_drm_context {
+struct tegra_drm_context {
 	struct host1x_client *client;
 	struct host1x_channel *channel;
 	struct list_head list;
@@ -56,9 +56,9 @@ struct host1x_client_ops {
 	int (*drm_init)(struct host1x_client *client, struct drm_device *drm);
 	int (*drm_exit)(struct host1x_client *client);
 	int (*open_channel)(struct host1x_client *client,
-			    struct host1x_drm_context *context);
-	void (*close_channel)(struct host1x_drm_context *context);
-	int (*submit)(struct host1x_drm_context *context,
+			    struct tegra_drm_context *context);
+	void (*close_channel)(struct tegra_drm_context *context);
+	int (*submit)(struct tegra_drm_context *context,
 		      struct drm_tegra_submit *args, struct drm_device *drm,
 		      struct drm_file *file);
 };
diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index 5f838b1..06507c8 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -58,7 +58,7 @@ static int gr2d_client_exit(struct host1x_client *client)
 }
 
 static int gr2d_open_channel(struct host1x_client *client,
-			     struct host1x_drm_context *context)
+			     struct tegra_drm_context *context)
 {
 	struct gr2d *gr2d = to_gr2d(client);
 
@@ -70,7 +70,7 @@ static int gr2d_open_channel(struct host1x_client *client,
 	return 0;
 }
 
-static void gr2d_close_channel(struct host1x_drm_context *context)
+static void gr2d_close_channel(struct tegra_drm_context *context)
 {
 	host1x_channel_put(context->channel);
 }
@@ -94,7 +94,7 @@ static struct host1x_bo *host1x_bo_lookup(struct drm_device *drm,
 	return &bo->base;
 }
 
-static int gr2d_submit(struct host1x_drm_context *context,
+static int gr2d_submit(struct tegra_drm_context *context,
 		       struct drm_tegra_submit *args, struct drm_device *drm,
 		       struct drm_file *file)
 {
-- 
1.8.4
