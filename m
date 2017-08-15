From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gpu: host1x: Support sub-devices recursively
Date: Tue, 15 Aug 2017 15:46:22 +0200
Message-ID: <20170815134622.21289-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The display architecture in Tegra186 changes slightly compared to
earlier Tegra generations, which requires that we recursively scan
host1x sub-devices from device tree.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/bus.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 7ece0e9058c6..998139c964f4 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -44,9 +44,14 @@ struct host1x_subdev {
  * @np: device node
  */
 static int host1x_subdev_add(struct host1x_device *device,
+			     struct host1x_driver *driver,
 			     struct device_node *np)
 {
 	struct host1x_subdev *subdev;
+	struct device_node *child;
+	int err;
+
+	dev_info(&device->dev, "adding subdevice %s\n", np->full_name);
 
 	subdev = kzalloc(sizeof(*subdev), GFP_KERNEL);
 	if (!subdev)
@@ -59,6 +64,19 @@ static int host1x_subdev_add(struct host1x_device *device,
 	list_add_tail(&subdev->list, &device->subdevs);
 	mutex_unlock(&device->subdevs_lock);
 
+	/* recursively add children */
+	for_each_child_of_node(np, child) {
+		if (of_match_node(driver->subdevs, child) &&
+		    of_device_is_available(child)) {
+			err = host1x_subdev_add(device, driver, child);
+			if (err < 0) {
+				/* XXX cleanup? */
+				of_node_put(child);
+				return err;
+			}
+		}
+	}
+
 	return 0;
 }
 
@@ -87,7 +105,7 @@ static int host1x_device_parse_dt(struct host1x_device *device,
 	for_each_child_of_node(device->dev.parent->of_node, np) {
 		if (of_match_node(driver->subdevs, np) &&
 		    of_device_is_available(np)) {
-			err = host1x_subdev_add(device, np);
+			err = host1x_subdev_add(device, driver, np);
 			if (err < 0) {
 				of_node_put(np);
 				return err;
@@ -104,6 +122,8 @@ static void host1x_subdev_register(struct host1x_device *device,
 {
 	int err;
 
+	dev_info(&device->dev, "registering subdevice %s\n", subdev->np->full_name);
+
 	/*
 	 * Move the subdevice to the list of active (registered) subdevices
 	 * and associate it with a client. At the same time, associate the
@@ -124,6 +144,10 @@ static void host1x_subdev_register(struct host1x_device *device,
 			dev_err(&device->dev, "failed to add: %d\n", err);
 		else
 			device->registered = true;
+	} else {
+		dev_info(&device->dev, "remaining subdevices:\n");
+		list_for_each_entry(subdev, &device->subdevs, list)
+			dev_info(&device->dev, "  %s\n", subdev->np->full_name);
 	}
 }
 
-- 
2.13.3
