From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 03/21] iommu/of: check if dependee iommu is ready or not
Date: Fri, 30 May 2014 14:20:16 +0300
Message-ID: <1401448834-32659-4-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

IOMMU devices on the bus need to be poplulated first, then iommu
master devices are done later.

With CONFIG_OF_IOMMU, "iommus=" DT binding would be used to identify
whether a device can be an iommu msater or not. If a device can, we'll
defer to populate that device till an depending iommu device is
populated.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/of_iommu.c | 13 +++++++++++++
 include/linux/of_iommu.h |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5d1aeb90eae3..b9f5081515ae 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -125,3 +125,16 @@ int of_get_dma_window(struct device_node *dn, const char *prefix, int index,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_get_dma_window);
+
+int of_iommu_attach(struct device *dev)
+{
+	struct of_phandle_iter iter;
+
+	of_property_for_each_phandle_with_args(iter, dev->of_node, "iommus",
+					       "iommu-cells", 0) {
+		if (!of_find_iommu_by_node(iter.out_args.np))
+			return -EPROBE_DEFER;
+	}
+
+	return 0;
+}
diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
index 108306898c38..0e2f5681b45a 100644
--- a/include/linux/of_iommu.h
+++ b/include/linux/of_iommu.h
@@ -14,6 +14,7 @@ extern int of_get_dma_window(struct device_node *dn, const char *prefix,
 
 void iommu_add(struct iommu *iommu);
 void iommu_del(struct iommu *iommu);
+int of_iommu_attach(struct device *dev);
 
 #else
 
@@ -32,6 +33,11 @@ static inline void iommu_del(struct iommu *iommu)
 {
 }
 
+static inline int of_iommu_attach(struct device *dev)
+{
+	return 0;
+}
+
 #endif	/* CONFIG_OF_IOMMU */
 
 #endif /* __OF_IOMMU_H */
-- 
2.0.0.rc1.15.g7e76a2f
