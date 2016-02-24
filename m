From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 01/11] core: add gpuobj memcpy helper functions
Date: Wed, 24 Feb 2016 14:42:14 +0900
Message-ID: <1456292544-32206-2-git-send-email-acourbot@nvidia.com>
References: <1456292544-32206-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456292544-32206-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add memcpy functions to copy a buffer to a gpuobj and vice-versa. This
will be used by the secure boot code.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/include/nvkm/core/gpuobj.h |  4 ++++
 drm/nouveau/nvkm/core/gpuobj.c         | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drm/nouveau/include/nvkm/core/gpuobj.h b/drm/nouveau/include/nvkm/core/gpuobj.h
index d4f56eafb073..c23da4f05929 100644
--- a/drm/nouveau/include/nvkm/core/gpuobj.h
+++ b/drm/nouveau/include/nvkm/core/gpuobj.h
@@ -37,4 +37,8 @@ int nvkm_gpuobj_wrap(struct nvkm_memory *, struct nvkm_gpuobj **);
 int nvkm_gpuobj_map(struct nvkm_gpuobj *, struct nvkm_vm *, u32 access,
 		    struct nvkm_vma *);
 void nvkm_gpuobj_unmap(struct nvkm_vma *);
+void nvkm_gpuobj_memcpy_to(struct nvkm_gpuobj *dst, u32 dstoffset, void *src,
+			   u32 length);
+void nvkm_gpuobj_memcpy_from(void *dst, struct nvkm_gpuobj *src, u32 srcoffset,
+			     u32 length);
 #endif
diff --git a/drm/nouveau/nvkm/core/gpuobj.c b/drm/nouveau/nvkm/core/gpuobj.c
index c3a790eb8d6a..a7bd22706b2a 100644
--- a/drm/nouveau/nvkm/core/gpuobj.c
+++ b/drm/nouveau/nvkm/core/gpuobj.c
@@ -253,3 +253,23 @@ nvkm_gpuobj_wrap(struct nvkm_memory *memory, struct nvkm_gpuobj **pgpuobj)
 	(*pgpuobj)->size = nvkm_memory_size(memory);
 	return 0;
 }
+
+void
+nvkm_gpuobj_memcpy_to(struct nvkm_gpuobj *dst, u32 dstoffset, void *src,
+		      u32 length)
+{
+	int i;
+
+	for (i = 0; i < length; i += 4)
+		nvkm_wo32(dst, dstoffset + i, *(u32 *)(src + i));
+}
+
+void
+nvkm_gpuobj_memcpy_from(void *dst, struct nvkm_gpuobj *src, u32 srcoffset,
+			u32 length)
+{
+	int i;
+
+	for (i = 0; i < length; i += 4)
+		((u32 *)src)[i / 4] = nvkm_ro32(src, srcoffset + i);
+}
-- 
2.7.1
