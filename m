From: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/6] gpu: drm: tegra: Prime support
Date: Thu, 22 Nov 2012 14:16:53 +0200
Message-ID: <1353586614-7308-6-git-send-email-tbergstrom@nvidia.com>
References: <1353586614-7308-1-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353586614-7308-1-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This patch introduces support for exporting allocated memory as
dmabuf objects. Exported buffers are used for delivering data to
nvhost driver.

Change-Id: Ide8244366e83747a108fc3aaf762ec1350dba616
Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/Makefile |    2 +-
 drivers/gpu/drm/tegra/dmabuf.c |  150 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/drm.c    |    9 ++-
 drivers/gpu/drm/tegra/drm.h    |    6 ++
 4 files changed, 165 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/dmabuf.c

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index 57a334d..53ea383 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -3,6 +3,6 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
 
 tegra-drm-y := drm.o fb.o dc.o
 tegra-drm-y += output.o rgb.o hdmi.o tvo.o dsi.o
-tegra-drm-y += plane.o
+tegra-drm-y += plane.o dmabuf.o
 
 obj-$(CONFIG_DRM_TEGRA) += tegra-drm.o
diff --git a/drivers/gpu/drm/tegra/dmabuf.c b/drivers/gpu/drm/tegra/dmabuf.c
new file mode 100644
index 0000000..e81db12
--- /dev/null
+++ b/drivers/gpu/drm/tegra/dmabuf.c
@@ -0,0 +1,150 @@
+/*
+ * drivers/gpu/drm/tegra/dmabuf.c
+ *
+ * dmabuf exporter for cma allocations
+ *
+ * Copyright (c) 2012, NVIDIA Corporation.
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
+#include <drm/drmP.h>
+#include <drm/drm.h>
+#include <drm/drm_gem_cma_helper.h>
+
+#include <linux/sched.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/scatterlist.h>
+#include <linux/uaccess.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/dma-buf.h>
+
+#include <asm/page.h>
+#include <asm/dma-iommu.h>
+
+static struct sg_table *tegra_dmabuf_map(struct dma_buf_attachment *attach,
+					enum dma_data_direction dir)
+{
+	struct drm_gem_cma_object *obj = attach->dmabuf->priv;
+	struct page **pages;
+	int npages = obj->base.size / PAGE_SIZE;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	int i, page_num = 0;
+
+	/* create a list of used pages */
+	pages = kzalloc(sizeof(*pages) * npages, GFP_KERNEL);
+	if (!pages)
+		goto err_alloc_pages;
+	for (i = 0; i < npages; i++)
+		pages[i] = virt_to_page(obj->vaddr + i * PAGE_SIZE);
+
+	/* generate sgt using the page list */
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		goto err_alloc_sgt;
+	if (sg_alloc_table_from_pages(sgt, pages, npages, 0, obj->base.size,
+		GFP_KERNEL))
+		goto err_generate_sgt;
+	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+		sg->dma_address = page_to_phys(pages[page_num]);
+		page_num += sg->length >> PAGE_SHIFT;
+	}
+
+	/* only the sgt is interesting */
+	kfree(pages);
+
+	return sgt;
+
+err_generate_sgt:
+	kfree(sgt);
+err_alloc_sgt:
+	kfree(pages);
+err_alloc_pages:
+	return NULL;
+}
+
+static void tegra_dmabuf_unmap(struct dma_buf_attachment *attach,
+					struct sg_table *sgt,
+					enum dma_data_direction dir)
+{
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+static void tegra_dmabuf_release(struct dma_buf *dmabuf)
+{
+	struct drm_gem_cma_object *obj = dmabuf->priv;
+
+	if (obj->base.export_dma_buf == dmabuf) {
+		obj->base.export_dma_buf = NULL;
+		drm_gem_object_unreference_unlocked(&obj->base);
+	}
+}
+
+static void *tegra_dmabuf_kmap_atomic(struct dma_buf *dmabuf,
+					unsigned long page_num)
+{
+	struct drm_gem_cma_object *obj = dmabuf->priv;
+	return obj->vaddr + PAGE_SIZE * page_num;
+}
+
+static void *tegra_dmabuf_kmap(struct dma_buf *dmabuf, unsigned long page_num)
+{
+	return tegra_dmabuf_kmap_atomic(dmabuf, page_num);
+}
+
+static int tegra_dmabuf_mmap(struct dma_buf *dmabuf,
+			       struct vm_area_struct *vma)
+{
+	struct drm_gem_cma_object *obj = dmabuf->priv;
+	DEFINE_DMA_ATTRS(attrs);
+
+	vma->vm_private_data = obj;
+
+	return dma_mmap_attrs(obj->base.dev->dev->parent, vma, obj->vaddr,
+		obj->paddr, obj->base.size, &attrs);
+}
+
+static void *tegra_dmabuf_vmap(struct dma_buf *dmabuf)
+{
+	struct drm_gem_cma_object *obj = dmabuf->priv;
+	return obj->vaddr;
+}
+
+static struct dma_buf_ops tegra_dmabuf_ops = {
+	.map_dma_buf	= tegra_dmabuf_map,
+	.unmap_dma_buf	= tegra_dmabuf_unmap,
+	.release	= tegra_dmabuf_release,
+	.kmap_atomic	= tegra_dmabuf_kmap_atomic,
+	.kmap		= tegra_dmabuf_kmap,
+	.mmap		= tegra_dmabuf_mmap,
+	.vmap		= tegra_dmabuf_vmap,
+};
+
+struct dma_buf *tegra_dmabuf_export(struct drm_device *drm_dev,
+				struct drm_gem_object *obj, int flags)
+{
+	return dma_buf_export(obj, &tegra_dmabuf_ops, obj->size, O_RDWR);
+}
+
+struct drm_gem_object *tegra_dmabuf_import(struct drm_device *drm_dev,
+					struct dma_buf *dmabuf)
+{
+	return NULL;
+}
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 1850f71..045c5c9 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -250,7 +250,8 @@ static const struct file_operations tegra_drm_fops = {
 };
 
 struct drm_driver tegra_drm_driver = {
-	.driver_features = DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GEM,
+	.driver_features = DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GEM |
+		DRIVER_PRIME,
 	.load = tegra_drm_load,
 	.unload = tegra_drm_unload,
 	.open = tegra_drm_open,
@@ -266,6 +267,12 @@ struct drm_driver tegra_drm_driver = {
 	.num_ioctls = ARRAY_SIZE(tegra_drm_ioctls),
 	.fops = &tegra_drm_fops,
 
+	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
+
+	.gem_prime_export = tegra_dmabuf_export,
+	.gem_prime_import = tegra_dmabuf_import,
+
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 	.date = DRIVER_DATE,
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index b2f9f10..1267a38 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -227,4 +227,10 @@ extern struct platform_driver tegra_dsi_driver;
 extern struct platform_driver tegra_dc_driver;
 extern struct drm_driver tegra_drm_driver;
 
+/* from dmabuf.c */
+struct dma_buf *tegra_dmabuf_export(struct drm_device *drm_dev,
+				struct drm_gem_object *obj, int flags);
+struct drm_gem_object *tegra_dmabuf_import(struct drm_device *drm_dev,
+					struct dma_buf *dmabuf);
+
 #endif /* TEGRA_DRM_H */
-- 
1.7.9.5
