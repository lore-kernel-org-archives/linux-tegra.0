From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] instmem/gk20a: set DMA mask early
Date: Wed, 24 Feb 2016 18:53:38 +0900
Message-ID: <1456307618-1857-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

DMA mask is typically set in nouveau_ttm_init(), but this function is
called late during initialization and GK20A's instmem will have called
DMA functions before this happens.

Having a wrongly set DMA mask can result in the use of unneeded bounce
buffers. Set it in GK20A's instmem constructor to avoid this.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/subdev/instmem/gk20a.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 6b8f2a19b2d9..4c3c744c5c6b 100644
--- a/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -576,6 +576,7 @@ gk20a_instmem_new(struct nvkm_device *device, int index,
 {
 	struct nvkm_device_tegra *tdev = device->func->tegra(device);
 	struct gk20a_instmem *imem;
+	int ret;
 
 	if (!(imem = kzalloc(sizeof(*imem), GFP_KERNEL)))
 		return -ENOMEM;
@@ -583,6 +584,10 @@ gk20a_instmem_new(struct nvkm_device *device, int index,
 	spin_lock_init(&imem->lock);
 	*pimem = &imem->base;
 
+	ret = dma_set_mask(device->dev, DMA_BIT_MASK(tdev->func->iommu_bit));
+	if (ret)
+		return ret;
+
 	/* do not allow more than 1MB of CPU-mapped instmem */
 	imem->vaddr_use = 0;
 	imem->vaddr_max = 0x100000;
-- 
2.7.1
