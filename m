From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/4] of: reserved-memory: Support lookup of regions by name
Date: Fri,  3 Apr 2020 20:56:39 +0200
Message-ID: <20200403185640.118569-4-thierry.reding@gmail.com>
References: <20200403185640.118569-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200403185640.118569-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add support for looking up memory regions by name. This looks up the
given name in the newly introduced memory-region-names property and
returns the memory region at the corresponding index in the memory-
region(s) property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/of_reserved_mem.c    | 19 +++++++++++++++++++
 include/linux/of_reserved_mem.h | 11 +++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 62a35422c28d..dae70b147552 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -360,6 +360,25 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_by_idx);
 
+/**
+ * of_reserved_mem_device_init_by_name() - assign named reserved memory region
+ *					   to given device
+ * @dev: pointer to the device to configure
+ * @np: pointer to the device node with 'memory-region(s)' property
+ * @name: name of the selected memory region
+ *
+ * Returns: 0 on success or a negative error-code on failure.
+ */
+int of_reserved_mem_device_init_by_name(struct device *dev,
+					struct device_node *np,
+					const char *name)
+{
+	int idx = of_property_match_string(np, "memory-region-names", name);
+
+	return of_reserved_mem_device_init_by_idx(dev, np, idx);
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_by_name);
+
 /**
  * of_reserved_mem_device_release() - release reserved memory device structures
  * @dev:	Pointer to the device to deconfigure
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 60f541912ccf..a1b427ac291b 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -33,6 +33,9 @@ typedef int (*reservedmem_of_init_fn)(struct reserved_mem *rmem);
 
 int of_reserved_mem_device_init_by_idx(struct device *dev,
 				       struct device_node *np, int idx);
+int of_reserved_mem_device_init_by_name(struct device *dev,
+					struct device_node *np,
+					const char *name);
 void of_reserved_mem_device_release(struct device *dev);
 
 void fdt_init_reserved_mem(void);
@@ -45,6 +48,14 @@ static inline int of_reserved_mem_device_init_by_idx(struct device *dev,
 {
 	return -ENOSYS;
 }
+
+static inline int of_reserved_mem_device_init_by_name(struct device *dev,
+						      struct device_node *np,
+						      const char *name)
+{
+	return -ENOSYS;
+}
+
 static inline void of_reserved_mem_device_release(struct device *pdev) { }
 
 static inline void fdt_init_reserved_mem(void) { }
-- 
2.24.1
