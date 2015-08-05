From: =?UTF-8?q?Konsta=20H=C3=B6ltt=C3=A4?= <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 4/5] channel timeout using repeated sched timeouts
Date: Wed, 5 Aug 2015 14:27:52 +0300
Message-ID: <1438774073-13870-5-git-send-email-kholtta@nvidia.com>
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

Enable the scheduling timeout error interrupt and set it to a low value
to happen periodically, since it can be missed in HW in certain
conditions. Increment a channel-specific counter in software if the
current channel hasn't advanced. Abort the channel once the timeout
limit is hit (with the periodic granularity). The error notifier is set
to NOUVEAU_GEM_CHANNEL_FIFO_ERROR_IDLE_TIMEOUT when this occurs.

A new KEPLER_SET_CHANNEL_TIMEOUT mthd sets the timeout limit, in
milliseconds. The interrupt granularity is set to 100 ms.

Signed-off-by: Konsta H=C3=B6ltt=C3=A4 <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/include/nvif/class.h     |  8 ++++
 drm/nouveau/nvkm/engine/fifo/gk104.c | 78 ++++++++++++++++++++++++++++=
+++-----
 2 files changed, 75 insertions(+), 11 deletions(-)

diff --git a/drm/nouveau/include/nvif/class.h b/drm/nouveau/include/nvi=
f/class.h
index 381c72d..f9a3647 100644
--- a/drm/nouveau/include/nvif/class.h
+++ b/drm/nouveau/include/nvif/class.h
@@ -620,18 +620,26 @@ struct fermi_a_zbc_depth_v0 {
 	__u8  format;
 	__u8  index;
 	__u8  pad03[5];
 	__u32 ds;
 	__u32 l2;
 };
=20
 #define KEPLER_SET_CHANNEL_PRIORITY                                   =
     0x42 // XXX
+#define KEPLER_SET_CHANNEL_TIMEOUT                                    =
     0x43 // XXX
+
 struct kepler_set_channel_priority_v0 {
 	__u8  version;
 #define KEPLER_SET_CHANNEL_PRIORITY_LOW                               =
     0x00
 #define KEPLER_SET_CHANNEL_PRIORITY_MEDIUM                            =
     0x01
 #define KEPLER_SET_CHANNEL_PRIORITY_HIGH                              =
     0x02
 	__u8 priority;
 	__u8  pad03[6];
 };
=20
+struct kepler_set_channel_timeout_v0 {
+	__u8  version;
+	__u8  pad03[3];
+	__u32 timeout_ms;
+};
+
 #endif
diff --git a/drm/nouveau/nvkm/engine/fifo/gk104.c b/drm/nouveau/nvkm/en=
gine/fifo/gk104.c
index 2bab45e..15360a6 100644
--- a/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -83,18 +83,25 @@ struct gk104_fifo_base {
 struct gk104_fifo_chan {
 	struct nvkm_fifo_chan base;
 	u32 engine;
 	enum {
 		STOPPED,
 		RUNNING,
 		KILLED
 	} state;
+	struct {
+		u32 sum_ms;
+		u32 limit_ms;
+		u32 gpfifo_get;
+	} timeout;
 };
=20
+#define GRFIFO_TIMEOUT_CHECK_PERIOD_MS 100
+
 /*********************************************************************=
**********
  * FIFO channel objects
  *********************************************************************=
*********/
=20
 static void
 gk104_fifo_runlist_update(struct gk104_fifo_priv *priv, u32 engine)
 {
 	struct nvkm_bar *bar =3D nvkm_bar(priv);
@@ -288,16 +295,21 @@ gk104_fifo_chan_ctor(struct nvkm_object *parent, =
struct nvkm_object *engine,
 	nv_wo32(base, 0x94, 0x30000001);
 	nv_wo32(base, 0x9c, 0x00000100);
 	nv_wo32(base, 0xac, 0x0000001f);
 	nv_wo32(base, 0xe8, chan->base.chid);
 	nv_wo32(base, 0xb8, 0xf8000000);
 	nv_wo32(base, 0xf8, 0x10003080); /* 0x002310 */
 	nv_wo32(base, 0xfc, 0x10000010); /* 0x002350 */
 	bar->flush(bar);
+
+	chan->timeout.sum_ms =3D 0;
+	chan->timeout.limit_ms =3D -1;
+	chan->timeout.gpfifo_get =3D 0;
+
 	return 0;
 }
=20
 static int
 gk104_fifo_chan_init(struct nvkm_object *object)
 {
 	struct nvkm_gpuobj *base =3D nv_gpuobj(object->parent);
 	struct gk104_fifo_priv *priv =3D (void *)object->engine;
@@ -379,21 +391,39 @@ gk104_fifo_chan_set_priority(struct nvkm_object *=
object, void *data, u32 size)
 			return -EINVAL;
 		}
 	}
=20
 	return ret;
 }
=20
 int
+gk104_fifo_chan_set_timeout(struct nvkm_object *object, void *data, u3=
2 size)
+{
+	struct gk104_fifo_chan *chan =3D (void *)object;
+	union {
+		struct kepler_set_channel_timeout_v0 v0;
+	} *args =3D data;
+	int ret;
+
+	if (nvif_unpack(args->v0, 0, 0, false)) {
+		chan->timeout.limit_ms =3D args->v0.timeout_ms;
+	}
+
+	return ret;
+}
+
+int
 gk104_fifo_chan_mthd(struct nvkm_object *object, u32 mthd, void *data,=
 u32 size)
 {
 	switch (mthd) {
 	case KEPLER_SET_CHANNEL_PRIORITY:
 		return gk104_fifo_chan_set_priority(object, data, size);
+	case KEPLER_SET_CHANNEL_TIMEOUT:
+		return gk104_fifo_chan_set_timeout(object, data, size);
 	default:
 		break;
 	}
 	return -EINVAL;
 }
=20
 struct nvkm_ofuncs
 gk104_fifo_chan_ofuncs =3D {
@@ -604,61 +634,83 @@ gk104_fifo_intr_bind(struct gk104_fifo_priv *priv=
)
 }
=20
 static const struct nvkm_enum
 gk104_fifo_sched_reason[] =3D {
 	{ 0x0a, "CTXSW_TIMEOUT" },
 	{}
 };
=20
+static bool
+gk104_fifo_update_timeout(struct gk104_fifo_priv *priv,
+		struct gk104_fifo_chan *chan, u32 dt)
+{
+	u32 gpfifo_get =3D nv_rd32(priv, 34);
+	if (gpfifo_get =3D=3D chan->timeout.gpfifo_get) {
+		chan->timeout.sum_ms +=3D dt;
+	} else {
+		chan->timeout.sum_ms =3D dt;
+	}
+
+	chan->timeout.gpfifo_get =3D gpfifo_get;
+
+	return chan->timeout.sum_ms > chan->timeout.limit_ms;
+}
+
 static void
 gk104_fifo_intr_sched_ctxsw(struct gk104_fifo_priv *priv)
 {
 	struct nvkm_engine *engine;
 	struct gk104_fifo_chan *chan;
 	u32 engn;
=20
 	for (engn =3D 0; engn < ARRAY_SIZE(fifo_engine); engn++) {
 		u32 stat =3D nv_rd32(priv, 0x002640 + (engn * 0x04));
 		u32 busy =3D (stat & 0x80000000);
 		u32 next =3D (stat & 0x07ff0000) >> 16;
-		u32 chsw =3D (stat & 0x00008000);
-		u32 save =3D (stat & 0x00004000);
-		u32 load =3D (stat & 0x00002000);
+		u32 cxsw =3D (stat & 0x0000e000) >> 13;
 		u32 prev =3D (stat & 0x000007ff);
-		u32 chid =3D load ? next : prev;
-		(void)save;
+		/* if loading context, take next id */
+		u32 chid =3D cxsw =3D=3D 5 ? next : prev;
=20
-		if (busy && chsw) {
+		nv_error(priv, "ctxsw eng stat: %08x\n", stat);
+		/* doing context switch? */
+		if (busy && (cxsw >=3D 5 && cxsw <=3D 7)) {
 			if (!(chan =3D (void *)priv->base.channel[chid]))
 				continue;
 			if (!(engine =3D gk104_fifo_engine(priv, engn)))
 				continue;
=20
-			nvkm_fifo_eevent(&priv->base, chid,
-					NOUVEAU_GEM_CHANNEL_FIFO_ERROR_IDLE_TIMEOUT);
-
-			gk104_fifo_recover(priv, engine, chan);
+			if (gk104_fifo_update_timeout(priv, chan,
+						GRFIFO_TIMEOUT_CHECK_PERIOD_MS)) {
+				nvkm_fifo_eevent(&priv->base, chid,
+						NOUVEAU_GEM_CHANNEL_FIFO_ERROR_IDLE_TIMEOUT);
+				gk104_fifo_recover(priv, engine, chan);
+			} else {
+				nv_debug(priv, "fifo waiting for ctxsw %d ms on ch %d\n",
+						chan->timeout.sum_ms, chid);
+			}
 		}
 	}
 }
=20
 static void
 gk104_fifo_intr_sched(struct gk104_fifo_priv *priv)
 {
 	u32 intr =3D nv_rd32(priv, 0x00254c);
 	u32 code =3D intr & 0x000000ff;
 	const struct nvkm_enum *en;
 	char enunk[6] =3D "";
=20
 	en =3D nvkm_enum_find(gk104_fifo_sched_reason, code);
 	if (!en)
 		snprintf(enunk, sizeof(enunk), "UNK%02x", code);
=20
-	nv_error(priv, "SCHED_ERROR [ %s ]\n", en ? en->name : enunk);
+	/* this is a normal situation, not so loud */
+	nv_debug(priv, "SCHED_ERROR [ %s ]\n", en ? en->name : enunk);
=20
 	switch (code) {
 	case 0x0a:
 		gk104_fifo_intr_sched_ctxsw(priv);
 		break;
 	default:
 		break;
 	}
@@ -1131,18 +1183,22 @@ gk104_fifo_init(struct nvkm_object *object)
 	/* PBDMA[n].HCE */
 	for (i =3D 0; i < priv->spoon_nr; i++) {
 		nv_wr32(priv, 0x040148 + (i * 0x2000), 0xffffffff); /* INTR */
 		nv_wr32(priv, 0x04014c + (i * 0x2000), 0xffffffff); /* INTREN */
 	}
=20
 	nv_wr32(priv, 0x002254, 0x10000000 | priv->user.bar.offset >> 12);
=20
+	/* enable interrupts */
 	nv_wr32(priv, 0x002100, 0xffffffff);
 	nv_wr32(priv, 0x002140, 0x7fffffff);
+
+	/* engine timeout */
+	nv_wr32(priv, 0x002a0c, 0x80000000 | (1000 * GRFIFO_TIMEOUT_CHECK_PER=
IOD_MS));
 	return 0;
 }
=20
 void
 gk104_fifo_dtor(struct nvkm_object *object)
 {
 	struct gk104_fifo_priv *priv =3D (void *)object;
 	int i;
--=20
2.1.4
