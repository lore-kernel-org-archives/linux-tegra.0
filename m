From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] drm/nouveau: add GEM_SET_TILING staging ioctl
Date: Mon, 15 Jun 2015 16:09:29 +0900
Message-ID: <1434352169-10501-3-git-send-email-acourbot@nvidia.com>
References: <1434352169-10501-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434352169-10501-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add new NOUVEAU_GEM_SET_TILING ioctl to set correct tiling
mode for imported dma-bufs. This ioctl is staging for now
and enabled with the "staging_tiling" module option.

Signed-off-by: Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org: carry upstream, many fixes]
Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nouveau_bo.c           | 18 ++++++++++++
 drm/nouveau/nouveau_bo.h           |  2 ++
 drm/nouveau/nouveau_drm.c          |  6 ++++
 drm/nouveau/nouveau_gem.c          | 58 ++++++++++++++++++++++++++++++++++++++
 drm/nouveau/nouveau_gem.h          |  2 ++
 drm/nouveau/nouveau_ttm.c          | 13 +--------
 drm/nouveau/uapi/drm/nouveau_drm.h |  8 ++++++
 7 files changed, 95 insertions(+), 12 deletions(-)

diff --git a/drm/nouveau/nouveau_bo.c b/drm/nouveau/nouveau_bo.c
index 6edcce1658b7..2a2ebbeb4fc0 100644
--- a/drm/nouveau/nouveau_bo.c
+++ b/drm/nouveau/nouveau_bo.c
@@ -178,6 +178,24 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, u32 flags,
 	*size = roundup(*size, PAGE_SIZE);
 }
 
+void
+nouveau_bo_update_tiling(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
+			 struct nvkm_mem *mem)
+{
+	switch (drm->device.info.family) {
+	case NV_DEVICE_INFO_V0_TESLA:
+		if (drm->device.info.chipset != 0x50)
+			mem->memtype = (nvbo->tile_flags & 0x7f00) >> 8;
+		break;
+	case NV_DEVICE_INFO_V0_FERMI:
+	case NV_DEVICE_INFO_V0_KEPLER:
+		mem->memtype = (nvbo->tile_flags & 0xff00) >> 8;
+		break;
+	default:
+		break;
+	}
+}
+
 int
 nouveau_bo_new(struct drm_device *dev, int size, int align,
 	       uint32_t flags, uint32_t tile_mode, uint32_t tile_flags,
diff --git a/drm/nouveau/nouveau_bo.h b/drm/nouveau/nouveau_bo.h
index e42360983229..87d07e3533eb 100644
--- a/drm/nouveau/nouveau_bo.h
+++ b/drm/nouveau/nouveau_bo.h
@@ -69,6 +69,8 @@ nouveau_bo_ref(struct nouveau_bo *ref, struct nouveau_bo **pnvbo)
 extern struct ttm_bo_driver nouveau_bo_driver;
 
 void nouveau_bo_move_init(struct nouveau_drm *);
+void nouveau_bo_update_tiling(struct nouveau_drm *, struct nouveau_bo *,
+			      struct nvkm_mem *);
 int  nouveau_bo_new(struct drm_device *, int size, int align, u32 flags,
 		    u32 tile_mode, u32 tile_flags, struct sg_table *sg,
 		    struct reservation_object *robj,
diff --git a/drm/nouveau/nouveau_drm.c b/drm/nouveau/nouveau_drm.c
index 28860268cf38..45a2c88ebf8e 100644
--- a/drm/nouveau/nouveau_drm.c
+++ b/drm/nouveau/nouveau_drm.c
@@ -75,6 +75,10 @@ MODULE_PARM_DESC(runpm, "disable (0), force enable (1), optimus only default (-1
 int nouveau_runtime_pm = -1;
 module_param_named(runpm, nouveau_runtime_pm, int, 0400);
 
+MODULE_PARM_DESC(staging_tiling, "enable staging GEM_SET_TILING ioctl");
+int nouveau_staging_tiling = 0;
+module_param_named(staging_tiling, nouveau_staging_tiling, int, 0600);
+
 static struct drm_driver driver_stub;
 static struct drm_driver driver_pci;
 static struct drm_driver driver_platform;
@@ -897,6 +901,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	/* Staging ioctls */
+	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_SET_TILING, nouveau_gem_ioctl_set_tiling, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 };
 
 long
@@ -1029,6 +1034,7 @@ static void nouveau_display_options(void)
 	DRM_DEBUG_DRIVER("... runpm        : %d\n", nouveau_runtime_pm);
 	DRM_DEBUG_DRIVER("... vram_pushbuf : %d\n", nouveau_vram_pushbuf);
 	DRM_DEBUG_DRIVER("... pstate       : %d\n", nouveau_pstate);
+	DRM_DEBUG_DRIVER("... staging_tiling: %d\n", nouveau_staging_tiling);
 }
 
 static const struct dev_pm_ops nouveau_pm_ops = {
diff --git a/drm/nouveau/nouveau_gem.c b/drm/nouveau/nouveau_gem.c
index 0e690bf19fc9..0e69449798aa 100644
--- a/drm/nouveau/nouveau_gem.c
+++ b/drm/nouveau/nouveau_gem.c
@@ -172,6 +172,64 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	ttm_bo_unreserve(&nvbo->bo);
 }
 
+extern int nouveau_staging_tiling;
+int
+nouveau_gem_ioctl_set_tiling(struct drm_device *dev, void *data,
+			     struct drm_file *file_priv)
+{
+	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
+	struct nvkm_fb *pfb = nvxx_fb(&drm->device);
+	struct drm_nouveau_gem_set_tiling *req = data;
+	struct drm_gem_object *gem;
+	struct nouveau_bo *nvbo;
+	struct nvkm_vma *vma;
+	int ret = 0;
+
+	if (!nouveau_staging_tiling)
+		return -EINVAL;
+
+	if (!pfb->memtype_valid(pfb, req->tile_flags)) {
+		NV_PRINTK(error, cli, "bad page flags: 0x%08x\n", req->tile_flags);
+		return -EINVAL;
+	}
+
+	gem = drm_gem_object_lookup(dev, file_priv, req->handle);
+	if (!gem)
+		return -ENOENT;
+
+	nvbo = nouveau_gem_object(gem);
+
+	/* We can only change tiling on PRIME-imported buffers */
+	if (nvbo->bo.type != ttm_bo_type_sg) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (nvbo->tile_mode != req->tile_mode ||
+	    nvbo->tile_flags != req->tile_flags) {
+		ret = ttm_bo_reserve(&nvbo->bo, false, false, false, NULL);
+		if (ret)
+			goto out;
+
+		nvbo->tile_mode = req->tile_mode;
+		nvbo->tile_flags = req->tile_flags;
+
+		nouveau_bo_update_tiling(drm, nvbo, nvbo->bo.mem.mm_node);
+
+		/* remap over existing mapping with new tile parameters */
+		vma = nouveau_bo_vma_find(nvbo, cli->vm);
+		if (vma)
+			nvkm_vm_map(vma, nvbo->bo.mem.mm_node);
+
+		ttm_bo_unreserve(&nvbo->bo);
+	}
+
+out:
+	drm_gem_object_unreference_unlocked(gem);
+	return ret;
+}
+
 int
 nouveau_gem_new(struct drm_device *dev, int size, int align, uint32_t domain,
 		uint32_t tile_mode, uint32_t tile_flags,
diff --git a/drm/nouveau/nouveau_gem.h b/drm/nouveau/nouveau_gem.h
index e4049faca780..56e741d98bcd 100644
--- a/drm/nouveau/nouveau_gem.h
+++ b/drm/nouveau/nouveau_gem.h
@@ -23,6 +23,8 @@ extern void nouveau_gem_object_del(struct drm_gem_object *);
 extern int nouveau_gem_object_open(struct drm_gem_object *, struct drm_file *);
 extern void nouveau_gem_object_close(struct drm_gem_object *,
 				     struct drm_file *);
+extern int nouveau_gem_ioctl_set_tiling(struct drm_device *, void *,
+					struct drm_file *);
 extern int nouveau_gem_ioctl_new(struct drm_device *, void *,
 				 struct drm_file *);
 extern int nouveau_gem_ioctl_pushbuf(struct drm_device *, void *,
diff --git a/drm/nouveau/nouveau_ttm.c b/drm/nouveau/nouveau_ttm.c
index 18f449715788..d680153db6e5 100644
--- a/drm/nouveau/nouveau_ttm.c
+++ b/drm/nouveau/nouveau_ttm.c
@@ -174,18 +174,7 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
 
 	node->page_shift = 12;
 
-	switch (drm->device.info.family) {
-	case NV_DEVICE_INFO_V0_TESLA:
-		if (drm->device.info.chipset != 0x50)
-			node->memtype = (nvbo->tile_flags & 0x7f00) >> 8;
-		break;
-	case NV_DEVICE_INFO_V0_FERMI:
-	case NV_DEVICE_INFO_V0_KEPLER:
-		node->memtype = (nvbo->tile_flags & 0xff00) >> 8;
-		break;
-	default:
-		break;
-	}
+	nouveau_bo_update_tiling(drm, nvbo, node);
 
 	mem->mm_node = node;
 	mem->start   = 0;
diff --git a/drm/nouveau/uapi/drm/nouveau_drm.h b/drm/nouveau/uapi/drm/nouveau_drm.h
index 4e7e21f41b5c..8f10b16b1473 100644
--- a/drm/nouveau/uapi/drm/nouveau_drm.h
+++ b/drm/nouveau/uapi/drm/nouveau_drm.h
@@ -64,6 +64,12 @@ struct drm_nouveau_gem_new {
 	uint32_t align;
 };
 
+struct drm_nouveau_gem_set_tiling {
+	uint32_t handle;
+	uint32_t tile_mode;
+	uint32_t tile_flags;
+};
+
 #define NOUVEAU_GEM_MAX_BUFFERS 1024
 struct drm_nouveau_gem_pushbuf_bo_presumed {
 	uint32_t valid;
@@ -142,6 +148,7 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_NOUVEAU_GEM_INFO           0x44
 /* range 0x98..DRM_COMMAND_END (8 entries) is reserved for staging, unstable ioctls */
 #define DRM_NOUVEAU_STAGING_IOCTL      0x58
+#define DRM_NOUVEAU_GEM_SET_TILING     (DRM_NOUVEAU_STAGING_IOCTL + 0x0)
 
 #define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
 #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
@@ -149,5 +156,6 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
 #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
 /* staging ioctls */
+#define DRM_IOCTL_NOUVEAU_GEM_SET_TILING     DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_SET_TILING, struct drm_nouveau_gem_set_tiling)
 
 #endif /* __NOUVEAU_DRM_H__ */
-- 
2.4.2
