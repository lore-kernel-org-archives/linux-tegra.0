From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/5] gpu: host1x: Provide a proper struct bus_type
Date: Fri, 19 Dec 2014 16:24:57 +0100
Message-ID: <1419002698-4963-4-git-send-email-thierry.reding@gmail.com>
References: <1419002698-4963-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419002698-4963-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Previously the struct bus_type exported by the host1x infrastructure was
only a very basic skeleton. Turn that implementation into a more full-
fledged bus to support proper probe ordering and power management.

Note that the bus infrastructure needs to be available before any of the
drivers can be registered, so the bus needs to be registered before the
host1x module. Otherwise drivers could be registered before the module
is loaded and trigger a BUG_ON() in driver_register(). To ensure the bus
infrastructure is always there, always build the code into the kernel
when enabled and register it with a postcore initcall.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c |   4 +-
 drivers/gpu/host1x/Makefile |   3 +-
 drivers/gpu/host1x/bus.c    | 115 +++++++++++++++++++++++++++++++-------------
 drivers/gpu/host1x/bus.h    |   3 --
 drivers/gpu/host1x/dev.c    |   9 +---
 include/linux/host1x.h      |  18 +++++--
 6 files changed, 102 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index e549afeece1f..272c2dca3536 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -908,7 +908,9 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 };
 
 static struct host1x_driver host1x_drm_driver = {
-	.name = "drm",
+	.driver = {
+		.name = "drm",
+	},
 	.probe = host1x_drm_probe,
 	.remove = host1x_drm_remove,
 	.subdevs = host1x_drm_subdevs,
diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index c1189f004441..a3e667a1b6f5 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -1,5 +1,4 @@
 host1x-y = \
-	bus.o \
 	syncpt.o \
 	dev.o \
 	intr.o \
@@ -13,3 +12,5 @@ host1x-y = \
 	hw/host1x04.o
 
 obj-$(CONFIG_TEGRA_HOST1X) += host1x.o
+
+obj-y += bus.o
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 0b52f0ea8871..28630a5e9397 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -72,13 +72,14 @@ static void host1x_subdev_del(struct host1x_subdev *subdev)
 /**
  * host1x_device_parse_dt() - scan device tree and add matching subdevices
  */
-static int host1x_device_parse_dt(struct host1x_device *device)
+static int host1x_device_parse_dt(struct host1x_device *device,
+				  struct host1x_driver *driver)
 {
 	struct device_node *np;
 	int err;
 
 	for_each_child_of_node(device->dev.parent->of_node, np) {
-		if (of_match_node(device->driver->subdevs, np) &&
+		if (of_match_node(driver->subdevs, np) &&
 		    of_device_is_available(np)) {
 			err = host1x_subdev_add(device, np);
 			if (err < 0)
@@ -109,17 +110,12 @@ static void host1x_subdev_register(struct host1x_device *device,
 	mutex_unlock(&device->clients_lock);
 	mutex_unlock(&device->subdevs_lock);
 
-	/*
-	 * When all subdevices have been registered, the composite device is
-	 * ready to be probed.
-	 */
 	if (list_empty(&device->subdevs)) {
-		err = device->driver->probe(device);
+		err = device_add(&device->dev);
 		if (err < 0)
-			dev_err(&device->dev, "probe failed for %ps: %d\n",
-				device->driver, err);
+			dev_err(&device->dev, "failed to add: %d\n", err);
 		else
-			device->bound = true;
+			device->registered = true;
 	}
 }
 
@@ -127,18 +123,16 @@ static void __host1x_subdev_unregister(struct host1x_device *device,
 				       struct host1x_subdev *subdev)
 {
 	struct host1x_client *client = subdev->client;
-	int err;
 
 	/*
 	 * If all subdevices have been activated, we're about to remove the
 	 * first active subdevice, so unload the driver first.
 	 */
-	if (list_empty(&device->subdevs) && device->bound) {
-		err = device->driver->remove(device);
-		if (err < 0)
-			dev_err(&device->dev, "remove failed: %d\n", err);
-
-		device->bound = false;
+	if (list_empty(&device->subdevs)) {
+		if (device->registered) {
+			device->registered = false;
+			device_del(&device->dev);
+		}
 	}
 
 	/*
@@ -265,19 +259,65 @@ static int host1x_del_client(struct host1x *host1x,
 	return -ENODEV;
 }
 
+static int host1x_device_match(struct device *dev, struct device_driver *drv)
+{
+	return strcmp(dev_name(dev), drv->name) == 0;
+}
+
+static int host1x_device_probe(struct device *dev)
+{
+	struct host1x_driver *driver = to_host1x_driver(dev->driver);
+	struct host1x_device *device = to_host1x_device(dev);
+
+	if (driver->probe)
+		return driver->probe(device);
+
+	return 0;
+}
+
+static int host1x_device_remove(struct device *dev)
+{
+	struct host1x_driver *driver = to_host1x_driver(dev->driver);
+	struct host1x_device *device = to_host1x_device(dev);
+
+	if (driver->remove)
+		return driver->remove(device);
+
+	return 0;
+}
+
+static void host1x_device_shutdown(struct device *dev)
+{
+	struct host1x_driver *driver = to_host1x_driver(dev->driver);
+	struct host1x_device *device = to_host1x_device(dev);
+
+	if (driver->shutdown)
+		driver->shutdown(device);
+}
+
+static const struct dev_pm_ops host1x_device_pm_ops = {
+	.suspend = pm_generic_suspend,
+	.resume = pm_generic_resume,
+	.freeze = pm_generic_freeze,
+	.thaw = pm_generic_thaw,
+	.poweroff = pm_generic_poweroff,
+	.restore = pm_generic_restore,
+};
+
 static struct bus_type host1x_bus_type = {
 	.name = "host1x",
+	.match = host1x_device_match,
+	.probe = host1x_device_probe,
+	.remove = host1x_device_remove,
+	.shutdown = host1x_device_shutdown,
+	.pm = &host1x_device_pm_ops,
 };
 
-int host1x_bus_init(void)
+static int host1x_bus_init(void)
 {
 	return bus_register(&host1x_bus_type);
 }
-
-void host1x_bus_exit(void)
-{
-	bus_unregister(&host1x_bus_type);
-}
+postcore_initcall(host1x_bus_init);
 
 static void __host1x_device_del(struct host1x_device *device)
 {
@@ -347,6 +387,8 @@ static int host1x_device_add(struct host1x *host1x,
 	if (!device)
 		return -ENOMEM;
 
+	device_initialize(&device->dev);
+
 	mutex_init(&device->subdevs_lock);
 	INIT_LIST_HEAD(&device->subdevs);
 	INIT_LIST_HEAD(&device->active);
@@ -357,18 +399,14 @@ static int host1x_device_add(struct host1x *host1x,
 
 	device->dev.coherent_dma_mask = host1x->dev->coherent_dma_mask;
 	device->dev.dma_mask = &device->dev.coherent_dma_mask;
+	dev_set_name(&device->dev, "%s", driver->driver.name);
 	device->dev.release = host1x_device_release;
-	dev_set_name(&device->dev, "%s", driver->name);
 	device->dev.bus = &host1x_bus_type;
 	device->dev.parent = host1x->dev;
 
-	err = device_register(&device->dev);
-	if (err < 0)
-		return err;
-
-	err = host1x_device_parse_dt(device);
+	err = host1x_device_parse_dt(device, driver);
 	if (err < 0) {
-		device_unregister(&device->dev);
+		kfree(device);
 		return err;
 	}
 
@@ -399,7 +437,12 @@ static int host1x_device_add(struct host1x *host1x,
 static void host1x_device_del(struct host1x *host1x,
 			      struct host1x_device *device)
 {
-	device_unregister(&device->dev);
+	if (device->registered) {
+		device->registered = false;
+		device_del(&device->dev);
+	}
+
+	put_device(&device->dev);
 }
 
 static void host1x_attach_driver(struct host1x *host1x,
@@ -474,7 +517,8 @@ int host1x_unregister(struct host1x *host1x)
 	return 0;
 }
 
-int host1x_driver_register(struct host1x_driver *driver)
+int host1x_driver_register_full(struct host1x_driver *driver,
+				struct module *owner)
 {
 	struct host1x *host1x;
 
@@ -491,9 +535,12 @@ int host1x_driver_register(struct host1x_driver *driver)
 
 	mutex_unlock(&devices_lock);
 
-	return 0;
+	driver->driver.bus = &host1x_bus_type;
+	driver->driver.owner = owner;
+
+	return driver_register(&driver->driver);
 }
-EXPORT_SYMBOL(host1x_driver_register);
+EXPORT_SYMBOL(host1x_driver_register_full);
 
 void host1x_driver_unregister(struct host1x_driver *driver)
 {
diff --git a/drivers/gpu/host1x/bus.h b/drivers/gpu/host1x/bus.h
index 4099e99212c8..c7d976e8ead7 100644
--- a/drivers/gpu/host1x/bus.h
+++ b/drivers/gpu/host1x/bus.h
@@ -20,9 +20,6 @@
 
 struct host1x;
 
-int host1x_bus_init(void);
-void host1x_bus_exit(void);
-
 int host1x_register(struct host1x *host1x);
 int host1x_unregister(struct host1x *host1x);
 
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 2529908d304b..18b36410347d 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -216,13 +216,9 @@ static int __init tegra_host1x_init(void)
 {
 	int err;
 
-	err = host1x_bus_init();
-	if (err < 0)
-		return err;
-
 	err = platform_driver_register(&tegra_host1x_driver);
 	if (err < 0)
-		goto unregister_bus;
+		return err;
 
 	err = platform_driver_register(&tegra_mipi_driver);
 	if (err < 0)
@@ -232,8 +228,6 @@ static int __init tegra_host1x_init(void)
 
 unregister_host1x:
 	platform_driver_unregister(&tegra_host1x_driver);
-unregister_bus:
-	host1x_bus_exit();
 	return err;
 }
 module_init(tegra_host1x_init);
@@ -242,7 +236,6 @@ static void __exit tegra_host1x_exit(void)
 {
 	platform_driver_unregister(&tegra_mipi_driver);
 	platform_driver_unregister(&tegra_host1x_driver);
-	host1x_bus_exit();
 }
 module_exit(tegra_host1x_exit);
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 7890b553d12e..464f33814a94 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -250,17 +250,29 @@ void host1x_job_unpin(struct host1x_job *job);
 struct host1x_device;
 
 struct host1x_driver {
+	struct device_driver driver;
+
 	const struct of_device_id *subdevs;
 	struct list_head list;
-	const char *name;
 
 	int (*probe)(struct host1x_device *device);
 	int (*remove)(struct host1x_device *device);
+	void (*shutdown)(struct host1x_device *device);
 };
 
-int host1x_driver_register(struct host1x_driver *driver);
+static inline struct host1x_driver *
+to_host1x_driver(struct device_driver *driver)
+{
+	return container_of(driver, struct host1x_driver, driver);
+}
+
+int host1x_driver_register_full(struct host1x_driver *driver,
+				struct module *owner);
 void host1x_driver_unregister(struct host1x_driver *driver);
 
+#define host1x_driver_register(driver) \
+	host1x_driver_register_full(driver, THIS_MODULE)
+
 struct host1x_device {
 	struct host1x_driver *driver;
 	struct list_head list;
@@ -273,7 +285,7 @@ struct host1x_device {
 	struct mutex clients_lock;
 	struct list_head clients;
 
-	bool bound;
+	bool registered;
 };
 
 static inline struct host1x_device *to_host1x_device(struct device *dev)
-- 
2.1.3
