From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 13/27] drm/tegra: Move subdevice infrastructure to host1x
Date: Mon,  7 Oct 2013 10:34:30 +0200
Message-ID: <1381134884-5816-14-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Tegra DRM driver currently uses some infrastructure to defer the DRM
core initialization until all required devices have registered. The same
infrastructure can potentially be used by any other driver that requires
more than a single sub-device of the host1x module.

Make the infrastructure more generic and keep only the DRM specific code
in the DRM part of the driver. Eventually this will make it easy to move
the DRM driver part back to the DRM subsystem.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/Makefile                   |   2 +
 drivers/gpu/host1x/bus.c                      | 309 +++++++++++++++++++++++
 drivers/gpu/host1x/{host1x_client.h => bus.h} |  24 +-
 drivers/gpu/host1x/dev.c                      |  60 ++---
 drivers/gpu/host1x/dev.h                      |   9 +-
 drivers/gpu/host1x/drm/bus.c                  | 123 +++++++++
 drivers/gpu/host1x/drm/dc.c                   |  35 +--
 drivers/gpu/host1x/drm/drm.c                  | 347 +++++++++-----------------
 drivers/gpu/host1x/drm/drm.h                  |  31 +--
 drivers/gpu/host1x/drm/gr2d.c                 |  32 ++-
 drivers/gpu/host1x/drm/hdmi.c                 |  33 +--
 include/drm/drmP.h                            |   1 +
 include/linux/host1x.h                        |  45 +++-
 13 files changed, 700 insertions(+), 351 deletions(-)
 create mode 100644 drivers/gpu/host1x/bus.c
 rename drivers/gpu/host1x/{host1x_client.h => bus.h} (60%)
 create mode 100644 drivers/gpu/host1x/drm/bus.c

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index 64628ba..616fe82 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -1,4 +1,5 @@
 host1x-y = \
+	bus.o \
 	syncpt.o \
 	dev.o \
 	intr.o \
@@ -15,4 +16,5 @@ host1x-$(CONFIG_DRM_TEGRA) += drm/drm.o drm/fb.o drm/dc.o
 host1x-$(CONFIG_DRM_TEGRA) += drm/output.o drm/rgb.o drm/hdmi.o
 host1x-$(CONFIG_DRM_TEGRA) += drm/gem.o
 host1x-$(CONFIG_DRM_TEGRA) += drm/gr2d.o
+host1x-$(CONFIG_DRM_TEGRA) += drm/bus.o
 obj-$(CONFIG_TEGRA_HOST1X) += host1x.o
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
new file mode 100644
index 0000000..8e96d23
--- /dev/null
+++ b/drivers/gpu/host1x/bus.c
@@ -0,0 +1,309 @@
+/*
+ * Copyright (C) 2012 Avionic Design GmbH
+ * Copyright (C) 2012-2013, NVIDIA Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/host1x.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
+#include "dev.h"
+
+struct host1x_subdev {
+	struct host1x_client *client;
+	struct device_node *np;
+	struct list_head list;
+};
+
+static int host1x_subdev_add(struct host1x_device *device,
+			     struct device_node *np)
+{
+	struct host1x_subdev *subdev;
+
+	subdev = kzalloc(sizeof(*subdev), GFP_KERNEL);
+	if (!subdev)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&subdev->list);
+	subdev->np = of_node_get(np);
+
+	list_add_tail(&subdev->list, &device->subdevs);
+
+	return 0;
+}
+
+static int host1x_device_parse_dt(struct host1x_device *device)
+{
+	struct device_node *np;
+	int err;
+
+	for_each_child_of_node(device->dev.parent->of_node, np) {
+		if (of_match_node(device->driver->subdevs, np) &&
+		    of_device_is_available(np)) {
+			err = host1x_subdev_add(device, np);
+			if (err < 0)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
+static void host1x_subdev_register(struct host1x_device *device,
+				   struct host1x_subdev *subdev,
+				   struct host1x_client *client)
+{
+	int err;
+
+	mutex_lock(&device->subdevs_lock);
+	mutex_lock(&device->clients_lock);
+	list_del_init(&subdev->list);
+	list_add_tail(&client->list, &device->clients);
+	client->parent = &device->dev;
+	subdev->client = client;
+	mutex_unlock(&device->clients_lock);
+	mutex_unlock(&device->subdevs_lock);
+
+	if (list_empty(&device->subdevs)) {
+		err = device->driver->probe(device);
+		if (err < 0)
+			dev_err(&device->dev, "probe failed: %d\n", err);
+	}
+}
+
+static void host1x_subdev_unregister(struct host1x_device *device,
+				     struct host1x_subdev *subdev)
+{
+	mutex_lock(&device->subdevs_lock);
+	list_del_init(&subdev->list);
+	mutex_unlock(&device->subdevs_lock);
+
+	of_node_put(subdev->np);
+	kfree(subdev);
+}
+
+int host1x_device_init(struct host1x_device *device)
+{
+	struct host1x_client *client;
+	int err;
+
+	mutex_lock(&device->clients_lock);
+
+	list_for_each_entry(client, &device->clients, list) {
+		if (client->ops && client->ops->init) {
+			err = client->ops->init(client);
+			if (err < 0) {
+				dev_err(&device->dev,
+					"failed to initialize %s: %d\n",
+					dev_name(client->dev), err);
+				mutex_unlock(&device->clients_lock);
+				return err;
+			}
+		}
+	}
+
+	mutex_unlock(&device->clients_lock);
+
+	return 0;
+}
+
+int host1x_device_exit(struct host1x_device *device)
+{
+	struct host1x_client *client;
+	int err;
+
+	mutex_lock(&device->clients_lock);
+
+	list_for_each_entry_reverse(client, &device->clients, list) {
+		if (client->ops && client->ops->exit) {
+			err = client->ops->exit(client);
+			if (err < 0) {
+				dev_err(&device->dev,
+					"failed to cleanup %s: %d\n",
+					dev_name(client->dev), err);
+				mutex_unlock(&device->clients_lock);
+				return err;
+			}
+		}
+	}
+
+	mutex_unlock(&device->clients_lock);
+
+	return 0;
+}
+
+int host1x_register_client(struct host1x *host1x, struct host1x_client *client)
+{
+	struct host1x_device *device;
+	struct host1x_subdev *subdev;
+
+	list_for_each_entry(device, &host1x->devices, list) {
+		list_for_each_entry(subdev, &device->subdevs, list) {
+			if (subdev->np == client->dev->of_node) {
+				host1x_subdev_register(device, subdev, client);
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+
+int host1x_unregister_client(struct host1x *host1x,
+			     struct host1x_client *client)
+{
+	struct host1x_device *device;
+	struct host1x_subdev *subdev;
+
+	list_for_each_entry(device, &host1x->devices, list)
+		list_for_each_entry(subdev, &device->subdevs, list)
+			if (subdev->client == client)
+				host1x_subdev_unregister(device, subdev);
+
+	return 0;
+}
+
+static struct bus_type host1x_bus_type = {
+	.name = "host1x",
+};
+
+int host1x_bus_init(void)
+{
+	return bus_register(&host1x_bus_type);
+}
+
+void host1x_bus_exit(void)
+{
+	bus_unregister(&host1x_bus_type);
+}
+
+static void host1x_device_release(struct device *dev)
+{
+	struct host1x_device *device = to_host1x_device(dev);
+
+	kfree(device);
+}
+
+static int host1x_device_add(struct host1x *host1x,
+			     struct host1x_driver *driver)
+{
+	struct host1x_device *device;
+	int err;
+
+	device = kzalloc(sizeof(*device), GFP_KERNEL);
+	if (!device)
+		return -ENOMEM;
+
+	mutex_init(&device->subdevs_lock);
+	INIT_LIST_HEAD(&device->subdevs);
+	mutex_init(&device->clients_lock);
+	INIT_LIST_HEAD(&device->clients);
+	INIT_LIST_HEAD(&device->list);
+	device->driver = driver;
+
+	device->dev.coherent_dma_mask = host1x->dev->coherent_dma_mask;
+	device->dev.dma_mask = &device->dev.coherent_dma_mask;
+	device->dev.release = host1x_device_release;
+	dev_set_name(&device->dev, driver->name);
+	device->dev.bus = &host1x_bus_type;
+	device->dev.parent = host1x->dev;
+
+	err = device_register(&device->dev);
+	if (err < 0)
+		return err;
+
+	err = host1x_device_parse_dt(device);
+	if (err < 0) {
+		put_device(&device->dev);
+		return err;
+	}
+
+	list_add_tail(&device->list, &host1x->devices);
+
+	return 0;
+}
+
+static void host1x_attach_driver(struct host1x *host1x,
+				 struct host1x_driver *driver)
+{
+	struct host1x_device *device;
+	int err;
+
+	list_for_each_entry(device, &host1x->devices, list)
+		if (device->driver == driver)
+			return;
+
+	err = host1x_device_add(host1x, driver);
+	if (err < 0)
+		dev_err(host1x->dev, "failed to allocate device: %d\n", err);
+}
+
+static DEFINE_MUTEX(drivers_lock);
+static LIST_HEAD(drivers);
+
+static DEFINE_MUTEX(devices_lock);
+static LIST_HEAD(devices);
+
+int host1x_register(struct host1x *host1x)
+{
+	struct host1x_driver *driver;
+
+	mutex_lock(&devices_lock);
+	list_add_tail(&host1x->list, &devices);
+	mutex_unlock(&devices_lock);
+
+	list_for_each_entry(driver, &drivers, list)
+		host1x_attach_driver(host1x, driver);
+
+	return 0;
+}
+
+int host1x_unregister(struct host1x *host1x)
+{
+	mutex_lock(&devices_lock);
+	list_del_init(&host1x->list);
+	mutex_unlock(&devices_lock);
+
+	return 0;
+}
+
+int host1x_driver_register(struct host1x_driver *driver)
+{
+	struct host1x *host1x;
+
+	INIT_LIST_HEAD(&driver->list);
+
+	mutex_lock(&drivers_lock);
+	list_add_tail(&driver->list, &drivers);
+	mutex_unlock(&drivers_lock);
+
+	mutex_lock(&devices_lock);
+
+	list_for_each_entry(host1x, &devices, list)
+		host1x_attach_driver(host1x, driver);
+
+	mutex_unlock(&devices_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(host1x_driver_register);
+
+void host1x_driver_unregister(struct host1x_driver *driver)
+{
+	mutex_lock(&drivers_lock);
+	list_del_init(&driver->list);
+	mutex_unlock(&drivers_lock);
+}
+EXPORT_SYMBOL(host1x_driver_unregister);
diff --git a/drivers/gpu/host1x/host1x_client.h b/drivers/gpu/host1x/bus.h
similarity index 60%
rename from drivers/gpu/host1x/host1x_client.h
rename to drivers/gpu/host1x/bus.h
index 6a0bd02..4099e99 100644
--- a/drivers/gpu/host1x/host1x_client.h
+++ b/drivers/gpu/host1x/bus.h
@@ -1,5 +1,6 @@
 /*
- * Copyright (c) 2013, NVIDIA Corporation.
+ * Copyright (C) 2012 Avionic Design GmbH
+ * Copyright (C) 2012-2013, NVIDIA Corporation
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -14,22 +15,15 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HOST1X_CLIENT_H
-#define HOST1X_CLIENT_H
+#ifndef HOST1X_BUS_H
+#define HOST1X_BUS_H
 
-struct device;
-struct platform_device;
+struct host1x;
 
-#ifdef CONFIG_DRM_TEGRA
-int tegra_drm_alloc(struct platform_device *pdev);
-#else
-static inline int tegra_drm_alloc(struct platform_device *pdev)
-{
-	return 0;
-}
-#endif
+int host1x_bus_init(void);
+void host1x_bus_exit(void);
 
-void host1x_set_drm_data(struct device *dev, void *data);
-void *host1x_get_drm_data(struct device *dev);
+int host1x_register(struct host1x *host1x);
+int host1x_unregister(struct host1x *host1x);
 
 #endif
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 105aa4e..de0fd55 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -27,24 +27,12 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/host1x.h>
 
+#include "bus.h"
 #include "dev.h"
 #include "intr.h"
 #include "channel.h"
 #include "debug.h"
 #include "hw/host1x01.h"
-#include "host1x_client.h"
-
-void host1x_set_drm_data(struct device *dev, void *data)
-{
-	struct host1x *host1x = dev_get_drvdata(dev);
-	host1x->drm_data = data;
-}
-
-void *host1x_get_drm_data(struct device *dev)
-{
-	struct host1x *host1x = dev_get_drvdata(dev);
-	return host1x ? host1x->drm_data : NULL;
-}
 
 void host1x_sync_writel(struct host1x *host1x, u32 v, u32 r)
 {
@@ -114,6 +102,9 @@ static int host1x_probe(struct platform_device *pdev)
 	if (!host)
 		return -ENOMEM;
 
+	mutex_init(&host->devices_lock);
+	INIT_LIST_HEAD(&host->devices);
+	INIT_LIST_HEAD(&host->list);
 	host->dev = &pdev->dev;
 	host->info = id->data;
 
@@ -163,10 +154,14 @@ static int host1x_probe(struct platform_device *pdev)
 
 	host1x_debug_init(host);
 
-	tegra_drm_alloc(pdev);
+	err = host1x_register(host);
+	if (err < 0)
+		goto fail_deinit_intr;
 
 	return 0;
 
+fail_deinit_intr:
+	host1x_intr_deinit(host);
 fail_deinit_syncpt:
 	host1x_syncpt_deinit(host);
 	return err;
@@ -176,6 +171,7 @@ static int host1x_remove(struct platform_device *pdev)
 {
 	struct host1x *host = platform_get_drvdata(pdev);
 
+	host1x_unregister(host);
 	host1x_intr_deinit(host);
 	host1x_syncpt_deinit(host);
 	clk_disable_unprepare(host->clk);
@@ -196,46 +192,24 @@ static int __init tegra_host1x_init(void)
 {
 	int err;
 
-	err = platform_driver_register(&tegra_host1x_driver);
+	err = host1x_bus_init();
 	if (err < 0)
 		return err;
 
-#ifdef CONFIG_DRM_TEGRA
-	err = platform_driver_register(&tegra_dc_driver);
-	if (err < 0)
-		goto unregister_host1x;
-
-	err = platform_driver_register(&tegra_hdmi_driver);
-	if (err < 0)
-		goto unregister_dc;
-
-	err = platform_driver_register(&tegra_gr2d_driver);
-	if (err < 0)
-		goto unregister_hdmi;
-#endif
+	err = platform_driver_register(&tegra_host1x_driver);
+	if (err < 0) {
+		host1x_bus_exit();
+		return err;
+	}
 
 	return 0;
-
-#ifdef CONFIG_DRM_TEGRA
-unregister_hdmi:
-	platform_driver_unregister(&tegra_hdmi_driver);
-unregister_dc:
-	platform_driver_unregister(&tegra_dc_driver);
-unregister_host1x:
-	platform_driver_unregister(&tegra_host1x_driver);
-	return err;
-#endif
 }
 module_init(tegra_host1x_init);
 
 static void __exit tegra_host1x_exit(void)
 {
-#ifdef CONFIG_DRM_TEGRA
-	platform_driver_unregister(&tegra_gr2d_driver);
-	platform_driver_unregister(&tegra_hdmi_driver);
-	platform_driver_unregister(&tegra_dc_driver);
-#endif
 	platform_driver_unregister(&tegra_host1x_driver);
+	host1x_bus_exit();
 }
 module_exit(tegra_host1x_exit);
 
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index bed90a8..6cf689b 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -125,7 +125,10 @@ struct host1x {
 
 	struct dentry *debugfs;
 
-	void *drm_data;
+	struct mutex devices_lock;
+	struct list_head devices;
+
+	struct list_head list;
 };
 
 void host1x_sync_writel(struct host1x *host1x, u32 r, u32 v);
@@ -301,8 +304,4 @@ static inline void host1x_hw_show_mlocks(struct host1x *host, struct output *o)
 	host->debug_op->show_mlocks(host, o);
 }
 
-extern struct platform_driver tegra_dc_driver;
-extern struct platform_driver tegra_hdmi_driver;
-extern struct platform_driver tegra_gr2d_driver;
-
 #endif
diff --git a/drivers/gpu/host1x/drm/bus.c b/drivers/gpu/host1x/drm/bus.c
new file mode 100644
index 0000000..01c984d
--- /dev/null
+++ b/drivers/gpu/host1x/drm/bus.c
@@ -0,0 +1,123 @@
+/*
+ * Copyright (C) 2013 NVIDIA Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include "drm.h"
+
+static int drm_host1x_set_busid(struct drm_device *dev,
+				struct drm_master *master)
+{
+	const char *device = dev_name(dev->dev);
+	const char *driver = dev->driver->name;
+	const char *bus = dev->dev->bus->name;
+	int length;
+
+	master->unique_len = strlen(bus) + 1 + strlen(device);
+	master->unique_size = master->unique_len;
+
+	master->unique = kmalloc(master->unique_len + 1, GFP_KERNEL);
+	if (!master->unique)
+		return -ENOMEM;
+
+	snprintf(master->unique, master->unique_len + 1, "%s:%s", bus, device);
+
+	length = strlen(driver) + 1 + master->unique_len;
+
+	dev->devname = kmalloc(length + 1, GFP_KERNEL);
+	if (!dev->devname)
+		return -ENOMEM;
+
+	snprintf(dev->devname, length + 1, "%s@%s", driver, master->unique);
+
+	return 0;
+}
+
+static struct drm_bus drm_host1x_bus = {
+	.bus_type = DRIVER_BUS_HOST1X,
+	.set_busid = drm_host1x_set_busid,
+};
+
+int drm_host1x_init(struct drm_driver *driver, struct host1x_device *device)
+{
+	struct drm_device *drm;
+	int ret;
+
+	INIT_LIST_HEAD(&driver->device_list);
+	driver->bus = &drm_host1x_bus;
+
+	drm = kzalloc(sizeof(*drm), GFP_KERNEL);
+	if (!drm)
+		return -ENOMEM;
+
+	drm->dev = &device->dev;
+
+	mutex_lock(&drm_global_mutex);
+
+	ret = drm_fill_in_dev(drm, NULL, driver);
+	if (ret)
+		goto unlock;
+
+	if (drm_core_check_feature(drm, DRIVER_MODESET)) {
+		ret = drm_get_minor(drm, &drm->control, DRM_MINOR_CONTROL);
+		if (ret)
+			goto unlock;
+	}
+
+	if (drm_core_check_feature(drm, DRIVER_RENDER)) {
+		ret = drm_get_minor(drm, &drm->render, DRM_MINOR_RENDER);
+		if (ret)
+			goto put_control;
+	}
+
+	ret = drm_get_minor(drm, &drm->primary, DRM_MINOR_LEGACY);
+	if (ret)
+		goto put_render;
+
+	if (drm->driver->load) {
+		ret = drm->driver->load(drm, 0);
+		if (ret)
+			goto put_primary;
+	}
+
+	/* setup the grouping for the legacy output */
+	if (drm_core_check_feature(drm, DRIVER_MODESET)) {
+		struct drm_mode_group *group = &drm->primary->mode_group;
+
+		ret = drm_mode_group_init_legacy_group(drm, group);
+		if (ret)
+			goto put_primary;
+	}
+
+	list_add_tail(&drm->driver_item, &driver->device_list);
+	mutex_unlock(&drm_global_mutex);
+
+	DRM_INFO("Initialized %s %d.%d.%d %s on minor %d\n", driver->name,
+		 driver->major, driver->minor, driver->patchlevel,
+		 driver->date, drm->primary->index);
+
+	return 0;
+
+put_primary:
+	drm_put_minor(&drm->primary);
+put_render:
+	if (drm_core_check_feature(drm, DRIVER_RENDER))
+		drm_put_minor(&drm->render);
+put_control:
+	if (drm_core_check_feature(drm, DRIVER_MODESET))
+		drm_put_minor(&drm->control);
+unlock:
+	mutex_unlock(&drm_global_mutex);
+	kfree(drm);
+	return ret;
+}
+
+void drm_host1x_exit(struct drm_driver *driver, struct host1x_device *device)
+{
+	struct tegra_drm *tegra = dev_get_drvdata(&device->dev);
+
+	drm_put_dev(tegra->drm);
+}
diff --git a/drivers/gpu/host1x/drm/dc.c b/drivers/gpu/host1x/drm/dc.c
index 5106df0..71cbda6 100644
--- a/drivers/gpu/host1x/drm/dc.c
+++ b/drivers/gpu/host1x/drm/dc.c
@@ -11,7 +11,6 @@
 #include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
 
-#include "host1x_client.h"
 #include "dc.h"
 #include "drm.h"
 #include "gem.h"
@@ -1040,28 +1039,28 @@ static int tegra_dc_debugfs_exit(struct tegra_dc *dc)
 
 static int tegra_dc_init(struct host1x_client *client)
 {
-	struct tegra_drm_client *drm = to_tegra_drm_client(client);
-	struct tegra_dc *dc = tegra_drm_client_to_dc(drm);
+	struct tegra_drm *tegra = dev_get_drvdata(client->parent);
+	struct tegra_dc *dc = host1x_client_to_dc(client);
 	int err;
 
-	dc->pipe = drm->drm->mode_config.num_crtc;
+	dc->pipe = tegra->drm->mode_config.num_crtc;
 
-	drm_crtc_init(drm->drm, &dc->base, &tegra_crtc_funcs);
+	drm_crtc_init(tegra->drm, &dc->base, &tegra_crtc_funcs);
 	drm_mode_crtc_set_gamma_size(&dc->base, 256);
 	drm_crtc_helper_add(&dc->base, &tegra_crtc_helper_funcs);
 
-	err = tegra_dc_rgb_init(drm->drm, dc);
+	err = tegra_dc_rgb_init(tegra->drm, dc);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(dc->dev, "failed to initialize RGB output: %d\n", err);
 		return err;
 	}
 
-	err = tegra_dc_add_planes(drm->drm, dc);
+	err = tegra_dc_add_planes(tegra->drm, dc);
 	if (err < 0)
 		return err;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
-		err = tegra_dc_debugfs_init(dc, drm->drm->primary);
+		err = tegra_dc_debugfs_init(dc, tegra->drm->primary);
 		if (err < 0)
 			dev_err(dc->dev, "debugfs setup failed: %d\n", err);
 	}
@@ -1079,8 +1078,7 @@ static int tegra_dc_init(struct host1x_client *client)
 
 static int tegra_dc_exit(struct host1x_client *client)
 {
-	struct tegra_drm_client *drm = to_tegra_drm_client(client);
-	struct tegra_dc *dc = tegra_drm_client_to_dc(drm);
+	struct tegra_dc *dc = host1x_client_to_dc(client);
 	int err;
 
 	devm_free_irq(dc->dev, dc->irq, dc);
@@ -1107,11 +1105,14 @@ static const struct host1x_client_ops dc_client_ops = {
 
 static int tegra_dc_probe(struct platform_device *pdev)
 {
-	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
+	struct host1x *host1x = dev_get_drvdata(pdev->dev.parent);
 	struct resource *regs;
 	struct tegra_dc *dc;
 	int err;
 
+	if (!host1x)
+		return -EPROBE_DEFER;
+
 	dc = devm_kzalloc(&pdev->dev, sizeof(*dc), GFP_KERNEL);
 	if (!dc)
 		return -ENOMEM;
@@ -1141,9 +1142,9 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	INIT_LIST_HEAD(&dc->client.base.list);
-	dc->client.base.ops = &dc_client_ops;
-	dc->client.base.dev = &pdev->dev;
+	INIT_LIST_HEAD(&dc->client.list);
+	dc->client.ops = &dc_client_ops;
+	dc->client.dev = &pdev->dev;
 
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV) {
@@ -1151,7 +1152,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = host1x_register_client(tegra, &dc->client.base);
+	err = host1x_register_client(host1x, &dc->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
@@ -1165,11 +1166,11 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 static int tegra_dc_remove(struct platform_device *pdev)
 {
-	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
+	struct host1x *host1x = dev_get_drvdata(pdev->dev.parent);
 	struct tegra_dc *dc = platform_get_drvdata(pdev);
 	int err;
 
-	err = host1x_unregister_client(tegra, &dc->client.base);
+	err = host1x_unregister_client(host1x, &dc->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
 			err);
diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.c
index e93caea..f9def3c 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -7,7 +7,8 @@
  * published by the Free Software Foundation.
  */
 
-#include "host1x_client.h"
+#include <linux/host1x.h>
+
 #include "drm.h"
 #include "gem.h"
 
@@ -22,239 +23,25 @@ struct tegra_drm_file {
 	struct list_head contexts;
 };
 
-struct host1x_subdev {
-	struct host1x_client *client;
-	struct device_node *np;
-	struct list_head list;
-};
-
-static int host1x_subdev_add(struct tegra_drm *tegra, struct device_node *np)
-{
-	struct host1x_subdev *subdev;
-
-	subdev = kzalloc(sizeof(*subdev), GFP_KERNEL);
-	if (!subdev)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&subdev->list);
-	subdev->np = of_node_get(np);
-
-	list_add_tail(&subdev->list, &tegra->subdevs);
-
-	return 0;
-}
-
-static int host1x_subdev_register(struct tegra_drm *tegra,
-				  struct host1x_subdev *subdev,
-				  struct host1x_client *client)
-{
-	mutex_lock(&tegra->subdevs_lock);
-	list_del_init(&subdev->list);
-	list_add_tail(&subdev->list, &tegra->active);
-	subdev->client = client;
-	mutex_unlock(&tegra->subdevs_lock);
-
-	return 0;
-}
-
-static int host1x_subdev_unregister(struct tegra_drm *tegra,
-				    struct host1x_subdev *subdev)
-{
-	mutex_lock(&tegra->subdevs_lock);
-	list_del_init(&subdev->list);
-	mutex_unlock(&tegra->subdevs_lock);
-
-	of_node_put(subdev->np);
-	kfree(subdev);
-
-	return 0;
-}
-
-static int tegra_parse_dt(struct tegra_drm *tegra)
-{
-	static const char * const compat[] = {
-		"nvidia,tegra20-dc",
-		"nvidia,tegra20-hdmi",
-		"nvidia,tegra20-gr2d",
-		"nvidia,tegra30-dc",
-		"nvidia,tegra30-hdmi",
-		"nvidia,tegra30-gr2d",
-	};
-	unsigned int i;
-	int err;
-
-	for (i = 0; i < ARRAY_SIZE(compat); i++) {
-		struct device_node *np;
-
-		for_each_child_of_node(tegra->dev->of_node, np) {
-			if (of_device_is_compatible(np, compat[i]) &&
-			    of_device_is_available(np)) {
-				err = host1x_subdev_add(tegra, np);
-				if (err < 0)
-					return err;
-			}
-		}
-	}
-
-	return 0;
-}
-
-int tegra_drm_alloc(struct platform_device *pdev)
+static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 {
+	struct host1x_device *device = to_host1x_device(drm->dev);
 	struct tegra_drm *tegra;
 	int err;
 
-	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
+	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
 	if (!tegra)
 		return -ENOMEM;
 
-	mutex_init(&tegra->subdevs_lock);
-	INIT_LIST_HEAD(&tegra->subdevs);
-	INIT_LIST_HEAD(&tegra->active);
+	dev_set_drvdata(drm->dev, tegra);
 	mutex_init(&tegra->clients_lock);
 	INIT_LIST_HEAD(&tegra->clients);
-	tegra->dev = &pdev->dev;
-
-	err = tegra_parse_dt(tegra);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to parse DT: %d\n", err);
-		return err;
-	}
-
-	host1x_set_drm_data(&pdev->dev, tegra);
-
-	return 0;
-}
-
-int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm)
-{
-	struct host1x_client *client;
-	int err;
-
-	mutex_lock(&tegra->clients_lock);
-
-	list_for_each_entry(client, &tegra->clients, list) {
-		struct tegra_drm_client *tdc = to_tegra_drm_client(client);
-
-		/* associate client with DRM device */
-		tdc->drm = drm;
-
-		if (client->ops && client->ops->init) {
-			err = client->ops->init(client);
-			if (err < 0) {
-				dev_err(tegra->dev,
-					"DRM setup failed for %s: %d\n",
-					dev_name(client->dev), err);
-				mutex_unlock(&tegra->clients_lock);
-				return err;
-			}
-		}
-	}
-
-	mutex_unlock(&tegra->clients_lock);
-
-	return 0;
-}
-
-int tegra_drm_exit(struct tegra_drm *tegra)
-{
-	struct host1x_client *client;
-	struct platform_device *pdev;
-	int err;
-
-	if (!tegra->drm)
-		return 0;
-
-	mutex_lock(&tegra->clients_lock);
-
-	list_for_each_entry_reverse(client, &tegra->clients, list) {
-		if (client->ops && client->ops->exit) {
-			err = client->ops->exit(client);
-			if (err < 0) {
-				dev_err(tegra->dev,
-					"DRM cleanup failed for %s: %d\n",
-					dev_name(client->dev), err);
-				mutex_unlock(&tegra->clients_lock);
-				return err;
-			}
-		}
-	}
-
-	mutex_unlock(&tegra->clients_lock);
-
-	pdev = to_platform_device(tegra->dev);
-	drm_platform_exit(&tegra_drm_driver, pdev);
-	tegra->drm = NULL;
-
-	return 0;
-}
-
-int host1x_register_client(struct tegra_drm *tegra,
-			   struct host1x_client *client)
-{
-	struct host1x_subdev *subdev, *tmp;
-	int err;
-
-	mutex_lock(&tegra->clients_lock);
-	list_add_tail(&client->list, &tegra->clients);
-	mutex_unlock(&tegra->clients_lock);
-
-	list_for_each_entry_safe(subdev, tmp, &tegra->subdevs, list)
-		if (subdev->np == client->dev->of_node)
-			host1x_subdev_register(tegra, subdev, client);
-
-	if (list_empty(&tegra->subdevs)) {
-		struct platform_device *pdev = to_platform_device(tegra->dev);
-
-		err = drm_platform_init(&tegra_drm_driver, pdev);
-		if (err < 0) {
-			dev_err(tegra->dev, "drm_platform_init(): %d\n", err);
-			return err;
-		}
-	}
-
-	return 0;
-}
-
-int host1x_unregister_client(struct tegra_drm *tegra,
-			     struct host1x_client *client)
-{
-	struct host1x_subdev *subdev, *tmp;
-	int err;
-
-	list_for_each_entry_safe(subdev, tmp, &tegra->active, list) {
-		if (subdev->client == client) {
-			err = tegra_drm_exit(tegra);
-			if (err < 0) {
-				dev_err(tegra->dev, "tegra_drm_exit(): %d\n",
-					err);
-				return err;
-			}
-
-			host1x_subdev_unregister(tegra, subdev);
-			break;
-		}
-	}
-
-	mutex_lock(&tegra->clients_lock);
-	list_del_init(&client->list);
-	mutex_unlock(&tegra->clients_lock);
-
-	return 0;
-}
-
-static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
-{
-	struct tegra_drm *tegra;
-	int err;
-
-	tegra = host1x_get_drm_data(drm->dev);
 	drm->dev_private = tegra;
 	tegra->drm = drm;
 
 	drm_mode_config_init(drm);
 
-	err = tegra_drm_init(tegra, drm);
+	err = host1x_device_init(device);
 	if (err < 0)
 		return err;
 
@@ -280,9 +67,16 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 
 static int tegra_drm_unload(struct drm_device *drm)
 {
+	struct host1x_device *device = to_host1x_device(drm->dev);
+	int err;
+
 	drm_kms_helper_poll_fini(drm);
 	tegra_drm_fb_exit(drm);
 
+	err = host1x_device_exit(device);
+	if (err < 0)
+		return err;
+
 	drm_mode_config_cleanup(drm);
 
 	return 0;
@@ -370,10 +164,11 @@ static int tegra_gem_mmap(struct drm_device *drm, void *data,
 static int tegra_syncpt_read(struct drm_device *drm, void *data,
 			     struct drm_file *file)
 {
+	struct host1x *host = dev_get_drvdata(drm->dev->parent);
 	struct drm_tegra_syncpt_read *args = data;
-	struct host1x *host = dev_get_drvdata(drm->dev);
-	struct host1x_syncpt *sp = host1x_syncpt_get(host, args->id);
+	struct host1x_syncpt *sp;
 
+	sp = host1x_syncpt_get(host, args->id);
 	if (!sp)
 		return -EINVAL;
 
@@ -384,10 +179,11 @@ static int tegra_syncpt_read(struct drm_device *drm, void *data,
 static int tegra_syncpt_incr(struct drm_device *drm, void *data,
 			     struct drm_file *file)
 {
+	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
 	struct drm_tegra_syncpt_incr *args = data;
-	struct host1x *host = dev_get_drvdata(drm->dev);
-	struct host1x_syncpt *sp = host1x_syncpt_get(host, args->id);
+	struct host1x_syncpt *sp;
 
+	sp = host1x_syncpt_get(host1x, args->id);
 	if (!sp)
 		return -EINVAL;
 
@@ -397,10 +193,11 @@ static int tegra_syncpt_incr(struct drm_device *drm, void *data,
 static int tegra_syncpt_wait(struct drm_device *drm, void *data,
 			     struct drm_file *file)
 {
+	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
 	struct drm_tegra_syncpt_wait *args = data;
-	struct host1x *host = dev_get_drvdata(drm->dev);
-	struct host1x_syncpt *sp = host1x_syncpt_get(host, args->id);
+	struct host1x_syncpt *sp;
 
+	sp = host1x_syncpt_get(host1x, args->id);
 	if (!sp)
 		return -EINVAL;
 
@@ -422,7 +219,7 @@ static int tegra_open_channel(struct drm_device *drm, void *data,
 	if (!context)
 		return -ENOMEM;
 
-	list_for_each_entry(client, &tegra->clients, base.list)
+	list_for_each_entry(client, &tegra->clients, list)
 		if (client->base.class == args->client) {
 			err = client->ops->open_channel(client, context);
 			if (err)
@@ -441,8 +238,8 @@ static int tegra_open_channel(struct drm_device *drm, void *data,
 static int tegra_close_channel(struct drm_device *drm, void *data,
 			       struct drm_file *file)
 {
-	struct drm_tegra_close_channel *args = data;
 	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_close_channel *args = data;
 	struct tegra_drm_context *context;
 
 	context = tegra_drm_get_context(args->context);
@@ -652,3 +449,97 @@ struct drm_driver tegra_drm_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 };
+
+int tegra_drm_register_client(struct tegra_drm *tegra,
+			      struct tegra_drm_client *client)
+{
+	mutex_lock(&tegra->clients_lock);
+	list_add_tail(&client->list, &tegra->clients);
+	mutex_unlock(&tegra->clients_lock);
+
+	return 0;
+}
+
+int tegra_drm_unregister_client(struct tegra_drm *tegra,
+				struct tegra_drm_client *client)
+{
+	mutex_lock(&tegra->clients_lock);
+	list_del_init(&client->list);
+	mutex_unlock(&tegra->clients_lock);
+
+	return 0;
+}
+
+static int host1x_drm_probe(struct host1x_device *device)
+{
+	return drm_host1x_init(&tegra_drm_driver, device);
+}
+
+static int host1x_drm_remove(struct host1x_device *device)
+{
+	drm_host1x_exit(&tegra_drm_driver, device);
+
+	return 0;
+}
+
+static const struct of_device_id host1x_drm_subdevs[] = {
+	{ .compatible = "nvidia,tegra20-dc", },
+	{ .compatible = "nvidia,tegra20-hdmi", },
+	{ .compatible = "nvidia,tegra20-gr2d", },
+	{ .compatible = "nvidia,tegra30-dc", },
+	{ .compatible = "nvidia,tegra30-hdmi", },
+	{ .compatible = "nvidia,tegra30-gr2d", },
+	{ /* sentinel */ }
+};
+
+static struct host1x_driver host1x_drm_driver = {
+	.name = "drm",
+	.probe = host1x_drm_probe,
+	.remove = host1x_drm_remove,
+	.subdevs = host1x_drm_subdevs,
+};
+
+static int __init host1x_drm_init(void)
+{
+	int err;
+
+	err = host1x_driver_register(&host1x_drm_driver);
+	if (err < 0)
+		return err;
+
+	err = platform_driver_register(&tegra_dc_driver);
+	if (err < 0)
+		goto unregister_host1x;
+
+	err = platform_driver_register(&tegra_hdmi_driver);
+	if (err < 0)
+		goto unregister_dc;
+
+	err = platform_driver_register(&tegra_gr2d_driver);
+	if (err < 0)
+		goto unregister_hdmi;
+
+	return 0;
+
+unregister_hdmi:
+	platform_driver_unregister(&tegra_hdmi_driver);
+unregister_dc:
+	platform_driver_unregister(&tegra_dc_driver);
+unregister_host1x:
+	host1x_driver_unregister(&host1x_drm_driver);
+	return err;
+}
+module_init(host1x_drm_init);
+
+static void __exit host1x_drm_exit(void)
+{
+	platform_driver_unregister(&tegra_gr2d_driver);
+	platform_driver_unregister(&tegra_hdmi_driver);
+	platform_driver_unregister(&tegra_dc_driver);
+	host1x_driver_unregister(&host1x_drm_driver);
+}
+module_exit(host1x_drm_exit);
+
+MODULE_AUTHOR("Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>");
+MODULE_DESCRIPTION("NVIDIA Tegra DRM driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/host1x/drm/drm.h b/drivers/gpu/host1x/drm/drm.h
index 8c26c6b..25522e2 100644
--- a/drivers/gpu/host1x/drm/drm.h
+++ b/drivers/gpu/host1x/drm/drm.h
@@ -32,11 +32,6 @@ struct tegra_fbdev {
 
 struct tegra_drm {
 	struct drm_device *drm;
-	struct device *dev;
-
-	struct mutex subdevs_lock;
-	struct list_head subdevs;
-	struct list_head active;
 
 	struct mutex clients_lock;
 	struct list_head clients;
@@ -63,29 +58,29 @@ struct tegra_drm_client_ops {
 
 struct tegra_drm_client {
 	struct host1x_client base;
-	struct drm_device *drm;
+	struct list_head list;
 
 	const struct tegra_drm_client_ops *ops;
 };
 
 static inline struct tegra_drm_client *
-to_tegra_drm_client(struct host1x_client *client)
+host1x_to_drm_client(struct host1x_client *client)
 {
 	return container_of(client, struct tegra_drm_client, base);
 }
 
+extern int tegra_drm_register_client(struct tegra_drm *tegra,
+				     struct tegra_drm_client *client);
+extern int tegra_drm_unregister_client(struct tegra_drm *tegra,
+				       struct tegra_drm_client *client);
+
 extern int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
 extern int tegra_drm_exit(struct tegra_drm *tegra);
 
-extern int host1x_register_client(struct tegra_drm *tegra,
-				  struct host1x_client *client);
-extern int host1x_unregister_client(struct tegra_drm *tegra,
-				    struct host1x_client *client);
-
 struct tegra_output;
 
 struct tegra_dc {
-	struct tegra_drm_client client;
+	struct host1x_client client;
 	struct device *dev;
 	spinlock_t lock;
 
@@ -109,7 +104,7 @@ struct tegra_dc {
 };
 
 static inline struct tegra_dc *
-tegra_drm_client_to_dc(struct tegra_drm_client *client)
+host1x_client_to_dc(struct host1x_client *client)
 {
 	return container_of(client, struct tegra_dc, client);
 }
@@ -235,6 +230,10 @@ static inline int tegra_output_check_mode(struct tegra_output *output,
 	return output ? -ENOSYS : -EINVAL;
 }
 
+/* from bus.c */
+int drm_host1x_init(struct drm_driver *driver, struct host1x_device *device);
+void drm_host1x_exit(struct drm_driver *driver, struct host1x_device *device);
+
 /* from rgb.c */
 extern int tegra_dc_rgb_probe(struct tegra_dc *dc);
 extern int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc);
@@ -252,6 +251,8 @@ extern int tegra_drm_fb_init(struct drm_device *drm);
 extern void tegra_drm_fb_exit(struct drm_device *drm);
 extern void tegra_fbdev_restore_mode(struct tegra_fbdev *fbdev);
 
-extern struct drm_driver tegra_drm_driver;
+extern struct platform_driver tegra_dc_driver;
+extern struct platform_driver tegra_hdmi_driver;
+extern struct platform_driver tegra_gr2d_driver;
 
 #endif /* HOST1X_DRM_H */
diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index a16aaa8..9588072 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -16,7 +16,6 @@
 
 #include <linux/clk.h>
 
-#include "host1x_client.h"
 #include "drm.h"
 #include "gem.h"
 
@@ -31,19 +30,25 @@ static inline struct gr2d *to_gr2d(struct tegra_drm_client *client)
 	return container_of(client, struct gr2d, client);
 }
 
-static int gr2d_client_init(struct host1x_client *client)
+static int gr2d_init(struct host1x_client *client)
 {
-	return 0;
+	struct tegra_drm_client *drm = host1x_to_drm_client(client);
+	struct tegra_drm *tegra = dev_get_drvdata(client->parent);
+
+	return tegra_drm_register_client(tegra, drm);
 }
 
-static int gr2d_client_exit(struct host1x_client *client)
+static int gr2d_exit(struct host1x_client *client)
 {
-	return 0;
+	struct tegra_drm_client *drm = host1x_to_drm_client(client);
+	struct tegra_drm *tegra = dev_get_drvdata(client->parent);
+
+	return tegra_drm_unregister_client(tegra, drm);
 }
 
 static const struct host1x_client_ops gr2d_client_ops = {
-	.init = gr2d_client_init,
-	.exit = gr2d_client_exit,
+	.init = gr2d_init,
+	.exit = gr2d_exit,
 };
 
 static int gr2d_open_channel(struct tegra_drm_client *client,
@@ -234,12 +239,15 @@ static const struct of_device_id gr2d_match[] = {
 
 static int gr2d_probe(struct platform_device *pdev)
 {
-	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
+	struct host1x *host1x = dev_get_drvdata(pdev->dev.parent);
 	struct device *dev = &pdev->dev;
 	struct host1x_syncpt **syncpts;
 	struct gr2d *gr2d;
 	int err;
 
+	if (!host1x)
+		return -EPROBE_DEFER;
+
 	gr2d = devm_kzalloc(dev, sizeof(*gr2d), GFP_KERNEL);
 	if (!gr2d)
 		return -ENOMEM;
@@ -276,9 +284,11 @@ static int gr2d_probe(struct platform_device *pdev)
 	gr2d->client.base.class = HOST1X_CLASS_GR2D;
 	gr2d->client.base.syncpts = syncpts;
 	gr2d->client.base.num_syncpts = 1;
+
+	INIT_LIST_HEAD(&gr2d->client.list);
 	gr2d->client.ops = &gr2d_ops;
 
-	err = host1x_register_client(tegra, &gr2d->client.base);
+	err = host1x_register_client(host1x, &gr2d->client.base);
 	if (err < 0) {
 		dev_err(dev, "failed to register host1x client: %d\n", err);
 		return err;
@@ -291,12 +301,12 @@ static int gr2d_probe(struct platform_device *pdev)
 
 static int gr2d_remove(struct platform_device *pdev)
 {
-	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
+	struct host1x *host1x = dev_get_drvdata(pdev->dev.parent);
 	struct gr2d *gr2d = platform_get_drvdata(pdev);
 	unsigned int i;
 	int err;
 
-	err = host1x_unregister_client(tegra, &gr2d->client.base);
+	err = host1x_unregister_client(host1x, &gr2d->client.base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
 			err);
diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
index a237004..4489d56 100644
--- a/drivers/gpu/host1x/drm/hdmi.c
+++ b/drivers/gpu/host1x/drm/hdmi.c
@@ -13,13 +13,12 @@
 #include <linux/hdmi.h>
 #include <linux/regulator/consumer.h>
 
-#include "host1x_client.h"
 #include "hdmi.h"
 #include "drm.h"
 #include "dc.h"
 
 struct tegra_hdmi {
-	struct tegra_drm_client client;
+	struct host1x_client client;
 	struct tegra_output output;
 	struct device *dev;
 
@@ -43,7 +42,7 @@ struct tegra_hdmi {
 };
 
 static inline struct tegra_hdmi *
-tegra_drm_client_to_hdmi(struct tegra_drm_client *client)
+host1x_client_to_hdmi(struct host1x_client *client)
 {
 	return container_of(client, struct tegra_hdmi, client);
 }
@@ -1118,22 +1117,22 @@ static int tegra_hdmi_debugfs_exit(struct tegra_hdmi *hdmi)
 
 static int tegra_hdmi_init(struct host1x_client *client)
 {
-	struct tegra_drm_client *drm = to_tegra_drm_client(client);
-	struct tegra_hdmi *hdmi = tegra_drm_client_to_hdmi(drm);
+	struct tegra_drm *tegra = dev_get_drvdata(client->parent);
+	struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
 	int err;
 
 	hdmi->output.type = TEGRA_OUTPUT_HDMI;
 	hdmi->output.dev = client->dev;
 	hdmi->output.ops = &hdmi_ops;
 
-	err = tegra_output_init(drm->drm, &hdmi->output);
+	err = tegra_output_init(tegra->drm, &hdmi->output);
 	if (err < 0) {
 		dev_err(client->dev, "output setup failed: %d\n", err);
 		return err;
 	}
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
-		err = tegra_hdmi_debugfs_init(hdmi, drm->drm->primary);
+		err = tegra_hdmi_debugfs_init(hdmi, tegra->drm->primary);
 		if (err < 0)
 			dev_err(client->dev, "debugfs setup failed: %d\n", err);
 	}
@@ -1143,8 +1142,7 @@ static int tegra_hdmi_init(struct host1x_client *client)
 
 static int tegra_hdmi_exit(struct host1x_client *client)
 {
-	struct tegra_drm_client *drm = to_tegra_drm_client(client);
-	struct tegra_hdmi *hdmi = tegra_drm_client_to_hdmi(drm);
+	struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
 	int err;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
@@ -1176,11 +1174,14 @@ static const struct host1x_client_ops hdmi_client_ops = {
 
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
-	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
+	struct host1x *host1x = dev_get_drvdata(pdev->dev.parent);
 	struct tegra_hdmi *hdmi;
 	struct resource *regs;
 	int err;
 
+	if (!host1x)
+		return -EPROBE_DEFER;
+
 	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
 		return -ENOMEM;
@@ -1247,11 +1248,11 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->irq = err;
 
-	INIT_LIST_HEAD(&hdmi->client.base.list);
-	hdmi->client.base.ops = &hdmi_client_ops;
-	hdmi->client.base.dev = &pdev->dev;
+	INIT_LIST_HEAD(&hdmi->client.list);
+	hdmi->client.ops = &hdmi_client_ops;
+	hdmi->client.dev = &pdev->dev;
 
-	err = host1x_register_client(tegra, &hdmi->client.base);
+	err = host1x_register_client(host1x, &hdmi->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
@@ -1265,11 +1266,11 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 static int tegra_hdmi_remove(struct platform_device *pdev)
 {
-	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
+	struct host1x *host1x = dev_get_drvdata(pdev->dev.parent);
 	struct tegra_hdmi *hdmi = platform_get_drvdata(pdev);
 	int err;
 
-	err = host1x_unregister_client(tegra, &hdmi->client.base);
+	err = host1x_unregister_client(host1x, &hdmi->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
 			err);
diff --git a/include/drm/drmP.h b/include/drm/drmP.h
index c65f496..ec4cb60 100644
--- a/include/drm/drmP.h
+++ b/include/drm/drmP.h
@@ -150,6 +150,7 @@ int drm_err(const char *func, const char *format, ...);
 #define DRIVER_BUS_PCI 0x1
 #define DRIVER_BUS_PLATFORM 0x2
 #define DRIVER_BUS_USB 0x3
+#define DRIVER_BUS_HOST1X 0x4
 
 /***********************************************************************/
 /** \name Begin the DRM... */
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 7442f2a..a091792 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -19,7 +19,7 @@
 #ifndef __LINUX_HOST1X_H
 #define __LINUX_HOST1X_H
 
-#include <linux/kref.h>
+#include <linux/device.h>
 #include <linux/types.h>
 
 enum host1x_class {
@@ -37,6 +37,7 @@ struct host1x_client_ops {
 
 struct host1x_client {
 	struct list_head list;
+	struct device *parent;
 	struct device *dev;
 
 	const struct host1x_client_ops *ops;
@@ -230,4 +231,46 @@ void host1x_job_put(struct host1x_job *job);
 int host1x_job_pin(struct host1x_job *job, struct device *dev);
 void host1x_job_unpin(struct host1x_job *job);
 
+/*
+ * subdevice probe infrastructure
+ */
+
+struct host1x_device;
+
+struct host1x_driver {
+	const struct of_device_id *subdevs;
+	struct list_head list;
+	const char *name;
+
+	int (*probe)(struct host1x_device *device);
+	int (*remove)(struct host1x_device *device);
+};
+
+int host1x_driver_register(struct host1x_driver *driver);
+void host1x_driver_unregister(struct host1x_driver *driver);
+
+struct host1x_device {
+	struct host1x_driver *driver;
+	struct list_head list;
+	struct device dev;
+
+	struct mutex subdevs_lock;
+	struct list_head subdevs;
+
+	struct mutex clients_lock;
+	struct list_head clients;
+};
+
+static inline struct host1x_device *to_host1x_device(struct device *dev)
+{
+	return container_of(dev, struct host1x_device, dev);
+}
+
+int host1x_device_init(struct host1x_device *device);
+int host1x_device_exit(struct host1x_device *device);
+
+int host1x_register_client(struct host1x *host1x, struct host1x_client *client);
+int host1x_unregister_client(struct host1x *host1x,
+			     struct host1x_client *client);
+
 #endif
-- 
1.8.4
