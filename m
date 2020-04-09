From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v6 02/14] of: reserved-memory: Support lookup of regions by name
Date: Thu,  9 Apr 2020 19:52:26 +0200
Message-ID: <20200409175238.3586487-3-thierry.reding@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20200409175238.3586487-1-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
index 1a84bc0d5fa8..ed2ff6f01d32 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -357,6 +357,25 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_by_idx);
 
+/**
+ * of_reserved_mem_device_init_by_name() - assign named reserved memory region
+ *					   to given device
+ * @dev: pointer to the device to configure
+ * @np: pointer to the device node with 'memory-region' property
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
