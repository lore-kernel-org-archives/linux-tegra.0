From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] nouveau: add coherent BO attribute
Date: Thu, 21 May 2015 15:08:28 +0900
Message-ID: <1432188508-650-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>, Maarten Lankhorst <maarten-FcfepWsj2zOByvU0x3ry2g@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a flag allowing Nouveau to specify that an object should be coherent
at allocation time. This is required for some class of objects like
fences which are randomly-accessed by both the CPU and GPU. This flag
instructs the kernel driver to make sure the object remains coherent
even on architectures for which coherency is not guaranteed by the bus.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes since v1:
None, just added Martin so he can merge the patch. R-b and A-b wanted. :)

 include/drm/nouveau_drm.h | 1 +
 nouveau/abi16.c           | 3 +++
 nouveau/nouveau.h         | 1 +
 3 files changed, 5 insertions(+)

diff --git a/include/drm/nouveau_drm.h b/include/drm/nouveau_drm.h
index b18cad02419b..87aefc5e9d2f 100644
--- a/include/drm/nouveau_drm.h
+++ b/include/drm/nouveau_drm.h
@@ -96,6 +96,7 @@ struct drm_nouveau_setparam {
 #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
 #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
 #define NOUVEAU_GEM_DOMAIN_MAPPABLE  (1 << 3)
+#define NOUVEAU_GEM_DOMAIN_COHERENT  (1 << 4)
 
 #define NOUVEAU_GEM_TILE_LAYOUT_MASK 0x0000ff00
 #define NOUVEAU_GEM_TILE_16BPP       0x00000001
diff --git a/nouveau/abi16.c b/nouveau/abi16.c
index 538f3a730dbe..4ca0bfbaf592 100644
--- a/nouveau/abi16.c
+++ b/nouveau/abi16.c
@@ -195,6 +195,9 @@ abi16_bo_init(struct nouveau_bo *bo, uint32_t alignment,
 	if (bo->flags & NOUVEAU_BO_MAP)
 		info->domain |= NOUVEAU_GEM_DOMAIN_MAPPABLE;
 
+	if (bo->flags & NOUVEAU_BO_COHERENT)
+		info->domain |= NOUVEAU_GEM_DOMAIN_COHERENT;
+
 	if (!(bo->flags & NOUVEAU_BO_CONTIG))
 		info->tile_flags = NOUVEAU_GEM_TILE_NONCONTIG;
 
diff --git a/nouveau/nouveau.h b/nouveau/nouveau.h
index a55e2b020778..4adda0e3594c 100644
--- a/nouveau/nouveau.h
+++ b/nouveau/nouveau.h
@@ -127,6 +127,7 @@ union nouveau_bo_config {
 #define NOUVEAU_BO_MAP     0x80000000
 #define NOUVEAU_BO_CONTIG  0x40000000
 #define NOUVEAU_BO_NOSNOOP 0x20000000
+#define NOUVEAU_BO_COHERENT 0x10000000
 
 struct nouveau_bo {
 	struct nouveau_device *device;
-- 
2.4.0
