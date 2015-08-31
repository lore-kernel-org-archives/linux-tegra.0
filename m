From: =?UTF-8?q?Konsta=20H=C3=B6ltt=C3=A4?= <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v2 3/5] gk104: channel priority/timeslice support
Date: Mon, 31 Aug 2015 14:38:33 +0300
Message-ID: <1441021115-28537-4-git-send-email-kholtta@nvidia.com>
References: <1441021115-28537-1-git-send-email-kholtta@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441021115-28537-1-git-send-email-kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Change channel "priorities" by modifying the runlist timeslice value,
thus giving more time for more important jobs before scheduling a
context switch.

A new KEPLER_SET_CHANNEL_PRIORITY mthd on fifo channel objects sets the
priority to low, medium or high.

Disable the channel and preempt it out, change the timeslice, and then
enable the channel again. The shift bit in the timeslice register is
left untouched (i.e., 3) as is the enable bit.

Signed-off-by: Konsta H=C3=B6ltt=C3=A4 <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/include/nvif/class.h     | 10 ++++++
 drm/nouveau/nvkm/engine/fifo/gk104.c | 60 ++++++++++++++++++++++++++++=
++++++++
 2 files changed, 70 insertions(+)

diff --git a/drm/nouveau/include/nvif/class.h b/drm/nouveau/include/nvi=
f/class.h
index 28176e6..72c3b37 100644
--- a/drm/nouveau/include/nvif/class.h
+++ b/drm/nouveau/include/nvif/class.h
@@ -619,9 +619,19 @@ struct fermi_a_zbc_depth_v0 {
 #define FERMI_A_ZBC_DEPTH_V0_FMT_FP32                                 =
     0x01
 	__u8  format;
 	__u8  index;
 	__u8  pad03[5];
 	__u32 ds;
 	__u32 l2;
 };
=20
+#define KEPLER_SET_CHANNEL_PRIORITY                                   =
     0x00
+struct kepler_set_channel_priority_v0 {
+	__u8  version;
+#define KEPLER_SET_CHANNEL_PRIORITY_LOW                               =
     0x00
+#define KEPLER_SET_CHANNEL_PRIORITY_MEDIUM                            =
     0x01
+#define KEPLER_SET_CHANNEL_PRIORITY_HIGH                              =
     0x02
+	__u8 priority;
+	__u8  pad03[6];
+};
+
 #endif
diff --git a/drm/nouveau/nvkm/engine/fifo/gk104.c b/drm/nouveau/nvkm/en=
gine/fifo/gk104.c
index 659c05f..fda726d 100644
--- a/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -333,22 +333,82 @@ gk104_fifo_chan_fini(struct nvkm_object *object, =
bool suspend)
 		gk104_fifo_runlist_update(priv, chan->engine);
 	}
=20
 	gk104_fifo_chan_kick(chan);
 	nv_wr32(priv, 0x800000 + (chid * 8), 0x00000000);
 	return nvkm_fifo_channel_fini(&chan->base, suspend);
 }
=20
+static int
+gk104_fifo_set_runlist_timeslice(struct gk104_fifo_priv *priv,
+		struct gk104_fifo_chan *chan, u8 slice)
+{
+	struct nvkm_gpuobj *base =3D nv_gpuobj(nv_object(chan)->parent);
+	u32 chid =3D chan->base.chid;
+
+	nv_mask(priv, 0x800004 + (chid * 8), 0x00000800, 0x00000800);
+	WARN_ON(gk104_fifo_chan_kick(chan));
+	nv_wo32(base, 0xf8, slice | 0x10003000);
+	nv_mask(priv, 0x800004 + (chid * 8), 0x00000400, 0x00000400);
+	nv_info(chan, "timeslice set to %d for %d\n", slice, chid);
+
+	return 0;
+}
+
+int
+gk104_fifo_chan_set_priority(struct nvkm_object *object, void *data, u=
32 size)
+{
+	struct gk104_fifo_priv *priv =3D (void *)object->engine;
+	struct gk104_fifo_chan *chan =3D (void *)object;
+	union {
+		struct kepler_set_channel_priority_v0 v0;
+	} *args =3D data;
+	int ret;
+	u8 slice;
+
+	if (nvif_unpack(args->v0, 0, 0, false)) {
+		switch (args->v0.priority) {
+		case KEPLER_SET_CHANNEL_PRIORITY_LOW:
+			slice =3D 64; /* << 3 =3D=3D 512 us */
+			break;
+		case KEPLER_SET_CHANNEL_PRIORITY_MEDIUM:
+			slice =3D 128; /* 1 ms */
+			break;
+		case KEPLER_SET_CHANNEL_PRIORITY_HIGH:
+			slice =3D 255; /* 2 ms */
+			break;
+		default:
+			return -EINVAL;
+		}
+		return gk104_fifo_set_runlist_timeslice(priv, chan, slice);
+	}
+
+	return ret;
+}
+
+int
+gk104_fifo_chan_mthd(struct nvkm_object *object, u32 mthd, void *data,=
 u32 size)
+{
+	switch (mthd) {
+	case KEPLER_SET_CHANNEL_PRIORITY:
+		return gk104_fifo_chan_set_priority(object, data, size);
+	default:
+		break;
+	}
+	return -EINVAL;
+}
+
 struct nvkm_ofuncs
 gk104_fifo_chan_ofuncs =3D {
 	.ctor =3D gk104_fifo_chan_ctor,
 	.dtor =3D _nvkm_fifo_channel_dtor,
 	.init =3D gk104_fifo_chan_init,
 	.fini =3D gk104_fifo_chan_fini,
+	.mthd =3D gk104_fifo_chan_mthd,
 	.map  =3D _nvkm_fifo_channel_map,
 	.rd32 =3D _nvkm_fifo_channel_rd32,
 	.wr32 =3D _nvkm_fifo_channel_wr32,
 	.ntfy =3D _nvkm_fifo_channel_ntfy
 };
=20
 static struct nvkm_oclass
 gk104_fifo_sclass[] =3D {
--=20
2.1.4
