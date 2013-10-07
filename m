From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 03/27] drm/tegra: Rename host1x_drm structure to tegra_drm
Date: Mon,  7 Oct 2013 10:34:20 +0200
Message-ID: <1381134884-5816-4-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The host1x and Tegra DRM drivers are currently tightly coupled. Renaming
the structure marks the boundary more clearly.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/dev.c           |   2 +-
 drivers/gpu/host1x/drm/dc.c        |   8 +-
 drivers/gpu/host1x/drm/drm.c       | 169 ++++++++++++++++++-------------------
 drivers/gpu/host1x/drm/drm.h       |  18 ++--
 drivers/gpu/host1x/drm/fb.c        |  14 +--
 drivers/gpu/host1x/drm/gr2d.c      |   8 +-
 drivers/gpu/host1x/drm/hdmi.c      |   8 +-
 drivers/gpu/host1x/host1x_client.h |   4 +-
 8 files changed, 115 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 4716302..0f7b44c 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -163,7 +163,7 @@ static int host1x_probe(struct platform_device *pdev)
 
 	host1x_debug_init(host);
 
-	host1x_drm_alloc(pdev);
+	tegra_drm_alloc(pdev);
 
 	return 0;
 
diff --git a/drivers/gpu/host1x/drm/dc.c b/drivers/gpu/host1x/drm/dc.c
index b1a05ad..c4765b3 100644
--- a/drivers/gpu/host1x/drm/dc.c
+++ b/drivers/gpu/host1x/drm/dc.c
@@ -1109,7 +1109,7 @@ static const struct host1x_client_ops dc_client_ops = {
 
 static int tegra_dc_probe(struct platform_device *pdev)
 {
-	struct host1x_drm *host1x = host1x_get_drm_data(pdev->dev.parent);
+	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
 	struct resource *regs;
 	struct tegra_dc *dc;
 	int err;
@@ -1153,7 +1153,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = host1x_register_client(host1x, &dc->client);
+	err = host1x_register_client(tegra, &dc->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
@@ -1167,11 +1167,11 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 static int tegra_dc_remove(struct platform_device *pdev)
 {
-	struct host1x_drm *host1x = host1x_get_drm_data(pdev->dev.parent);
+	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
 	struct tegra_dc *dc = platform_get_drvdata(pdev);
 	int err;
 
-	err = host1x_unregister_client(host1x, &dc->client);
+	err = host1x_unregister_client(tegra, &dc->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
 			err);
diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.c
index 8c61cee..7230b40 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -30,56 +30,55 @@
 #define DRIVER_MINOR 0
 #define DRIVER_PATCHLEVEL 0
 
-struct host1x_drm_client {
+struct host1x_subdev {
 	struct host1x_client *client;
 	struct device_node *np;
 	struct list_head list;
 };
 
-static int host1x_add_drm_client(struct host1x_drm *host1x,
-				 struct device_node *np)
+static int host1x_subdev_add(struct tegra_drm *tegra, struct device_node *np)
 {
-	struct host1x_drm_client *client;
+	struct host1x_subdev *subdev;
 
-	client = kzalloc(sizeof(*client), GFP_KERNEL);
-	if (!client)
+	subdev = kzalloc(sizeof(*subdev), GFP_KERNEL);
+	if (!subdev)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&client->list);
-	client->np = of_node_get(np);
+	INIT_LIST_HEAD(&subdev->list);
+	subdev->np = of_node_get(np);
 
-	list_add_tail(&client->list, &host1x->drm_clients);
+	list_add_tail(&subdev->list, &tegra->subdevs);
 
 	return 0;
 }
 
-static int host1x_activate_drm_client(struct host1x_drm *host1x,
-				      struct host1x_drm_client *drm,
-				      struct host1x_client *client)
+static int host1x_subdev_register(struct tegra_drm *tegra,
+				  struct host1x_subdev *subdev,
+				  struct host1x_client *client)
 {
-	mutex_lock(&host1x->drm_clients_lock);
-	list_del_init(&drm->list);
-	list_add_tail(&drm->list, &host1x->drm_active);
-	drm->client = client;
-	mutex_unlock(&host1x->drm_clients_lock);
+	mutex_lock(&tegra->subdevs_lock);
+	list_del_init(&subdev->list);
+	list_add_tail(&subdev->list, &tegra->active);
+	subdev->client = client;
+	mutex_unlock(&tegra->subdevs_lock);
 
 	return 0;
 }
 
-static int host1x_remove_drm_client(struct host1x_drm *host1x,
-				    struct host1x_drm_client *client)
+static int host1x_subdev_unregister(struct tegra_drm *tegra,
+				    struct host1x_subdev *subdev)
 {
-	mutex_lock(&host1x->drm_clients_lock);
-	list_del_init(&client->list);
-	mutex_unlock(&host1x->drm_clients_lock);
+	mutex_lock(&tegra->subdevs_lock);
+	list_del_init(&subdev->list);
+	mutex_unlock(&tegra->subdevs_lock);
 
-	of_node_put(client->np);
-	kfree(client);
+	of_node_put(subdev->np);
+	kfree(subdev);
 
 	return 0;
 }
 
-static int host1x_parse_dt(struct host1x_drm *host1x)
+static int tegra_parse_dt(struct tegra_drm *tegra)
 {
 	static const char * const compat[] = {
 		"nvidia,tegra20-dc",
@@ -95,10 +94,10 @@ static int host1x_parse_dt(struct host1x_drm *host1x)
 	for (i = 0; i < ARRAY_SIZE(compat); i++) {
 		struct device_node *np;
 
-		for_each_child_of_node(host1x->dev->of_node, np) {
+		for_each_child_of_node(tegra->dev->of_node, np) {
 			if (of_device_is_compatible(np, compat[i]) &&
 			    of_device_is_available(np)) {
-				err = host1x_add_drm_client(host1x, np);
+				err = host1x_subdev_add(tegra, np);
 				if (err < 0)
 					return err;
 			}
@@ -108,108 +107,108 @@ static int host1x_parse_dt(struct host1x_drm *host1x)
 	return 0;
 }
 
-int host1x_drm_alloc(struct platform_device *pdev)
+int tegra_drm_alloc(struct platform_device *pdev)
 {
-	struct host1x_drm *host1x;
+	struct tegra_drm *tegra;
 	int err;
 
-	host1x = devm_kzalloc(&pdev->dev, sizeof(*host1x), GFP_KERNEL);
-	if (!host1x)
+	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
+	if (!tegra)
 		return -ENOMEM;
 
-	mutex_init(&host1x->drm_clients_lock);
-	INIT_LIST_HEAD(&host1x->drm_clients);
-	INIT_LIST_HEAD(&host1x->drm_active);
-	mutex_init(&host1x->clients_lock);
-	INIT_LIST_HEAD(&host1x->clients);
-	host1x->dev = &pdev->dev;
+	mutex_init(&tegra->subdevs_lock);
+	INIT_LIST_HEAD(&tegra->subdevs);
+	INIT_LIST_HEAD(&tegra->active);
+	mutex_init(&tegra->clients_lock);
+	INIT_LIST_HEAD(&tegra->clients);
+	tegra->dev = &pdev->dev;
 
-	err = host1x_parse_dt(host1x);
+	err = tegra_parse_dt(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to parse DT: %d\n", err);
 		return err;
 	}
 
-	host1x_set_drm_data(&pdev->dev, host1x);
+	host1x_set_drm_data(&pdev->dev, tegra);
 
 	return 0;
 }
 
-int host1x_drm_init(struct host1x_drm *host1x, struct drm_device *drm)
+int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm)
 {
 	struct host1x_client *client;
 
-	mutex_lock(&host1x->clients_lock);
+	mutex_lock(&tegra->clients_lock);
 
-	list_for_each_entry(client, &host1x->clients, list) {
+	list_for_each_entry(client, &tegra->clients, list) {
 		if (client->ops && client->ops->drm_init) {
 			int err = client->ops->drm_init(client, drm);
 			if (err < 0) {
-				dev_err(host1x->dev,
+				dev_err(tegra->dev,
 					"DRM setup failed for %s: %d\n",
 					dev_name(client->dev), err);
-				mutex_unlock(&host1x->clients_lock);
+				mutex_unlock(&tegra->clients_lock);
 				return err;
 			}
 		}
 	}
 
-	mutex_unlock(&host1x->clients_lock);
+	mutex_unlock(&tegra->clients_lock);
 
 	return 0;
 }
 
-int host1x_drm_exit(struct host1x_drm *host1x)
+int tegra_drm_exit(struct tegra_drm *tegra)
 {
-	struct platform_device *pdev = to_platform_device(host1x->dev);
+	struct platform_device *pdev = to_platform_device(tegra->dev);
 	struct host1x_client *client;
 
-	if (!host1x->drm)
+	if (!tegra->drm)
 		return 0;
 
-	mutex_lock(&host1x->clients_lock);
+	mutex_lock(&tegra->clients_lock);
 
-	list_for_each_entry_reverse(client, &host1x->clients, list) {
+	list_for_each_entry_reverse(client, &tegra->clients, list) {
 		if (client->ops && client->ops->drm_exit) {
 			int err = client->ops->drm_exit(client);
 			if (err < 0) {
-				dev_err(host1x->dev,
+				dev_err(tegra->dev,
 					"DRM cleanup failed for %s: %d\n",
 					dev_name(client->dev), err);
-				mutex_unlock(&host1x->clients_lock);
+				mutex_unlock(&tegra->clients_lock);
 				return err;
 			}
 		}
 	}
 
-	mutex_unlock(&host1x->clients_lock);
+	mutex_unlock(&tegra->clients_lock);
 
 	drm_platform_exit(&tegra_drm_driver, pdev);
-	host1x->drm = NULL;
+	tegra->drm = NULL;
 
 	return 0;
 }
 
-int host1x_register_client(struct host1x_drm *host1x,
+int host1x_register_client(struct tegra_drm *tegra,
 			   struct host1x_client *client)
 {
-	struct host1x_drm_client *drm, *tmp;
+	struct host1x_subdev *subdev, *tmp;
 	int err;
 
-	mutex_lock(&host1x->clients_lock);
-	list_add_tail(&client->list, &host1x->clients);
-	mutex_unlock(&host1x->clients_lock);
+	mutex_lock(&tegra->clients_lock);
+	list_add_tail(&client->list, &tegra->clients);
+	mutex_unlock(&tegra->clients_lock);
 
-	list_for_each_entry_safe(drm, tmp, &host1x->drm_clients, list)
-		if (drm->np == client->dev->of_node)
-			host1x_activate_drm_client(host1x, drm, client);
+	list_for_each_entry_safe(subdev, tmp, &tegra->subdevs, list)
+		if (subdev->np == client->dev->of_node)
+			host1x_subdev_register(tegra, subdev, client);
 
-	if (list_empty(&host1x->drm_clients)) {
-		struct platform_device *pdev = to_platform_device(host1x->dev);
+	if (list_empty(&tegra->subdevs)) {
+		struct platform_device *pdev = to_platform_device(tegra->dev);
 
 		err = drm_platform_init(&tegra_drm_driver, pdev);
 		if (err < 0) {
-			dev_err(host1x->dev, "drm_platform_init(): %d\n", err);
+			dev_err(tegra->dev, "drm_platform_init(): %d\n", err);
 			return err;
 		}
 	}
@@ -217,45 +216,45 @@ int host1x_register_client(struct host1x_drm *host1x,
 	return 0;
 }
 
-int host1x_unregister_client(struct host1x_drm *host1x,
+int host1x_unregister_client(struct tegra_drm *tegra,
 			     struct host1x_client *client)
 {
-	struct host1x_drm_client *drm, *tmp;
+	struct host1x_subdev *subdev, *tmp;
 	int err;
 
-	list_for_each_entry_safe(drm, tmp, &host1x->drm_active, list) {
-		if (drm->client == client) {
-			err = host1x_drm_exit(host1x);
+	list_for_each_entry_safe(subdev, tmp, &tegra->active, list) {
+		if (subdev->client == client) {
+			err = tegra_drm_exit(tegra);
 			if (err < 0) {
-				dev_err(host1x->dev, "host1x_drm_exit(): %d\n",
+				dev_err(tegra->dev, "tegra_drm_exit(): %d\n",
 					err);
 				return err;
 			}
 
-			host1x_remove_drm_client(host1x, drm);
+			host1x_subdev_unregister(tegra, subdev);
 			break;
 		}
 	}
 
-	mutex_lock(&host1x->clients_lock);
+	mutex_lock(&tegra->clients_lock);
 	list_del_init(&client->list);
-	mutex_unlock(&host1x->clients_lock);
+	mutex_unlock(&tegra->clients_lock);
 
 	return 0;
 }
 
 static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 {
-	struct host1x_drm *host1x;
+	struct tegra_drm *tegra;
 	int err;
 
-	host1x = host1x_get_drm_data(drm->dev);
-	drm->dev_private = host1x;
-	host1x->drm = drm;
+	tegra = host1x_get_drm_data(drm->dev);
+	drm->dev_private = tegra;
+	tegra->drm = drm;
 
 	drm_mode_config_init(drm);
 
-	err = host1x_drm_init(host1x, drm);
+	err = tegra_drm_init(tegra, drm);
 	if (err < 0)
 		return err;
 
@@ -311,9 +310,9 @@ static void host1x_drm_context_free(struct host1x_drm_context *context)
 
 static void tegra_drm_lastclose(struct drm_device *drm)
 {
-	struct host1x_drm *host1x = drm->dev_private;
+	struct tegra_drm *tegra = drm->dev_private;
 
-	tegra_fbdev_restore_mode(host1x->fbdev);
+	tegra_fbdev_restore_mode(tegra->fbdev);
 }
 
 #ifdef CONFIG_DRM_TEGRA_STAGING
@@ -407,18 +406,18 @@ static int tegra_syncpt_wait(struct drm_device *drm, void *data,
 static int tegra_open_channel(struct drm_device *drm, void *data,
 			      struct drm_file *file)
 {
+	struct host1x_drm_file *fpriv = file->driver_priv;
+	struct tegra_drm *tegra = drm->dev_private;
 	struct drm_tegra_open_channel *args = data;
-	struct host1x_client *client;
 	struct host1x_drm_context *context;
-	struct host1x_drm_file *fpriv = file->driver_priv;
-	struct host1x_drm *host1x = drm->dev_private;
+	struct host1x_client *client;
 	int err = -ENODEV;
 
 	context = kzalloc(sizeof(*context), GFP_KERNEL);
 	if (!context)
 		return -ENOMEM;
 
-	list_for_each_entry(client, &host1x->clients, list)
+	list_for_each_entry(client, &tegra->clients, list)
 		if (client->class == args->client) {
 			err = client->ops->open_channel(client, context);
 			if (err)
diff --git a/drivers/gpu/host1x/drm/drm.h b/drivers/gpu/host1x/drm/drm.h
index b8d9f43..858bfc0 100644
--- a/drivers/gpu/host1x/drm/drm.h
+++ b/drivers/gpu/host1x/drm/drm.h
@@ -30,13 +30,13 @@ struct tegra_fbdev {
 	struct tegra_fb *fb;
 };
 
-struct host1x_drm {
+struct tegra_drm {
 	struct drm_device *drm;
 	struct device *dev;
 
-	struct mutex drm_clients_lock;
-	struct list_head drm_clients;
-	struct list_head drm_active;
+	struct mutex subdevs_lock;
+	struct list_head subdevs;
+	struct list_head active;
 
 	struct mutex clients_lock;
 	struct list_head clients;
@@ -68,7 +68,7 @@ struct host1x_drm_file {
 };
 
 struct host1x_client {
-	struct host1x_drm *host1x;
+	struct tegra_drm *tegra;
 	struct device *dev;
 
 	const struct host1x_client_ops *ops;
@@ -82,12 +82,12 @@ struct host1x_client {
 	struct list_head list;
 };
 
-extern int host1x_drm_init(struct host1x_drm *host1x, struct drm_device *drm);
-extern int host1x_drm_exit(struct host1x_drm *host1x);
+extern int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
+extern int tegra_drm_exit(struct tegra_drm *tegra);
 
-extern int host1x_register_client(struct host1x_drm *host1x,
+extern int host1x_register_client(struct tegra_drm *tegra,
 				  struct host1x_client *client);
-extern int host1x_unregister_client(struct host1x_drm *host1x,
+extern int host1x_unregister_client(struct tegra_drm *tegra,
 				    struct host1x_client *client);
 
 struct tegra_output;
diff --git a/drivers/gpu/host1x/drm/fb.c b/drivers/gpu/host1x/drm/fb.c
index 979a3e3..7dcd796 100644
--- a/drivers/gpu/host1x/drm/fb.c
+++ b/drivers/gpu/host1x/drm/fb.c
@@ -323,10 +323,10 @@ static void tegra_fbdev_free(struct tegra_fbdev *fbdev)
 
 static void tegra_fb_output_poll_changed(struct drm_device *drm)
 {
-	struct host1x_drm *host1x = drm->dev_private;
+	struct tegra_drm *tegra = drm->dev_private;
 
-	if (host1x->fbdev)
-		drm_fb_helper_hotplug_event(&host1x->fbdev->base);
+	if (tegra->fbdev)
+		drm_fb_helper_hotplug_event(&tegra->fbdev->base);
 }
 
 static const struct drm_mode_config_funcs tegra_drm_mode_funcs = {
@@ -336,7 +336,7 @@ static const struct drm_mode_config_funcs tegra_drm_mode_funcs = {
 
 int tegra_drm_fb_init(struct drm_device *drm)
 {
-	struct host1x_drm *host1x = drm->dev_private;
+	struct tegra_drm *tegra = drm->dev_private;
 	struct tegra_fbdev *fbdev;
 
 	drm->mode_config.min_width = 0;
@@ -352,16 +352,16 @@ int tegra_drm_fb_init(struct drm_device *drm)
 	if (IS_ERR(fbdev))
 		return PTR_ERR(fbdev);
 
-	host1x->fbdev = fbdev;
+	tegra->fbdev = fbdev;
 
 	return 0;
 }
 
 void tegra_drm_fb_exit(struct drm_device *drm)
 {
-	struct host1x_drm *host1x = drm->dev_private;
+	struct tegra_drm *tegra = drm->dev_private;
 
-	tegra_fbdev_free(host1x->fbdev);
+	tegra_fbdev_free(tegra->fbdev);
 }
 
 void tegra_fbdev_restore_mode(struct tegra_fbdev *fbdev)
diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index 27ffcf1..5f838b1 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -256,7 +256,7 @@ static const struct of_device_id gr2d_match[] = {
 static int gr2d_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct host1x_drm *host1x = host1x_get_drm_data(dev->parent);
+	struct tegra_drm *tegra = host1x_get_drm_data(dev->parent);
 	int err;
 	struct gr2d *gr2d = NULL;
 	struct host1x_syncpt **syncpts;
@@ -297,7 +297,7 @@ static int gr2d_probe(struct platform_device *pdev)
 	gr2d->client.syncpts = syncpts;
 	gr2d->client.num_syncpts = 1;
 
-	err = host1x_register_client(host1x, &gr2d->client);
+	err = host1x_register_client(tegra, &gr2d->client);
 	if (err < 0) {
 		dev_err(dev, "failed to register host1x client: %d\n", err);
 		return err;
@@ -312,12 +312,12 @@ static int gr2d_probe(struct platform_device *pdev)
 
 static int __exit gr2d_remove(struct platform_device *pdev)
 {
-	struct host1x_drm *host1x = host1x_get_drm_data(pdev->dev.parent);
+	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
 	struct gr2d *gr2d = platform_get_drvdata(pdev);
 	unsigned int i;
 	int err;
 
-	err = host1x_unregister_client(host1x, &gr2d->client);
+	err = host1x_unregister_client(tegra, &gr2d->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister client: %d\n", err);
 		return err;
diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
index 644d95c..e7fb9d9 100644
--- a/drivers/gpu/host1x/drm/hdmi.c
+++ b/drivers/gpu/host1x/drm/hdmi.c
@@ -1181,7 +1181,7 @@ static const struct host1x_client_ops hdmi_client_ops = {
 
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
-	struct host1x_drm *host1x = host1x_get_drm_data(pdev->dev.parent);
+	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
 	struct tegra_hdmi *hdmi;
 	struct resource *regs;
 	int err;
@@ -1256,7 +1256,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&hdmi->client.list);
 	hdmi->client.dev = &pdev->dev;
 
-	err = host1x_register_client(host1x, &hdmi->client);
+	err = host1x_register_client(tegra, &hdmi->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
@@ -1270,11 +1270,11 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 static int tegra_hdmi_remove(struct platform_device *pdev)
 {
-	struct host1x_drm *host1x = host1x_get_drm_data(pdev->dev.parent);
+	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
 	struct tegra_hdmi *hdmi = platform_get_drvdata(pdev);
 	int err;
 
-	err = host1x_unregister_client(host1x, &hdmi->client);
+	err = host1x_unregister_client(tegra, &hdmi->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
 			err);
diff --git a/drivers/gpu/host1x/host1x_client.h b/drivers/gpu/host1x/host1x_client.h
index 9b85f10..6a0bd02 100644
--- a/drivers/gpu/host1x/host1x_client.h
+++ b/drivers/gpu/host1x/host1x_client.h
@@ -21,9 +21,9 @@ struct device;
 struct platform_device;
 
 #ifdef CONFIG_DRM_TEGRA
-int host1x_drm_alloc(struct platform_device *pdev);
+int tegra_drm_alloc(struct platform_device *pdev);
 #else
-static inline int host1x_drm_alloc(struct platform_device *pdev)
+static inline int tegra_drm_alloc(struct platform_device *pdev)
 {
 	return 0;
 }
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
