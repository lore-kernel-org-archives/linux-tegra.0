From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 11/27] drm/tegra: Introduce tegra_drm_client structure
Date: Mon,  7 Oct 2013 10:34:28 +0200
Message-ID: <1381134884-5816-12-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This structure derives from host1x_client. DRM-specific fields are moved
from host1x_client to this structure, so that host1x_client can remain
agnostic of DRM.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/dc.c   | 35 ++++++++++++++++++-----------------
 drivers/gpu/host1x/drm/drm.c  | 30 +++++++++++++++++++-----------
 drivers/gpu/host1x/drm/drm.h  | 37 +++++++++++++++++--------------------
 drivers/gpu/host1x/drm/gr2d.c | 42 +++++++++++++++++++++++-------------------
 drivers/gpu/host1x/drm/hdmi.c | 33 +++++++++++++++++----------------
 include/linux/host1x.h        | 20 ++++++++++++++++++++
 6 files changed, 114 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/host1x/drm/dc.c b/drivers/gpu/host1x/drm/dc.c
index e11aec7..5106df0 100644
--- a/drivers/gpu/host1x/drm/dc.c
+++ b/drivers/gpu/host1x/drm/dc.c
@@ -1038,30 +1038,30 @@ static int tegra_dc_debugfs_exit(struct tegra_dc *dc)
 	return 0;
 }
 
-static int tegra_dc_drm_init(struct host1x_client *client,
-			     struct drm_device *drm)
+static int tegra_dc_init(struct host1x_client *client)
 {
-	struct tegra_dc *dc = host1x_client_to_dc(client);
+	struct tegra_drm_client *drm = to_tegra_drm_client(client);
+	struct tegra_dc *dc = tegra_drm_client_to_dc(drm);
 	int err;
 
-	dc->pipe = drm->mode_config.num_crtc;
+	dc->pipe = drm->drm->mode_config.num_crtc;
 
-	drm_crtc_init(drm, &dc->base, &tegra_crtc_funcs);
+	drm_crtc_init(drm->drm, &dc->base, &tegra_crtc_funcs);
 	drm_mode_crtc_set_gamma_size(&dc->base, 256);
 	drm_crtc_helper_add(&dc->base, &tegra_crtc_helper_funcs);
 
-	err = tegra_dc_rgb_init(drm, dc);
+	err = tegra_dc_rgb_init(drm->drm, dc);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(dc->dev, "failed to initialize RGB output: %d\n", err);
 		return err;
 	}
 
-	err = tegra_dc_add_planes(drm, dc);
+	err = tegra_dc_add_planes(drm->drm, dc);
 	if (err < 0)
 		return err;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
-		err = tegra_dc_debugfs_init(dc, drm->primary);
+		err = tegra_dc_debugfs_init(dc, drm->drm->primary);
 		if (err < 0)
 			dev_err(dc->dev, "debugfs setup failed: %d\n", err);
 	}
@@ -1077,9 +1077,10 @@ static int tegra_dc_drm_init(struct host1x_client *client,
 	return 0;
 }
 
-static int tegra_dc_drm_exit(struct host1x_client *client)
+static int tegra_dc_exit(struct host1x_client *client)
 {
-	struct tegra_dc *dc = host1x_client_to_dc(client);
+	struct tegra_drm_client *drm = to_tegra_drm_client(client);
+	struct tegra_dc *dc = tegra_drm_client_to_dc(drm);
 	int err;
 
 	devm_free_irq(dc->dev, dc->irq, dc);
@@ -1100,8 +1101,8 @@ static int tegra_dc_drm_exit(struct host1x_client *client)
 }
 
 static const struct host1x_client_ops dc_client_ops = {
-	.drm_init = tegra_dc_drm_init,
-	.drm_exit = tegra_dc_drm_exit,
+	.init = tegra_dc_init,
+	.exit = tegra_dc_exit,
 };
 
 static int tegra_dc_probe(struct platform_device *pdev)
@@ -1140,9 +1141,9 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	INIT_LIST_HEAD(&dc->client.list);
-	dc->client.ops = &dc_client_ops;
-	dc->client.dev = &pdev->dev;
+	INIT_LIST_HEAD(&dc->client.base.list);
+	dc->client.base.ops = &dc_client_ops;
+	dc->client.base.dev = &pdev->dev;
 
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV) {
@@ -1150,7 +1151,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = host1x_register_client(tegra, &dc->client);
+	err = host1x_register_client(tegra, &dc->client.base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
@@ -1168,7 +1169,7 @@ static int tegra_dc_remove(struct platform_device *pdev)
 	struct tegra_dc *dc = platform_get_drvdata(pdev);
 	int err;
 
-	err = host1x_unregister_client(tegra, &dc->client);
+	err = host1x_unregister_client(tegra, &dc->client.base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
 			err);
diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.c
index 90a1f3d..cb6a4e8 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -131,12 +131,18 @@ int tegra_drm_alloc(struct platform_device *pdev)
 int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm)
 {
 	struct host1x_client *client;
+	int err;
 
 	mutex_lock(&tegra->clients_lock);
 
 	list_for_each_entry(client, &tegra->clients, list) {
-		if (client->ops && client->ops->drm_init) {
-			int err = client->ops->drm_init(client, drm);
+		struct tegra_drm_client *tdc = to_tegra_drm_client(client);
+
+		/* associate client with DRM device */
+		tdc->drm = drm;
+
+		if (client->ops && client->ops->init) {
+			err = client->ops->init(client);
 			if (err < 0) {
 				dev_err(tegra->dev,
 					"DRM setup failed for %s: %d\n",
@@ -154,8 +160,9 @@ int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm)
 
 int tegra_drm_exit(struct tegra_drm *tegra)
 {
-	struct platform_device *pdev = to_platform_device(tegra->dev);
 	struct host1x_client *client;
+	struct platform_device *pdev;
+	int err;
 
 	if (!tegra->drm)
 		return 0;
@@ -163,8 +170,8 @@ int tegra_drm_exit(struct tegra_drm *tegra)
 	mutex_lock(&tegra->clients_lock);
 
 	list_for_each_entry_reverse(client, &tegra->clients, list) {
-		if (client->ops && client->ops->drm_exit) {
-			int err = client->ops->drm_exit(client);
+		if (client->ops && client->ops->exit) {
+			err = client->ops->exit(client);
 			if (err < 0) {
 				dev_err(tegra->dev,
 					"DRM cleanup failed for %s: %d\n",
@@ -177,6 +184,7 @@ int tegra_drm_exit(struct tegra_drm *tegra)
 
 	mutex_unlock(&tegra->clients_lock);
 
+	pdev = to_platform_device(tegra->dev);
 	drm_platform_exit(&tegra_drm_driver, pdev);
 	tegra->drm = NULL;
 
@@ -409,22 +417,22 @@ static int tegra_open_channel(struct drm_device *drm, void *data,
 	struct tegra_drm *tegra = drm->dev_private;
 	struct drm_tegra_open_channel *args = data;
 	struct tegra_drm_context *context;
-	struct host1x_client *client;
+	struct tegra_drm_client *client;
 	int err = -ENODEV;
 
 	context = kzalloc(sizeof(*context), GFP_KERNEL);
 	if (!context)
 		return -ENOMEM;
 
-	list_for_each_entry(client, &tegra->clients, list)
-		if (client->class == args->client) {
+	list_for_each_entry(client, &tegra->clients, base.list)
+		if (client->base.class == args->client) {
 			err = client->ops->open_channel(client, context);
 			if (err)
 				break;
 
-			context->client = client;
 			list_add(&context->list, &fpriv->contexts);
 			args->context = (uintptr_t)context;
+			context->client = client;
 			return 0;
 		}
 
@@ -463,10 +471,10 @@ static int tegra_get_syncpt(struct drm_device *drm, void *data,
 	if (!tegra_drm_file_owns_context(fpriv, context))
 		return -ENODEV;
 
-	if (args->index >= context->client->num_syncpts)
+	if (args->index >= context->client->base.num_syncpts)
 		return -EINVAL;
 
-	syncpt = context->client->syncpts[args->index];
+	syncpt = context->client->base.syncpts[args->index];
 	args->id = host1x_syncpt_id(syncpt);
 
 	return 0;
diff --git a/drivers/gpu/host1x/drm/drm.h b/drivers/gpu/host1x/drm/drm.h
index 78754f6..8c26c6b 100644
--- a/drivers/gpu/host1x/drm/drm.h
+++ b/drivers/gpu/host1x/drm/drm.h
@@ -44,18 +44,16 @@ struct tegra_drm {
 	struct tegra_fbdev *fbdev;
 };
 
-struct host1x_client;
+struct tegra_drm_client;
 
 struct tegra_drm_context {
-	struct host1x_client *client;
+	struct tegra_drm_client *client;
 	struct host1x_channel *channel;
 	struct list_head list;
 };
 
-struct host1x_client_ops {
-	int (*drm_init)(struct host1x_client *client, struct drm_device *drm);
-	int (*drm_exit)(struct host1x_client *client);
-	int (*open_channel)(struct host1x_client *client,
+struct tegra_drm_client_ops {
+	int (*open_channel)(struct tegra_drm_client *client,
 			    struct tegra_drm_context *context);
 	void (*close_channel)(struct tegra_drm_context *context);
 	int (*submit)(struct tegra_drm_context *context,
@@ -63,21 +61,19 @@ struct host1x_client_ops {
 		      struct drm_file *file);
 };
 
-struct host1x_client {
-	struct tegra_drm *tegra;
-	struct device *dev;
-
-	const struct host1x_client_ops *ops;
-
-	enum host1x_class class;
-	struct host1x_channel *channel;
-
-	struct host1x_syncpt **syncpts;
-	unsigned int num_syncpts;
+struct tegra_drm_client {
+	struct host1x_client base;
+	struct drm_device *drm;
 
-	struct list_head list;
+	const struct tegra_drm_client_ops *ops;
 };
 
+static inline struct tegra_drm_client *
+to_tegra_drm_client(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_drm_client, base);
+}
+
 extern int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
 extern int tegra_drm_exit(struct tegra_drm *tegra);
 
@@ -89,7 +85,7 @@ extern int host1x_unregister_client(struct tegra_drm *tegra,
 struct tegra_output;
 
 struct tegra_dc {
-	struct host1x_client client;
+	struct tegra_drm_client client;
 	struct device *dev;
 	spinlock_t lock;
 
@@ -112,7 +108,8 @@ struct tegra_dc {
 	struct drm_pending_vblank_event *event;
 };
 
-static inline struct tegra_dc *host1x_client_to_dc(struct host1x_client *client)
+static inline struct tegra_dc *
+tegra_drm_client_to_dc(struct tegra_drm_client *client)
 {
 	return container_of(client, struct tegra_dc, client);
 }
diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index fc4476d..e814918 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -25,18 +25,17 @@
 #include "syncpt.h"
 
 struct gr2d {
-	struct host1x_client client;
+	struct tegra_drm_client client;
 	struct host1x_channel *channel;
 	struct clk *clk;
 };
 
-static inline struct gr2d *to_gr2d(struct host1x_client *client)
+static inline struct gr2d *to_gr2d(struct tegra_drm_client *client)
 {
 	return container_of(client, struct gr2d, client);
 }
 
-static int gr2d_client_init(struct host1x_client *client,
-			    struct drm_device *drm)
+static int gr2d_client_init(struct host1x_client *client)
 {
 	return 0;
 }
@@ -46,7 +45,12 @@ static int gr2d_client_exit(struct host1x_client *client)
 	return 0;
 }
 
-static int gr2d_open_channel(struct host1x_client *client,
+static const struct host1x_client_ops gr2d_client_ops = {
+	.init = gr2d_client_init,
+	.exit = gr2d_client_exit,
+};
+
+static int gr2d_open_channel(struct tegra_drm_client *client,
 			     struct tegra_drm_context *context)
 {
 	struct gr2d *gr2d = to_gr2d(client);
@@ -139,7 +143,7 @@ static int gr2d_submit(struct tegra_drm_context *context,
 	job->num_relocs = args->num_relocs;
 	job->num_waitchk = args->num_waitchks;
 	job->client = (u32)args->context;
-	job->class = context->client->class;
+	job->class = context->client->base.class;
 	job->serialize = true;
 
 	while (num_cmdbufs) {
@@ -200,7 +204,7 @@ static int gr2d_submit(struct tegra_drm_context *context,
 	if (args->timeout && args->timeout < 10000)
 		job->timeout = args->timeout;
 
-	err = host1x_job_pin(job, context->client->dev);
+	err = host1x_job_pin(job, context->client->base.dev);
 	if (err)
 		goto fail;
 
@@ -220,9 +224,7 @@ fail:
 	return err;
 }
 
-static struct host1x_client_ops gr2d_client_ops = {
-	.drm_init = gr2d_client_init,
-	.drm_exit = gr2d_client_exit,
+static const struct tegra_drm_client_ops gr2d_ops = {
 	.open_channel = gr2d_open_channel,
 	.close_channel = gr2d_close_channel,
 	.submit = gr2d_submit,
@@ -272,13 +274,15 @@ static int gr2d_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	gr2d->client.ops = &gr2d_client_ops;
-	gr2d->client.dev = dev;
-	gr2d->client.class = HOST1X_CLASS_GR2D;
-	gr2d->client.syncpts = syncpts;
-	gr2d->client.num_syncpts = 1;
+	INIT_LIST_HEAD(&gr2d->client.base.list);
+	gr2d->client.base.ops = &gr2d_client_ops;
+	gr2d->client.base.dev = dev;
+	gr2d->client.base.class = HOST1X_CLASS_GR2D;
+	gr2d->client.base.syncpts = syncpts;
+	gr2d->client.base.num_syncpts = 1;
+	gr2d->client.ops = &gr2d_ops;
 
-	err = host1x_register_client(tegra, &gr2d->client);
+	err = host1x_register_client(tegra, &gr2d->client.base);
 	if (err < 0) {
 		dev_err(dev, "failed to register host1x client: %d\n", err);
 		return err;
@@ -296,15 +300,15 @@ static int gr2d_remove(struct platform_device *pdev)
 	unsigned int i;
 	int err;
 
-	err = host1x_unregister_client(tegra, &gr2d->client);
+	err = host1x_unregister_client(tegra, &gr2d->client.base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
 			err);
 		return err;
 	}
 
-	for (i = 0; i < gr2d->client.num_syncpts; i++)
-		host1x_syncpt_free(gr2d->client.syncpts[i]);
+	for (i = 0; i < gr2d->client.base.num_syncpts; i++)
+		host1x_syncpt_free(gr2d->client.base.syncpts[i]);
 
 	host1x_channel_free(gr2d->channel);
 	clk_disable_unprepare(gr2d->clk);
diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
index 5d8c41c..30ac9e8 100644
--- a/drivers/gpu/host1x/drm/hdmi.c
+++ b/drivers/gpu/host1x/drm/hdmi.c
@@ -19,7 +19,7 @@
 #include "host1x_client.h"
 
 struct tegra_hdmi {
-	struct host1x_client client;
+	struct tegra_drm_client client;
 	struct tegra_output output;
 	struct device *dev;
 
@@ -43,7 +43,7 @@ struct tegra_hdmi {
 };
 
 static inline struct tegra_hdmi *
-host1x_client_to_hdmi(struct host1x_client *client)
+tegra_drm_client_to_hdmi(struct tegra_drm_client *client)
 {
 	return container_of(client, struct tegra_hdmi, client);
 }
@@ -1116,24 +1116,24 @@ static int tegra_hdmi_debugfs_exit(struct tegra_hdmi *hdmi)
 	return 0;
 }
 
-static int tegra_hdmi_drm_init(struct host1x_client *client,
-			       struct drm_device *drm)
+static int tegra_hdmi_init(struct host1x_client *client)
 {
-	struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
+	struct tegra_drm_client *drm = to_tegra_drm_client(client);
+	struct tegra_hdmi *hdmi = tegra_drm_client_to_hdmi(drm);
 	int err;
 
 	hdmi->output.type = TEGRA_OUTPUT_HDMI;
 	hdmi->output.dev = client->dev;
 	hdmi->output.ops = &hdmi_ops;
 
-	err = tegra_output_init(drm, &hdmi->output);
+	err = tegra_output_init(drm->drm, &hdmi->output);
 	if (err < 0) {
 		dev_err(client->dev, "output setup failed: %d\n", err);
 		return err;
 	}
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
-		err = tegra_hdmi_debugfs_init(hdmi, drm->primary);
+		err = tegra_hdmi_debugfs_init(hdmi, drm->drm->primary);
 		if (err < 0)
 			dev_err(client->dev, "debugfs setup failed: %d\n", err);
 	}
@@ -1141,9 +1141,10 @@ static int tegra_hdmi_drm_init(struct host1x_client *client,
 	return 0;
 }
 
-static int tegra_hdmi_drm_exit(struct host1x_client *client)
+static int tegra_hdmi_exit(struct host1x_client *client)
 {
-	struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
+	struct tegra_drm_client *drm = to_tegra_drm_client(client);
+	struct tegra_hdmi *hdmi = tegra_drm_client_to_hdmi(drm);
 	int err;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
@@ -1169,8 +1170,8 @@ static int tegra_hdmi_drm_exit(struct host1x_client *client)
 }
 
 static const struct host1x_client_ops hdmi_client_ops = {
-	.drm_init = tegra_hdmi_drm_init,
-	.drm_exit = tegra_hdmi_drm_exit,
+	.init = tegra_hdmi_init,
+	.exit = tegra_hdmi_exit,
 };
 
 static int tegra_hdmi_probe(struct platform_device *pdev)
@@ -1246,11 +1247,11 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->irq = err;
 
-	hdmi->client.ops = &hdmi_client_ops;
-	INIT_LIST_HEAD(&hdmi->client.list);
-	hdmi->client.dev = &pdev->dev;
+	INIT_LIST_HEAD(&hdmi->client.base.list);
+	hdmi->client.base.ops = &hdmi_client_ops;
+	hdmi->client.base.dev = &pdev->dev;
 
-	err = host1x_register_client(tegra, &hdmi->client);
+	err = host1x_register_client(tegra, &hdmi->client.base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
@@ -1268,7 +1269,7 @@ static int tegra_hdmi_remove(struct platform_device *pdev)
 	struct tegra_hdmi *hdmi = platform_get_drvdata(pdev);
 	int err;
 
-	err = host1x_unregister_client(tegra, &hdmi->client);
+	err = host1x_unregister_client(tegra, &hdmi->client.base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
 			err);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index fe09939..d429a93 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -25,4 +25,24 @@ enum host1x_class {
 	HOST1X_CLASS_GR2D_SB = 0x52,
 };
 
+struct host1x_client;
+
+struct host1x_client_ops {
+	int (*init)(struct host1x_client *client);
+	int (*exit)(struct host1x_client *client);
+};
+
+struct host1x_client {
+	struct list_head list;
+	struct device *dev;
+
+	const struct host1x_client_ops *ops;
+
+	enum host1x_class class;
+	struct host1x_channel *channel;
+
+	struct host1x_syncpt **syncpts;
+	unsigned int num_syncpts;
+};
+
 #endif
-- 
1.8.4
