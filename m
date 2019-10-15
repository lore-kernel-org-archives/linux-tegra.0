From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 1/3] memory: Introduce memory controller mini-framework
Date: Tue, 15 Oct 2019 18:29:43 +0200
Message-ID: <20191015162945.1203736-2-thierry.reding@gmail.com>
References: <20191015162945.1203736-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20191015162945.1203736-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This new framework is currently nothing more than a registry of memory
controllers, with the goal being to order device probing. One use-case
where this is useful, for example, is a memory controller device which
needs to program some registers before the system MMU can be enabled.
Associating the memory controller with the SMMU allows the SMMU driver
to defer the probe until the memory controller has been registered.

One such example is Tegra186 where the memory controller contains some
registers that are used to program stream IDs for the various memory
clients (display, USB, PCI, ...) in the system. Programming these SIDs
is required for the memory clients to emit the proper SIDs as part of
their memory requests. The memory controller driver therefore needs to
be programmed prior to the SMMU driver. To achieve that, the memory
controller will be referenced via phandle from the SMMU device tree
node, the SMMU driver can then use the memory controller framework to
find it and defer probe until it has been registered.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/memory/Makefile           |  1 +
 drivers/memory/core.c             | 99 +++++++++++++++++++++++++++++++
 include/linux/memory-controller.h | 25 ++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 drivers/memory/core.c
 create mode 100644 include/linux/memory-controller.h

diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index 27b493435e61..d16e7dca8ef9 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -3,6 +3,7 @@
 # Makefile for memory devices
 #
 
+obj-y				+= core.o
 obj-$(CONFIG_DDR)		+= jedec_ddr_data.o
 ifeq ($(CONFIG_DDR),y)
 obj-$(CONFIG_OF)		+= of_memory.o
diff --git a/drivers/memory/core.c b/drivers/memory/core.c
new file mode 100644
index 000000000000..1772e839305a
--- /dev/null
+++ b/drivers/memory/core.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 NVIDIA Corporation.
+ */
+
+#include <linux/memory-controller.h>
+#include <linux/of.h>
+
+static DEFINE_MUTEX(controllers_lock);
+static LIST_HEAD(controllers);
+
+static void memory_controller_release(struct kref *ref)
+{
+	struct memory_controller *mc = container_of(ref, struct memory_controller, ref);
+
+	WARN_ON(!list_empty(&mc->list));
+}
+
+int memory_controller_register(struct memory_controller *mc)
+{
+	kref_init(&mc->ref);
+
+	mutex_lock(&controllers_lock);
+	list_add_tail(&mc->list, &controllers);
+	mutex_unlock(&controllers_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(memory_controller_register);
+
+void memory_controller_unregister(struct memory_controller *mc)
+{
+	mutex_lock(&controllers_lock);
+	list_del_init(&mc->list);
+	mutex_unlock(&controllers_lock);
+
+	kref_put(&mc->ref, memory_controller_release);
+}
+EXPORT_SYMBOL_GPL(memory_controller_unregister);
+
+static struct memory_controller *
+of_memory_controller_get(struct device *dev, struct device_node *np,
+			 const char *con_id)
+{
+	const char *cells = "#memory-controller-cells";
+	const char *names = "memory-controller-names";
+	const char *prop = "memory-controllers";
+	struct memory_controller *mc;
+	struct of_phandle_args args;
+	int index = 0, err;
+
+	if (con_id) {
+		index = of_property_match_string(np, names, con_id);
+		if (index < 0)
+			return ERR_PTR(index);
+	}
+
+	err = of_parse_phandle_with_args(np, prop, cells, index, &args);
+	if (err) {
+		if (err == -ENOENT)
+			err = -ENODEV;
+
+		return ERR_PTR(err);
+	}
+
+	mutex_lock(&controllers_lock);
+
+	list_for_each_entry(mc, &controllers, list) {
+		if (mc->dev && mc->dev->of_node == args.np) {
+			kref_get(&mc->ref);
+			mutex_unlock(&controllers_lock);
+			goto unlock;
+		}
+	}
+
+	mc = ERR_PTR(-EPROBE_DEFER);
+
+unlock:
+	mutex_unlock(&controllers_lock);
+	of_node_put(args.np);
+	return mc;
+}
+
+struct memory_controller *
+memory_controller_get(struct device *dev, const char *con_id)
+{
+	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
+		return of_memory_controller_get(dev, dev->of_node, con_id);
+
+	return ERR_PTR(-ENODEV);
+}
+EXPORT_SYMBOL_GPL(memory_controller_get);
+
+void memory_controller_put(struct memory_controller *mc)
+{
+	if (mc)
+		kref_put(&mc->ref, memory_controller_release);
+}
+EXPORT_SYMBOL_GPL(memory_controller_put);
diff --git a/include/linux/memory-controller.h b/include/linux/memory-controller.h
new file mode 100644
index 000000000000..4b06b2ea1d14
--- /dev/null
+++ b/include/linux/memory-controller.h
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 NVIDIA Corporation.
+ */
+
+#ifndef _LINUX_MEMORY_CONTROLLER_H
+#define _LINUX_MEMORY_CONTROLLER_H
+
+#include <linux/device.h>
+#include <linux/list.h>
+
+struct memory_controller {
+	struct device *dev;
+	struct kref ref;
+	struct list_head list;
+};
+
+int memory_controller_register(struct memory_controller *mc);
+void memory_controller_unregister(struct memory_controller *mc);
+
+struct memory_controller *memory_controller_get(struct device *dev,
+						const char *con_id);
+void memory_controller_put(struct memory_controller *mc);
+
+#endif
-- 
2.23.0
