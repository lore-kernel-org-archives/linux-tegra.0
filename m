From: =?UTF-8?q?Konsta=20H=C3=B6ltt=C3=A4?= <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 5/5] force fences updated in error conditions
Date: Wed, 5 Aug 2015 14:27:53 +0300
Message-ID: <1438774073-13870-6-git-send-email-kholtta@nvidia.com>
References: <1438774073-13870-1-git-send-email-kholtta@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438774073-13870-1-git-send-email-kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Some error conditions just stop a channel and fences get stuck, so they
either need to be kicked ready by overwriting hw seq numbers (as nvgpu
does) or faked with a sw flag like this. This is just a hack as an
example of what would be needed.

Here, a channel id whose fences should be forced updated is passed
upwards with the uevent response. Normally, this is -1 to match no
channel id, but some error paths fake an update event with an explicit
channel id.

Note: if userspace has some meaningful timeouts on the fences, then the=
y
do finish but without any notification that the channel is broken now
(how do you distinguish a long gpu job from a stuck one?). In many
cases, a channel needs to be shut down completely when it breaks (e.g.,
mmu fault).

Signed-off-by: Konsta H=C3=B6ltt=C3=A4 <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/include/nvif/event.h       |  1 +
 drm/nouveau/include/nvkm/engine/fifo.h |  2 +-
 drm/nouveau/nouveau_fence.c            | 13 ++++++++-----
 drm/nouveau/nvkm/engine/fifo/base.c    |  3 ++-
 drm/nouveau/nvkm/engine/fifo/gf100.c   |  2 +-
 drm/nouveau/nvkm/engine/fifo/gk104.c   |  7 ++++++-
 drm/nouveau/nvkm/engine/fifo/nv04.c    |  2 +-
 7 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drm/nouveau/include/nvif/event.h b/drm/nouveau/include/nvi=
f/event.h
index d148b85..a9ff4ee 100644
--- a/drm/nouveau/include/nvif/event.h
+++ b/drm/nouveau/include/nvif/event.h
@@ -52,16 +52,17 @@ struct nvif_notify_conn_rep_v0 {
 };
=20
 struct nvif_notify_uevent_req {
 	/* nvif_notify_req ... */
 };
=20
 struct nvif_notify_uevent_rep {
 	/* nvif_notify_rep ... */
+	__u32 force_chid;
 };
=20
 struct nvif_notify_eevent_req {
 	/* nvif_notify_req ... */
 	u32 chid;
 };
=20
 struct nvif_notify_eevent_rep {
diff --git a/drm/nouveau/include/nvkm/engine/fifo.h b/drm/nouveau/inclu=
de/nvkm/engine/fifo.h
index cbca477..946eb68 100644
--- a/drm/nouveau/include/nvkm/engine/fifo.h
+++ b/drm/nouveau/include/nvkm/engine/fifo.h
@@ -117,15 +117,15 @@ extern struct nvkm_oclass *gf100_fifo_oclass;
 extern struct nvkm_oclass *gk104_fifo_oclass;
 extern struct nvkm_oclass *gk20a_fifo_oclass;
 extern struct nvkm_oclass *gk208_fifo_oclass;
 extern struct nvkm_oclass *gm204_fifo_oclass;
 extern struct nvkm_oclass *gm20b_fifo_oclass;
=20
 int  nvkm_fifo_uevent_ctor(struct nvkm_object *, void *, u32,
 			   struct nvkm_notify *);
-void nvkm_fifo_uevent(struct nvkm_fifo *);
+void nvkm_fifo_uevent(struct nvkm_fifo *, u32 force_chid);
=20
 void nvkm_fifo_eevent(struct nvkm_fifo *, u32 chid, u32 error);
=20
 void nv04_fifo_intr(struct nvkm_subdev *);
 int  nv04_fifo_context_attach(struct nvkm_object *, struct nvkm_object=
 *);
 #endif
diff --git a/drm/nouveau/nouveau_fence.c b/drm/nouveau/nouveau_fence.c
index 38bccb0..b7d9987 100644
--- a/drm/nouveau/nouveau_fence.c
+++ b/drm/nouveau/nouveau_fence.c
@@ -123,50 +123,53 @@ nouveau_fence_context_put(struct kref *fence_ref)
=20
 void
 nouveau_fence_context_free(struct nouveau_fence_chan *fctx)
 {
 	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
 }
=20
 static int
-nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fenc=
e_chan *fctx)
+nouveau_fence_update(struct nouveau_channel *chan,
+		struct nouveau_fence_chan *fctx, u32 force_chid)
 {
 	struct nouveau_fence *fence;
 	int drop =3D 0;
 	u32 seq =3D fctx->read(chan);
+	bool force =3D force_chid =3D=3D chan->chid;
=20
 	while (!list_empty(&fctx->pending)) {
 		fence =3D list_entry(fctx->pending.next, typeof(*fence), head);
=20
-		if ((int)(seq - fence->base.seqno) < 0)
+		if ((int)(seq - fence->base.seqno) < 0 && !force)
 			break;
=20
 		drop |=3D nouveau_fence_signal(fence);
 	}
=20
 	return drop;
 }
=20
 static int
 nouveau_fence_wait_uevent_handler(struct nvif_notify *notify)
 {
 	struct nouveau_fence_chan *fctx =3D
 		container_of(notify, typeof(*fctx), notify);
+	const struct nvif_notify_uevent_rep *rep =3D notify->data;
 	unsigned long flags;
 	int ret =3D NVIF_NOTIFY_KEEP;
=20
 	spin_lock_irqsave(&fctx->lock, flags);
 	if (!list_empty(&fctx->pending)) {
 		struct nouveau_fence *fence;
 		struct nouveau_channel *chan;
=20
 		fence =3D list_entry(fctx->pending.next, typeof(*fence), head);
 		chan =3D rcu_dereference_protected(fence->channel, lockdep_is_held(&=
fctx->lock));
-		if (nouveau_fence_update(fence->channel, fctx))
+		if (nouveau_fence_update(fence->channel, fctx, rep->force_chid))
 			ret =3D NVIF_NOTIFY_DROP;
 	}
 	spin_unlock_irqrestore(&fctx->lock, flags);
=20
 	return ret;
 }
=20
 void
@@ -278,17 +281,17 @@ nouveau_fence_emit(struct nouveau_fence *fence, s=
truct nouveau_channel *chan)
 	kref_get(&fctx->fence_ref);
=20
 	trace_fence_emit(&fence->base);
 	ret =3D fctx->emit(fence);
 	if (!ret) {
 		fence_get(&fence->base);
 		spin_lock_irq(&fctx->lock);
=20
-		if (nouveau_fence_update(chan, fctx))
+		if (nouveau_fence_update(chan, fctx, -1))
 			nvif_notify_put(&fctx->notify);
=20
 		list_add_tail(&fence->head, &fctx->pending);
 		spin_unlock_irq(&fctx->lock);
 	}
=20
 	return ret;
 }
@@ -302,17 +305,17 @@ nouveau_fence_done(struct nouveau_fence *fence)
 		struct nouveau_channel *chan;
 		unsigned long flags;
=20
 		if (test_bit(FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
 			return true;
=20
 		spin_lock_irqsave(&fctx->lock, flags);
 		chan =3D rcu_dereference_protected(fence->channel, lockdep_is_held(&=
fctx->lock));
-		if (chan && nouveau_fence_update(chan, fctx))
+		if (chan && nouveau_fence_update(chan, fctx, -1))
 			nvif_notify_put(&fctx->notify);
 		spin_unlock_irqrestore(&fctx->lock, flags);
 	}
 	return fence_is_signaled(&fence->base);
 }
=20
 static long
 nouveau_fence_wait_legacy(struct fence *f, bool intr, long wait)
diff --git a/drm/nouveau/nvkm/engine/fifo/base.c b/drm/nouveau/nvkm/eng=
ine/fifo/base.c
index df9ee37..535cc87 100644
--- a/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drm/nouveau/nvkm/engine/fifo/base.c
@@ -184,19 +184,20 @@ nvkm_fifo_uevent_ctor(struct nvkm_object *object,=
 void *data, u32 size,
 		notify->types =3D 1;
 		notify->index =3D 0;
 	}
=20
 	return ret;
 }
=20
 void
-nvkm_fifo_uevent(struct nvkm_fifo *fifo)
+nvkm_fifo_uevent(struct nvkm_fifo *fifo, u32 force_chid)
 {
 	struct nvif_notify_uevent_rep rep =3D {
+		.force_chid =3D force_chid
 	};
 	nvkm_event_send(&fifo->uevent, 1, 0, &rep, sizeof(rep));
 }
=20
 static int
 nvkm_fifo_eevent_ctor(struct nvkm_object *object, void *data, u32 size=
,
 		      struct nvkm_notify *notify)
 {
diff --git a/drm/nouveau/nvkm/engine/fifo/gf100.c b/drm/nouveau/nvkm/en=
gine/fifo/gf100.c
index b745252..ca86dfe 100644
--- a/drm/nouveau/nvkm/engine/fifo/gf100.c
+++ b/drm/nouveau/nvkm/engine/fifo/gf100.c
@@ -732,17 +732,17 @@ gf100_fifo_intr_engine_unit(struct gf100_fifo_pri=
v *priv, int engn)
 	u32 inte =3D nv_rd32(priv, 0x002628);
 	u32 unkn;
=20
 	nv_wr32(priv, 0x0025a8 + (engn * 0x04), intr);
=20
 	for (unkn =3D 0; unkn < 8; unkn++) {
 		u32 ints =3D (intr >> (unkn * 0x04)) & inte;
 		if (ints & 0x1) {
-			nvkm_fifo_uevent(&priv->base);
+			nvkm_fifo_uevent(&priv->base, -1);
 			ints &=3D ~1;
 		}
 		if (ints) {
 			nv_error(priv, "ENGINE %d %d %01x", engn, unkn, ints);
 			nv_mask(priv, 0x002628, ints, 0);
 		}
 	}
 }
diff --git a/drm/nouveau/nvkm/engine/fifo/gk104.c b/drm/nouveau/nvkm/en=
gine/fifo/gk104.c
index 15360a6..2ad5486 100644
--- a/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -902,16 +902,18 @@ gk104_fifo_intr_fault(struct gk104_fifo_priv *pri=
v, int unit)
 	object =3D engctx;
 	while (object) {
 		switch (nv_mclass(object)) {
 		case KEPLER_CHANNEL_GPFIFO_A:
 		case MAXWELL_CHANNEL_GPFIFO_A:
 			nvkm_fifo_eevent(&priv->base,
 					((struct nvkm_fifo_chan*)object)->chid,
 					NOUVEAU_GEM_CHANNEL_FIFO_ERROR_MMU_ERR_FLT);
+			nvkm_fifo_uevent(&priv->base,
+					((struct nvkm_fifo_chan*)object)->chid);
 			gk104_fifo_recover(priv, engine, (void *)object);
 			break;
 		}
 		object =3D object->parent;
 	}
=20
 	nvkm_engctx_put(engctx);
 }
@@ -972,18 +974,21 @@ gk104_fifo_intr_pbdma_0(struct gk104_fifo_priv *p=
riv, int unit)
 		nv_error(priv, "PBDMA%d:", unit);
 		nvkm_bitfield_print(gk104_fifo_pbdma_intr_0, show);
 		pr_cont("\n");
 		nv_error(priv,
 			 "PBDMA%d: ch %d [%s] subc %d mthd 0x%04x data 0x%08x\n",
 			 unit, chid,
 			 nvkm_client_name_for_fifo_chid(&priv->base, chid),
 			 subc, mthd, data);
+
 		nvkm_fifo_eevent(&priv->base, chid,
 				NOUVEAU_GEM_CHANNEL_PBDMA_ERROR);
+
+		nvkm_fifo_uevent(&priv->base, chid);
 	}
=20
 	nv_wr32(priv, 0x040108 + (unit * 0x2000), stat);
 }
=20
 static const struct nvkm_bitfield gk104_fifo_pbdma_intr_1[] =3D {
 	{ 0x00000001, "HCE_RE_ILLEGAL_OP" },
 	{ 0x00000002, "HCE_RE_ALIGNB" },
@@ -1024,17 +1029,17 @@ gk104_fifo_intr_runlist(struct gk104_fifo_priv =
*priv)
 		nv_wr32(priv, 0x002a00, 1 << engn);
 		mask &=3D ~(1 << engn);
 	}
 }
=20
 static void
 gk104_fifo_intr_engine(struct gk104_fifo_priv *priv)
 {
-	nvkm_fifo_uevent(&priv->base);
+	nvkm_fifo_uevent(&priv->base, -1);
 }
=20
 static void
 gk104_fifo_intr(struct nvkm_subdev *subdev)
 {
 	struct gk104_fifo_priv *priv =3D (void *)subdev;
 	u32 mask =3D nv_rd32(priv, 0x002140);
 	u32 stat =3D nv_rd32(priv, 0x002100) & mask;
diff --git a/drm/nouveau/nvkm/engine/fifo/nv04.c b/drm/nouveau/nvkm/eng=
ine/fifo/nv04.c
index 043e429..1749614 100644
--- a/drm/nouveau/nvkm/engine/fifo/nv04.c
+++ b/drm/nouveau/nvkm/engine/fifo/nv04.c
@@ -536,17 +536,17 @@ nv04_fifo_intr(struct nvkm_subdev *subdev)
 	if (device->card_type =3D=3D NV_50) {
 		if (stat & 0x00000010) {
 			stat &=3D ~0x00000010;
 			nv_wr32(priv, 0x002100, 0x00000010);
 		}
=20
 		if (stat & 0x40000000) {
 			nv_wr32(priv, 0x002100, 0x40000000);
-			nvkm_fifo_uevent(&priv->base);
+			nvkm_fifo_uevent(&priv->base, -1);
 			stat &=3D ~0x40000000;
 		}
 	}
=20
 	if (stat) {
 		nv_warn(priv, "unknown intr 0x%08x\n", stat);
 		nv_mask(priv, NV03_PFIFO_INTR_EN_0, stat, 0x00000000);
 		nv_wr32(priv, NV03_PFIFO_INTR_0, stat);
--=20
2.1.4
