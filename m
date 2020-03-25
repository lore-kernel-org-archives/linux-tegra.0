From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] drm/tegra: Fix SMMU support on Tegra124 and Tegra210
Date: Wed, 25 Mar 2020 21:16:03 +0100
Message-ID: <20200325201604.833898-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When testing whether or not to enable the use of the SMMU, consult the
supported DMA mask rather than the actually configured DMA mask, since
the latter might already have been restricted.

Fixes: 2d9384ff9177 ("drm/tegra: Relax IOMMU usage criteria on old Tegra")
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c |  3 ++-
 drivers/gpu/host1x/dev.c    | 13 +++++++++++++
 include/linux/host1x.h      |  3 +++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bd268028fb3d..583cd6e0ae27 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1039,6 +1039,7 @@ void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
 
 static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 {
+	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
 	struct iommu_domain *domain;
 
 	/*
@@ -1076,7 +1077,7 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	 * sufficient and whether or not the host1x is attached to an IOMMU
 	 * doesn't matter.
 	 */
-	if (!domain && dma_get_mask(dev->dev.parent) <= DMA_BIT_MASK(32))
+	if (!domain && host1x_get_dma_mask(host1x) <= DMA_BIT_MASK(32))
 		return true;
 
 	return domain != NULL;
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 388bcc2889aa..40a4b9f8b861 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -502,6 +502,19 @@ static void __exit tegra_host1x_exit(void)
 }
 module_exit(tegra_host1x_exit);
 
+/**
+ * host1x_get_dma_mask() - query the supported DMA mask for host1x
+ * @host1x: host1x instance
+ *
+ * Note that this returns the supported DMA mask for host1x, which can be
+ * different from the applicable DMA mask under certain circumstances.
+ */
+u64 host1x_get_dma_mask(struct host1x *host1x)
+{
+	return host1x->info->dma_mask;
+}
+EXPORT_SYMBOL(host1x_get_dma_mask);
+
 MODULE_AUTHOR("Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>");
 MODULE_AUTHOR("Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
 MODULE_DESCRIPTION("Host1x driver for Tegra products");
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 62d216ff1097..c230b4e70d75 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -17,9 +17,12 @@ enum host1x_class {
 	HOST1X_CLASS_GR3D = 0x60,
 };
 
+struct host1x;
 struct host1x_client;
 struct iommu_group;
 
+u64 host1x_get_dma_mask(struct host1x *host1x);
+
 /**
  * struct host1x_client_ops - host1x client operations
  * @init: host1x client initialization code
-- 
2.24.1
