From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] instmem/gk20a: fix crash during error path
Date: Tue, 10 Mar 2015 15:46:08 +0900
Message-ID: <1425969968-25691-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If a memory allocation fails when using the DMA allocator,
gk20a_instobj_dtor_dma() will be called on the failed instmem object.
At this time, node->handle might not be NULL despite the call to
dma_alloc_attrs() having failed. node->cpuaddr is the right member to
check for such a failure, so use it instead.

Reported-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/subdev/instmem/gk20a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index fcba72eb74a3..dd0994d9ebfc 100644
--- a/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -148,7 +148,7 @@ gk20a_instobj_dtor_dma(struct gk20a_instobj_priv *_node)
 	struct gk20a_instmem_priv *priv = (void *)nvkm_instmem(node);
 	struct device *dev = nv_device_base(nv_device(priv));
 
-	if (unlikely(!node->handle))
+	if (unlikely(!node->cpuaddr))
 		return;
 
 	dma_free_attrs(dev, _node->mem->size << PAGE_SHIFT, node->cpuaddr,
-- 
2.3.2
