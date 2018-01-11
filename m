From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] drm/nouveau: Support DMA fence arrays
Date: Thu, 11 Jan 2018 23:15:46 +0100
Message-ID: <20180111221546.28547-4-thierry.reding@gmail.com>
References: <20180111221546.28547-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111221546.28547-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index d61fcfb97b09..53178b1471e3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -28,6 +28,7 @@
 
 #include <linux/ktime.h>
 #include <linux/hrtimer.h>
+#include <linux/dma-fence-array.h>
 #include <trace/events/dma_fence.h>
 
 #include <nvif/cl826e.h>
@@ -331,9 +332,9 @@ nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
 		return 0;
 }
 
-int
-nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
-		   bool intr)
+static int
+__nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
+		     bool intr)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
 	struct nouveau_channel *prev = NULL;
@@ -356,6 +357,30 @@ nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
 	return ret;
 }
 
+int
+nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
+		   bool intr)
+{
+	int ret = 0;
+
+	if (dma_fence_is_array(fence)) {
+		struct dma_fence_array *array = to_dma_fence_array(fence);
+		unsigned int i;
+
+		for (i = 0; i < array->num_fences; i++) {
+			struct dma_fence *f = array->fences[i];
+
+			ret = __nouveau_fence_sync(f, chan, intr);
+			if (ret < 0)
+				break;
+		}
+	} else {
+		ret = __nouveau_fence_sync(fence, chan, intr);
+	}
+
+	return ret;
+}
+
 void
 nouveau_fence_unref(struct nouveau_fence **pfence)
 {
-- 
2.15.1
