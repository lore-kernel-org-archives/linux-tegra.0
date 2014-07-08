From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 4/6] drm/nouveau: synchronize BOs when required
Date: Tue, 8 Jul 2014 17:25:59 +0900
Message-ID: <1404807961-30530-5-git-send-email-acourbot@nvidia.com>
References: <1404807961-30530-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1404807961-30530-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On architectures for which access to GPU memory is non-coherent,
caches need to be flushed and invalidated explicitly when BO control
changes between CPU and GPU.

This patch adds buffer synchronization functions which invokes the
correct API (PCI or DMA) to ensure synchronization is effective.

Based on the TTM DMA cache helper patches by Lucas Stach.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  | 56 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_bo.h  |  2 ++
 drivers/gpu/drm/nouveau/nouveau_gem.c | 12 ++++++++
 3 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 67e9e8e2e2ec..47e4e8886769 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -402,6 +402,60 @@ nouveau_bo_unmap(struct nouveau_bo *nvbo)
 		ttm_bo_kunmap(&nvbo->kmap);
 }
 
+void
+nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
+{
+	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
+	struct nouveau_device *device = nouveau_dev(drm->dev);
+	struct ttm_dma_tt *ttm_dma = (struct ttm_dma_tt *)nvbo->bo.ttm;
+	int i;
+
+	if (!ttm_dma)
+		return;
+
+	if (nv_device_is_cpu_coherent(device) || nvbo->force_coherent)
+		return;
+
+	if (nv_device_is_pci(device)) {
+		for (i = 0; i < ttm_dma->ttm.num_pages; i++)
+			pci_dma_sync_single_for_device(device->pdev,
+				ttm_dma->dma_address[i], PAGE_SIZE,
+				PCI_DMA_TODEVICE);
+	} else {
+		for (i = 0; i < ttm_dma->ttm.num_pages; i++)
+			dma_sync_single_for_device(nv_device_base(device),
+				ttm_dma->dma_address[i], PAGE_SIZE,
+				DMA_TO_DEVICE);
+	}
+}
+
+void
+nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
+{
+	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
+	struct nouveau_device *device = nouveau_dev(drm->dev);
+	struct ttm_dma_tt *ttm_dma = (struct ttm_dma_tt *)nvbo->bo.ttm;
+	int i;
+
+	if (!ttm_dma)
+		return;
+
+	if (nv_device_is_cpu_coherent(device) || nvbo->force_coherent)
+		return;
+
+	if (nv_device_is_pci(device)) {
+		for (i = 0; i < ttm_dma->ttm.num_pages; i++)
+			pci_dma_sync_single_for_cpu(device->pdev,
+				ttm_dma->dma_address[i], PAGE_SIZE,
+				PCI_DMA_FROMDEVICE);
+	} else {
+		for (i = 0; i < ttm_dma->ttm.num_pages; i++)
+			dma_sync_single_for_cpu(nv_device_base(device),
+				ttm_dma->dma_address[i], PAGE_SIZE,
+				DMA_FROM_DEVICE);
+	}
+}
+
 int
 nouveau_bo_validate(struct nouveau_bo *nvbo, bool interruptible,
 		    bool no_wait_gpu)
@@ -418,6 +472,8 @@ nouveau_bo_validate(struct nouveau_bo *nvbo, bool interruptible,
 	if (!ttm)
 		return ret;
 
+	nouveau_bo_sync_for_device(nvbo);
+
 	device = nouveau_dev(nouveau_bdev(ttm->bdev)->dev);
 	nv_wr32(device, 0x70004, 0x00000001);
 	if (!nv_wait(device, 0x070004, 0x00000001, 0x00000000))
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index ff17c1f432fc..fa42298d2dca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -81,6 +81,8 @@ void nouveau_bo_wr32(struct nouveau_bo *, unsigned index, u32 val);
 void nouveau_bo_fence(struct nouveau_bo *, struct nouveau_fence *);
 int  nouveau_bo_validate(struct nouveau_bo *, bool interruptible,
 			 bool no_wait_gpu);
+void nouveau_bo_sync_for_device(struct nouveau_bo *nvbo);
+void nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo);
 
 struct nouveau_vma *
 nouveau_bo_vma_find(struct nouveau_bo *, struct nouveau_vm *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index c90c0dc0afe8..08829a720891 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -896,6 +896,7 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 	spin_lock(&nvbo->bo.bdev->fence_lock);
 	ret = ttm_bo_wait(&nvbo->bo, true, true, no_wait);
 	spin_unlock(&nvbo->bo.bdev->fence_lock);
+	nouveau_bo_sync_for_cpu(nvbo);
 	drm_gem_object_unreference_unlocked(gem);
 	return ret;
 }
@@ -904,6 +905,17 @@ int
 nouveau_gem_ioctl_cpu_fini(struct drm_device *dev, void *data,
 			   struct drm_file *file_priv)
 {
+	struct drm_nouveau_gem_cpu_fini *req = data;
+	struct drm_gem_object *gem;
+	struct nouveau_bo *nvbo;
+
+	gem = drm_gem_object_lookup(dev, file_priv, req->handle);
+	if (!gem)
+		return -ENOENT;
+	nvbo = nouveau_gem_object(gem);
+
+	nouveau_bo_sync_for_device(nvbo);
+	drm_gem_object_unreference_unlocked(gem);
 	return 0;
 }
 
-- 
2.0.0
