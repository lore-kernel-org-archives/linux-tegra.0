From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gpu: host1x: Fix host1x driver shutdown
Date: Wed, 22 Mar 2017 19:15:18 +0100
Message-ID: <20170322181518.17880-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Shutting down a host1x device currently crashes if the device has failed
to probe. The root cause is that the host1x shutdown is implemented as a
struct bus_type callback, but in turn relies on the driver bound to the
device. On failure to probe, no driver will be bound and cause the code
to crash.

Fix this by moving the ->probe(), ->remove() and ->shutdown() callbacks
to the driver rather than the bus.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/bus.c | 68 ++++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 0438f98d0e3b..0c7ed03c235b 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -291,37 +291,6 @@ static int host1x_device_match(struct device *dev, struct device_driver *drv)
 	return strcmp(dev_name(dev), drv->name) == 0;
 }
 
-static int host1x_device_probe(struct device *dev)
-{
-	struct host1x_driver *driver = to_host1x_driver(dev->driver);
-	struct host1x_device *device = to_host1x_device(dev);
-
-	if (driver->probe)
-		return driver->probe(device);
-
-	return 0;
-}
-
-static int host1x_device_remove(struct device *dev)
-{
-	struct host1x_driver *driver = to_host1x_driver(dev->driver);
-	struct host1x_device *device = to_host1x_device(dev);
-
-	if (driver->remove)
-		return driver->remove(device);
-
-	return 0;
-}
-
-static void host1x_device_shutdown(struct device *dev)
-{
-	struct host1x_driver *driver = to_host1x_driver(dev->driver);
-	struct host1x_device *device = to_host1x_device(dev);
-
-	if (driver->shutdown)
-		driver->shutdown(device);
-}
-
 static const struct dev_pm_ops host1x_device_pm_ops = {
 	.suspend = pm_generic_suspend,
 	.resume = pm_generic_resume,
@@ -334,9 +303,6 @@ static const struct dev_pm_ops host1x_device_pm_ops = {
 struct bus_type host1x_bus_type = {
 	.name = "host1x",
 	.match = host1x_device_match,
-	.probe = host1x_device_probe,
-	.remove = host1x_device_remove,
-	.shutdown = host1x_device_shutdown,
 	.pm = &host1x_device_pm_ops,
 };
 
@@ -540,6 +506,37 @@ int host1x_unregister(struct host1x *host1x)
 	return 0;
 }
 
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
 int host1x_driver_register_full(struct host1x_driver *driver,
 				struct module *owner)
 {
@@ -560,6 +557,9 @@ int host1x_driver_register_full(struct host1x_driver *driver,
 
 	driver->driver.bus = &host1x_bus_type;
 	driver->driver.owner = owner;
+	driver->driver.probe = host1x_device_probe;
+	driver->driver.remove = host1x_device_remove;
+	driver->driver.shutdown = host1x_device_shutdown;
 
 	return driver_register(&driver->driver);
 }
-- 
2.12.0
