From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau: Split nouveau_fence_sync()
Date: Thu, 11 Jan 2018 23:15:44 +0100
Message-ID: <20180111221546.28547-2-thierry.reding@gmail.com>
References: <20180111221546.28547-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111221546.28547-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Turn nouveau_fence_sync() into a low-level helper that adds fence waits
to the channel command stream. The new nouveau_bo_sync() helper replaces
the previous nouveau_fence_sync() implementation. It passes each of the
buffer object's fences to nouveau_fence_sync() in turn.

This provides more fine-grained control over fences which is needed by
subsequent patches for sync fd support.

Heavily based on work by Lauri Peltonen <lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c      | 38 ++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.h      |  2 +
 drivers/gpu/drm/nouveau/nouveau_display.c |  4 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c   | 68 +++++++------------------------
 drivers/gpu/drm/nouveau/nouveau_fence.h   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c     |  2 +-
 6 files changed, 57 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 41e7f2927443..0285ca4c6235 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -545,6 +545,42 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 					PAGE_SIZE, DMA_FROM_DEVICE);
 }
 
+int
+nouveau_bo_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
+		bool exclusive, bool intr)
+{
+	struct reservation_object *resv = nvbo->bo.resv;
+	struct reservation_object_list *fobj;
+	struct dma_fence *fence;
+	int ret = 0, i;
+
+	if (!exclusive) {
+		ret = reservation_object_reserve_shared(resv);
+		if (ret < 0)
+			return ret;
+	}
+
+	fobj = reservation_object_get_list(resv);
+	fence = reservation_object_get_excl(resv);
+
+	if (fence && (!exclusive || !fobj || !fobj->shared_count))
+		return nouveau_fence_sync(fence, chan, intr);
+
+	if (!exclusive || !fobj)
+		return ret;
+
+	for (i = 0; i < fobj->shared_count && !ret; ++i) {
+		fence = rcu_dereference_protected(fobj->shared[i],
+						  reservation_object_held(resv));
+
+		ret = nouveau_fence_sync(fence, chan, intr);
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+
 int
 nouveau_bo_validate(struct nouveau_bo *nvbo, bool interruptible,
 		    bool no_wait_gpu)
@@ -1114,7 +1150,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
 	}
 
 	mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
-	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
+	ret = nouveau_bo_sync(nouveau_bo(bo), chan, true, intr);
 	if (ret == 0) {
 		ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
 		if (ret == 0) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 7b5cc5c73d20..d2ef12c0e39a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -93,6 +93,8 @@ int  nouveau_bo_validate(struct nouveau_bo *, bool interruptible,
 			 bool no_wait_gpu);
 void nouveau_bo_sync_for_device(struct nouveau_bo *nvbo);
 void nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo);
+int nouveau_bo_sync(struct nouveau_bo *nvbo, struct nouveau_channel *channel,
+		    bool exclusive, bool intr);
 
 /* TODO: submit equivalent to TTM generic API upstream? */
 static inline void __iomem *
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 009713404cc4..526280e9677a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -755,7 +755,7 @@ nouveau_page_flip_emit(struct nouveau_channel *chan,
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 
 	/* Synchronize with the old framebuffer */
-	ret = nouveau_fence_sync(old_bo, chan, false, false);
+	ret = nouveau_bo_sync(old_bo, chan, false, false);
 	if (ret)
 		goto fail;
 
@@ -819,7 +819,7 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		goto fail_unpin;
 
 	/* synchronise rendering channel with the kernel's channel */
-	ret = nouveau_fence_sync(new_bo, chan, false, true);
+	ret = nouveau_bo_sync(new_bo, chan, false, true);
 	if (ret) {
 		ttm_bo_unreserve(&new_bo->bo);
 		goto fail_unpin;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 9c8f3a154d55..d61fcfb97b09 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -332,66 +332,26 @@ nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
 }
 
 int
-nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool exclusive, bool intr)
+nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
+		   bool intr)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct dma_fence *fence;
-	struct reservation_object *resv = nvbo->bo.resv;
-	struct reservation_object_list *fobj;
+	struct nouveau_channel *prev = NULL;
 	struct nouveau_fence *f;
-	int ret = 0, i;
-
-	if (!exclusive) {
-		ret = reservation_object_reserve_shared(resv);
+	bool must_wait = true;
+	int ret = 0;
 
-		if (ret)
-			return ret;
+	f = nouveau_local_fence(fence, chan->drm);
+	if (f) {
+		rcu_read_lock();
+		prev = rcu_dereference(f->channel);
+		if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
+			must_wait = false;
+		rcu_read_unlock();
 	}
 
-	fobj = reservation_object_get_list(resv);
-	fence = reservation_object_get_excl(resv);
-
-	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
-		struct nouveau_channel *prev = NULL;
-		bool must_wait = true;
-
-		f = nouveau_local_fence(fence, chan->drm);
-		if (f) {
-			rcu_read_lock();
-			prev = rcu_dereference(f->channel);
-			if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
-				must_wait = false;
-			rcu_read_unlock();
-		}
-
-		if (must_wait)
-			ret = dma_fence_wait(fence, intr);
-
-		return ret;
-	}
-
-	if (!exclusive || !fobj)
-		return ret;
-
-	for (i = 0; i < fobj->shared_count && !ret; ++i) {
-		struct nouveau_channel *prev = NULL;
-		bool must_wait = true;
-
-		fence = rcu_dereference_protected(fobj->shared[i],
-						reservation_object_held(resv));
-
-		f = nouveau_local_fence(fence, chan->drm);
-		if (f) {
-			rcu_read_lock();
-			prev = rcu_dereference(f->channel);
-			if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
-				must_wait = false;
-			rcu_read_unlock();
-		}
-
-		if (must_wait)
-			ret = dma_fence_wait(fence, intr);
-	}
+	if (must_wait)
+		ret = dma_fence_wait(fence, intr);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 5bd8d30d1657..2c46d9e767ab 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -24,7 +24,7 @@ void nouveau_fence_unref(struct nouveau_fence **);
 int  nouveau_fence_emit(struct nouveau_fence *, struct nouveau_channel *);
 bool nouveau_fence_done(struct nouveau_fence *);
 int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
-int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
+int  nouveau_fence_sync(struct dma_fence *, struct nouveau_channel *, bool intr);
 
 struct nouveau_fence_chan {
 	spinlock_t lock;
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index e72a7e37eb0a..ea5e55551cbd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -494,7 +494,7 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
 			return ret;
 		}
 
-		ret = nouveau_fence_sync(nvbo, chan, !!b->write_domains, true);
+		ret = nouveau_bo_sync(nvbo, chan, !!b->write_domains, true);
 		if (unlikely(ret)) {
 			if (ret != -ERESTARTSYS)
 				NV_PRINTK(err, cli, "fail post-validate sync\n");
-- 
2.15.1
