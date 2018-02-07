From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] drm/tegra: gem: Make __tegra_gem_mmap() available more widely
Date: Wed,  7 Feb 2018 18:45:55 +0100
Message-ID: <20180207174556.25401-2-thierry.reding@gmail.com>
References: <20180207174556.25401-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180207174556.25401-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This function allows mapping a GEM object into a virtual memory address
space, which makes it useful outside of the GEM code.

While at it, rename the function so it doesn't clash with the function
that implements the DRM_TEGRA_GEM_MMAP IOCTL.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/gem.c | 7 +++----
 drivers/gpu/drm/tegra/gem.h | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 0e390ae73559..4b80fe58d4f7 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -464,8 +464,7 @@ const struct vm_operations_struct tegra_bo_vm_ops = {
 	.close = drm_gem_vm_close,
 };
 
-static int tegra_gem_mmap(struct drm_gem_object *gem,
-			  struct vm_area_struct *vma)
+int __tegra_gem_mmap(struct drm_gem_object *gem, struct vm_area_struct *vma)
 {
 	struct tegra_bo *bo = to_tegra_bo(gem);
 
@@ -512,7 +511,7 @@ int tegra_drm_mmap(struct file *file, struct vm_area_struct *vma)
 
 	gem = vma->vm_private_data;
 
-	return tegra_gem_mmap(gem, vma);
+	return __tegra_gem_mmap(gem, vma);
 }
 
 static struct sg_table *
@@ -633,7 +632,7 @@ static int tegra_gem_prime_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
 	if (err < 0)
 		return err;
 
-	return tegra_gem_mmap(gem, vma);
+	return __tegra_gem_mmap(gem, vma);
 }
 
 static void *tegra_gem_prime_vmap(struct dma_buf *buf)
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index 7e1635a01c81..bb369c129fdd 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -75,6 +75,7 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
 
 extern const struct vm_operations_struct tegra_bo_vm_ops;
 
+int __tegra_gem_mmap(struct drm_gem_object *gem, struct vm_area_struct *vma);
 int tegra_drm_mmap(struct file *file, struct vm_area_struct *vma);
 
 struct dma_buf *tegra_gem_prime_export(struct drm_device *drm,
-- 
2.15.1
