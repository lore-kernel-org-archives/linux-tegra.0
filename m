From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 02/21] iommu/of: introduce a global iommu device list
Date: Fri, 30 May 2014 14:20:15 +0300
Message-ID: <1401448834-32659-3-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This enables to find an populated IOMMU device via a device node. This
can be used to see if an dependee IOMMU is populated or not to keep
correct device population order. Client devices need to wait an IOMMU
to be populated.

Suggested by Thierry Reding and copied his example code.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iommu/of_iommu.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/of_iommu.h | 16 ++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index e550ccb7634e..5d1aeb90eae3 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -21,6 +21,42 @@
 #include <linux/limits.h>
 #include <linux/of.h>
 #include <linux/of_iommu.h>
+#include <linux/device.h>
+
+static DEFINE_MUTEX(iommus_lock);
+static LIST_HEAD(iommus_list);
+
+void iommu_add(struct iommu *iommu)
+{
+	INIT_LIST_HEAD(&iommu->list);
+	mutex_lock(&iommus_lock);
+	list_add_tail(&iommu->list, &iommus_list);
+	mutex_unlock(&iommus_lock);
+}
+
+void iommu_del(struct iommu *iommu)
+{
+	INIT_LIST_HEAD(&iommu->list);
+	mutex_lock(&iommus_lock);
+	list_del(&iommu->list);
+	mutex_unlock(&iommus_lock);
+}
+
+static struct iommu *of_find_iommu_by_node(struct device_node *np)
+{
+	struct iommu *iommu;
+
+	mutex_lock(&iommus_lock);
+	list_for_each_entry(iommu, &iommus_list, list) {
+		if (iommu->dev->of_node == np) {
+			mutex_unlock(&iommus_lock);
+			return iommu;
+		}
+	}
+	mutex_unlock(&iommus_lock);
+
+	return NULL;
+}
 
 /**
  * of_get_dma_window - Parse *dma-window property and returns 0 if found.
diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
index 51a560f34bca..108306898c38 100644
--- a/include/linux/of_iommu.h
+++ b/include/linux/of_iommu.h
@@ -3,10 +3,18 @@
 
 #ifdef CONFIG_OF_IOMMU
 
+struct iommu {
+	struct list_head list;
+	struct device *dev;
+};
+
 extern int of_get_dma_window(struct device_node *dn, const char *prefix,
 			     int index, unsigned long *busno, dma_addr_t *addr,
 			     size_t *size);
 
+void iommu_add(struct iommu *iommu);
+void iommu_del(struct iommu *iommu);
+
 #else
 
 static inline int of_get_dma_window(struct device_node *dn, const char *prefix,
@@ -16,6 +24,14 @@ static inline int of_get_dma_window(struct device_node *dn, const char *prefix,
 	return -EINVAL;
 }
 
+static inline void iommu_add(struct iommu *iommu)
+{
+}
+
+static inline void iommu_del(struct iommu *iommu)
+{
+}
+
 #endif	/* CONFIG_OF_IOMMU */
 
 #endif /* __OF_IOMMU_H */
-- 
2.0.0.rc1.15.g7e76a2f
