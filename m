From: =?UTF-8?q?Konsta=20H=C3=B6ltt=C3=A4?= <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v2 1/5] notify channel errors to userspace
Date: Mon, 31 Aug 2015 14:38:31 +0300
Message-ID: <1441021115-28537-2-git-send-email-kholtta@nvidia.com>
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

Let userspace know about some specific types of errors via a shared
buffer registered with a new ioctl, NOUVEAU_GEM_SET_ERROR_NOTIFIER.
Once set, the notifier buffer is used until the channel is destroyed.
The exceptional per-channel error conditions are signaled upwards from
the nvkm layer via the event/notify mechanism and written to the buffer
which holds the latest error occurred, readable from userspace.

Some error situations render a channel completely stuck, which may
require even discarding and reinitializing it or the gpu completely.
Once a specific type of error happens, no others are expected until
recovery. Passing the error to userspace in a shared buffer enables the
graphics driver to periodically check in a light-weight way if anything
went wrong (typically, after a submit); e.g., the GL robustness
extension requires to detect that the context has dead.

The notifier currently signals idle timeout, sw notify, mmu fault and
illegal pbdma error conditions.

Signed-off-by: Konsta H=C3=B6ltt=C3=A4 <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/include/nvif/class.h       |  2 +
 drm/nouveau/include/nvif/event.h       | 11 ++++
 drm/nouveau/include/nvkm/engine/fifo.h |  3 ++
 drm/nouveau/nouveau_chan.c             | 95 ++++++++++++++++++++++++++=
++++++++
 drm/nouveau/nouveau_chan.h             | 10 ++++
 drm/nouveau/nouveau_drm.c              |  1 +
 drm/nouveau/nouveau_gem.c              | 29 +++++++++++
 drm/nouveau/nouveau_gem.h              |  2 +
 drm/nouveau/nvkm/engine/fifo/base.c    | 53 +++++++++++++++++++
 drm/nouveau/nvkm/engine/fifo/gk104.c   | 13 +++++
 drm/nouveau/nvkm/engine/gr/gf100.c     |  5 ++
 drm/nouveau/uapi/drm/nouveau_drm.h     | 13 +++++
 12 files changed, 237 insertions(+)

diff --git a/drm/nouveau/include/nvif/class.h b/drm/nouveau/include/nvi=
f/class.h
index d90e207..28176e6 100644
--- a/drm/nouveau/include/nvif/class.h
+++ b/drm/nouveau/include/nvif/class.h
@@ -410,16 +410,18 @@ struct kepler_channel_gpfifo_a_v0 {
 	__u8  engine;
 	__u16 chid;
 	__u8  pad04[4];
 	__u32 pushbuf;
 	__u32 ilength;
 	__u64 ioffset;
 };
=20
+#define CHANNEL_GPFIFO_ERROR_NOTIFIER_EEVENT                          =
     0x01
+
 /*********************************************************************=
**********
  * legacy display
  *********************************************************************=
*********/
=20
 #define NV04_DISP_NTFY_VBLANK                                         =
     0x00
 #define NV04_DISP_NTFY_CONN                                           =
     0x01
=20
 struct nv04_disp_mthd_v0 {
diff --git a/drm/nouveau/include/nvif/event.h b/drm/nouveau/include/nvi=
f/event.h
index 2176449..d148b85 100644
--- a/drm/nouveau/include/nvif/event.h
+++ b/drm/nouveau/include/nvif/event.h
@@ -54,9 +54,20 @@ struct nvif_notify_conn_rep_v0 {
 struct nvif_notify_uevent_req {
 	/* nvif_notify_req ... */
 };
=20
 struct nvif_notify_uevent_rep {
 	/* nvif_notify_rep ... */
 };
=20
+struct nvif_notify_eevent_req {
+	/* nvif_notify_req ... */
+	u32 chid;
+};
+
+struct nvif_notify_eevent_rep {
+	/* nvif_notify_rep ... */
+	u32 error;
+	u32 chid;
+};
+
 #endif
diff --git a/drm/nouveau/include/nvkm/engine/fifo.h b/drm/nouveau/inclu=
de/nvkm/engine/fifo.h
index 9100b80..cbca477 100644
--- a/drm/nouveau/include/nvkm/engine/fifo.h
+++ b/drm/nouveau/include/nvkm/engine/fifo.h
@@ -67,16 +67,17 @@ struct nvkm_fifo_base {
 #include <core/engine.h>
 #include <core/event.h>
=20
 struct nvkm_fifo {
 	struct nvkm_engine base;
=20
 	struct nvkm_event cevent; /* channel creation event */
 	struct nvkm_event uevent; /* async user trigger */
+	struct nvkm_event eevent; /* error notifier */
=20
 	struct nvkm_object **channel;
 	spinlock_t lock;
 	u16 min;
 	u16 max;
=20
 	int  (*chid)(struct nvkm_fifo *, struct nvkm_object *);
 	void (*pause)(struct nvkm_fifo *, unsigned long *);
@@ -118,11 +119,13 @@ extern struct nvkm_oclass *gk20a_fifo_oclass;
 extern struct nvkm_oclass *gk208_fifo_oclass;
 extern struct nvkm_oclass *gm204_fifo_oclass;
 extern struct nvkm_oclass *gm20b_fifo_oclass;
=20
 int  nvkm_fifo_uevent_ctor(struct nvkm_object *, void *, u32,
 			   struct nvkm_notify *);
 void nvkm_fifo_uevent(struct nvkm_fifo *);
=20
+void nvkm_fifo_eevent(struct nvkm_fifo *, u32 chid, u32 error);
+
 void nv04_fifo_intr(struct nvkm_subdev *);
 int  nv04_fifo_context_attach(struct nvkm_object *, struct nvkm_object=
 *);
 #endif
diff --git a/drm/nouveau/nouveau_chan.c b/drm/nouveau/nouveau_chan.c
index 0589bab..ff37f5f 100644
--- a/drm/nouveau/nouveau_chan.c
+++ b/drm/nouveau/nouveau_chan.c
@@ -19,26 +19,29 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
  * OTHER DEALINGS IN THE SOFTWARE.
  *
  * Authors: Ben Skeggs
  */
=20
 #include <nvif/os.h>
 #include <nvif/class.h>
+#include <nvif/event.h>
+#include <nvif/notify.h>
=20
 /*XXX*/
 #include <core/client.h>
=20
 #include "nouveau_drm.h"
 #include "nouveau_dma.h"
 #include "nouveau_bo.h"
 #include "nouveau_chan.h"
 #include "nouveau_fence.h"
 #include "nouveau_abi16.h"
+#include "nouveau_gem.h"
=20
 MODULE_PARM_DESC(vram_pushbuf, "Create DMA push buffers in VRAM");
 int nouveau_vram_pushbuf;
 module_param_named(vram_pushbuf, nouveau_vram_pushbuf, int, 0400);
=20
 int
 nouveau_channel_idle(struct nouveau_channel *chan)
 {
@@ -72,16 +75,22 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		nvif_object_fini(&chan->vram);
 		nvif_object_ref(NULL, &chan->object);
 		nvif_object_fini(&chan->push.ctxdma);
 		nouveau_bo_vma_del(chan->push.buffer, &chan->push.vma);
 		nouveau_bo_unmap(chan->push.buffer);
 		if (chan->push.buffer && chan->push.buffer->pin_refcnt)
 			nouveau_bo_unpin(chan->push.buffer);
 		nouveau_bo_ref(NULL, &chan->push.buffer);
+		if (chan->error_notifier.buffer) {
+			nouveau_bo_unmap(chan->error_notifier.buffer);
+			drm_gem_object_unreference_unlocked(
+					&chan->error_notifier.buffer->gem);
+		}
+		nvif_notify_fini(&chan->error_notifier.notify);
 		nvif_device_ref(NULL, &chan->device);
 		kfree(chan);
 	}
 	*pchan =3D NULL;
 }
=20
 static int
 nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *devi=
ce,
@@ -272,16 +281,89 @@ nouveau_channel_dma(struct nouveau_drm *drm, stru=
ct nvif_device *device,
 			return ret;
 		}
 	} while (ret && *oclass);
=20
 	nouveau_channel_del(pchan);
 	return ret;
 }
=20
+static void
+nouveau_channel_set_error_notifier(struct nouveau_channel *chan, u32 e=
rror)
+{
+	struct nouveau_cli *cli =3D (void *)nvif_client(chan->object);
+	struct nouveau_bo *nvbo =3D chan->error_notifier.buffer;
+	u32 off =3D chan->error_notifier.offset / sizeof(u32);
+	u64 nsec;
+
+	if (!nvbo)
+		return;
+
+	nsec =3D ktime_to_ns(ktime_get_real());
+
+	nouveau_bo_wr32(nvbo, off + 0, nsec);
+	nouveau_bo_wr32(nvbo, off + 1, nsec >> 32);
+	nouveau_bo_wr32(nvbo, off + 2, error);
+	nouveau_bo_wr32(nvbo, off + 3, 0xffffffff);
+
+	NV_PRINTK(error, cli, "error notifier set to %d for ch %d\n",
+			error, chan->chid);
+}
+
+int
+nouveau_channel_init_error_notifier(struct nouveau_channel *chan,
+		struct drm_file *file, u32 handle, u32 offset)
+{
+	struct drm_gem_object *gem;
+	struct nouveau_bo *nvbo;
+	int ret;
+
+	gem =3D drm_gem_object_lookup(chan->drm->dev, file, handle);
+	if (!gem)
+		return -ENOENT;
+
+	nvbo =3D nouveau_gem_object(gem);
+
+	ret =3D nouveau_bo_map(nvbo);
+	if (ret) {
+		drm_gem_object_unreference_unlocked(gem);
+		return ret;
+	}
+
+	/* drop old ref on reassign */
+	if (chan->error_notifier.buffer) {
+		nouveau_bo_unmap(chan->error_notifier.buffer);
+		drm_gem_object_unreference_unlocked(
+				&chan->error_notifier.buffer->gem);
+	}
+
+	/* the gem reference held until channel deletion keeps this alive */
+	chan->error_notifier.buffer =3D nvbo;
+	chan->error_notifier.offset =3D offset;
+
+	/* initialize to a no-error status */
+	nouveau_bo_wr32(nvbo, offset / sizeof(u32) + 0, 0);
+	nouveau_bo_wr32(nvbo, offset / sizeof(u32) + 1, 0);
+	nouveau_bo_wr32(nvbo, offset / sizeof(u32) + 2, 0);
+	nouveau_bo_wr32(nvbo, offset / sizeof(u32) + 3, 0);
+
+	return 0;
+}
+
+static int
+nouveau_chan_eevent_handler(struct nvif_notify *notify)
+{
+	struct nouveau_channel *chan =3D
+		container_of(notify, typeof(*chan), error_notifier.notify);
+	const struct nvif_notify_eevent_rep *rep =3D notify->data;
+
+	WARN_ON(rep->chid !=3D chan->chid);
+	nouveau_channel_set_error_notifier(chan, rep->error);
+	return NVIF_NOTIFY_KEEP;
+}
 static int
 nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 {
 	struct nvif_device *device =3D chan->device;
 	struct nouveau_cli *cli =3D (void *)nvif_client(&device->base);
 	struct nvkm_mmu *mmu =3D nvxx_mmu(device);
 	struct nvkm_sw_chan *swch;
 	struct nv_dma_v0 args =3D {};
@@ -381,16 +463,29 @@ nouveau_channel_init(struct nouveau_channel *chan=
, u32 vram, u32 gart)
 		if (ret)
 			return ret;
=20
 		BEGIN_NV04(chan, NvSubSw, 0x0000, 1);
 		OUT_RING  (chan, chan->nvsw.handle);
 		FIRE_RING (chan);
 	}
=20
+	/* error code events on why we're stuck/broken */
+	ret =3D nvif_notify_init(chan->object, NULL,
+			 nouveau_chan_eevent_handler, false,
+			 CHANNEL_GPFIFO_ERROR_NOTIFIER_EEVENT,
+			 &(struct nvif_notify_eevent_req) { .chid =3D chan->chid },
+			 sizeof(struct nvif_notify_eevent_req),
+			 sizeof(struct nvif_notify_eevent_rep),
+			 &chan->error_notifier.notify);
+	if (WARN_ON(ret))
+		return ret;
+	/* fini() does one put() */
+	nvif_notify_get(&chan->error_notifier.notify);
+
 	/* initialise synchronisation */
 	return nouveau_fence(chan->drm)->context_new(chan);
 }
=20
 int
 nouveau_channel_new(struct nouveau_drm *drm, struct nvif_device *devic=
e,
 		    u32 handle, u32 arg0, u32 arg1,
 		    struct nouveau_channel **pchan)
diff --git a/drm/nouveau/nouveau_chan.h b/drm/nouveau/nouveau_chan.h
index 8b3640f..730ddba 100644
--- a/drm/nouveau/nouveau_chan.h
+++ b/drm/nouveau/nouveau_chan.h
@@ -33,20 +33,30 @@ struct nouveau_channel {
 		int ib_free;
 		int ib_put;
 	} dma;
 	u32 user_get_hi;
 	u32 user_get;
 	u32 user_put;
=20
 	struct nvif_object *object;
+
+	struct {
+		struct nouveau_bo *buffer;
+		u32 offset;
+		struct nvif_notify notify;
+	} error_notifier;
 };
=20
=20
 int  nouveau_channel_new(struct nouveau_drm *, struct nvif_device *,
 			 u32 handle, u32 arg0, u32 arg1,
 			 struct nouveau_channel **);
 void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
+struct drm_file;
+int nouveau_channel_init_error_notifier(struct nouveau_channel *chan,
+					struct drm_file *file,
+					u32 handle, u32 offset);
=20
 extern int nouveau_vram_pushbuf;
=20
 #endif
diff --git a/drm/nouveau/nouveau_drm.c b/drm/nouveau/nouveau_drm.c
index 7d1297e..e3e6441 100644
--- a/drm/nouveau/nouveau_drm.c
+++ b/drm/nouveau/nouveau_drm.c
@@ -898,16 +898,17 @@ nouveau_ioctls[] =3D {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_NEW, nouveau_gem_ioctl_new, DRM_UNLOCKE=
D|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_PUSHBUF, nouveau_gem_ioctl_pushbuf, DRM=
_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, D=
RM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, D=
RM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_UNLOC=
KED|DRM_AUTH|DRM_RENDER_ALLOW),
 	/* Staging ioctls */
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_SET_TILING, nouveau_gem_ioctl_set_tilin=
g, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_PUSHBUF_2, nouveau_gem_ioctl_pushbuf_2,=
 DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_SET_ERROR_NOTIFIER, nouveau_gem_ioctl_s=
et_error_notifier, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 };
=20
 long
 nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long a=
rg)
 {
 	struct drm_file *filp =3D file->private_data;
 	struct drm_device *dev =3D filp->minor->dev;
 	long ret;
diff --git a/drm/nouveau/nouveau_gem.c b/drm/nouveau/nouveau_gem.c
index 884ab83..f8373cb 100644
--- a/drm/nouveau/nouveau_gem.c
+++ b/drm/nouveau/nouveau_gem.c
@@ -1032,16 +1032,45 @@ out_next:
 			      (chan->push.vma.offset + ((chan->dma.cur + 2) << 2));
 		req->suffix1 =3D 0x00000000;
 	}
=20
 	return nouveau_abi16_put(abi16, ret);
 }
=20
 int
+nouveau_gem_ioctl_set_error_notifier(struct drm_device *dev, void *dat=
a,
+                            struct drm_file *file_priv)
+{
+	struct nouveau_abi16 *abi16 =3D nouveau_abi16_get(file_priv, dev);
+	struct drm_nouveau_gem_set_error_notifier *req =3D data;
+	struct nouveau_abi16_chan *abi16_ch;
+	struct nouveau_channel *chan =3D NULL;
+	int ret =3D 0;
+
+	if (unlikely(!abi16))
+		return -ENOMEM;
+
+	list_for_each_entry(abi16_ch, &abi16->channels, head) {
+		if (abi16_ch->chan->object->handle
+				=3D=3D (NVDRM_CHAN | req->channel)) {
+			chan =3D abi16_ch->chan;
+			break;
+		}
+	}
+	if (!chan)
+		return nouveau_abi16_put(abi16, -ENOENT);
+
+	ret =3D nouveau_channel_init_error_notifier(chan, file_priv,
+			req->buffer, req->offset);
+
+	return nouveau_abi16_put(abi16, ret);
+}
+
+int
 nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 			   struct drm_file *file_priv)
 {
 	struct drm_nouveau_gem_cpu_prep *req =3D data;
 	struct drm_gem_object *gem;
 	struct nouveau_bo *nvbo;
 	bool no_wait =3D !!(req->flags & NOUVEAU_GEM_CPU_PREP_NOWAIT);
 	bool write =3D !!(req->flags & NOUVEAU_GEM_CPU_PREP_WRITE);
diff --git a/drm/nouveau/nouveau_gem.h b/drm/nouveau/nouveau_gem.h
index 9e4323f..423ea5a 100644
--- a/drm/nouveau/nouveau_gem.h
+++ b/drm/nouveau/nouveau_gem.h
@@ -26,16 +26,18 @@ extern void nouveau_gem_object_close(struct drm_gem=
_object *,
 extern int nouveau_gem_ioctl_set_tiling(struct drm_device *, void *,
 					struct drm_file *);
 extern int nouveau_gem_ioctl_new(struct drm_device *, void *,
 				 struct drm_file *);
 extern int nouveau_gem_ioctl_pushbuf(struct drm_device *, void *,
 				     struct drm_file *);
 extern int nouveau_gem_ioctl_pushbuf_2(struct drm_device *, void *,
 				       struct drm_file *);
+extern int nouveau_gem_ioctl_set_error_notifier(struct drm_device *, v=
oid *,
+				       struct drm_file *);
 extern int nouveau_gem_ioctl_cpu_prep(struct drm_device *, void *,
 				      struct drm_file *);
 extern int nouveau_gem_ioctl_cpu_fini(struct drm_device *, void *,
 				      struct drm_file *);
 extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 				  struct drm_file *);
=20
 extern int nouveau_gem_prime_pin(struct drm_gem_object *);
diff --git a/drm/nouveau/nvkm/engine/fifo/base.c b/drm/nouveau/nvkm/eng=
ine/fifo/base.c
index fa223f8..a5dc6c9 100644
--- a/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drm/nouveau/nvkm/engine/fifo/base.c
@@ -191,28 +191,76 @@ nvkm_fifo_uevent_ctor(struct nvkm_object *object,=
 void *data, u32 size,
 void
 nvkm_fifo_uevent(struct nvkm_fifo *fifo)
 {
 	struct nvif_notify_uevent_rep rep =3D {
 	};
 	nvkm_event_send(&fifo->uevent, 1, 0, &rep, sizeof(rep));
 }
=20
+static int
+nvkm_fifo_eevent_ctor(struct nvkm_object *object, void *data, u32 size=
,
+		      struct nvkm_notify *notify)
+{
+	union {
+		struct nvif_notify_eevent_req req;
+	} *req =3D data;
+	int ret;
+
+	if (nvif_unvers(req->req)) {
+		notify->size  =3D sizeof(struct nvif_notify_eevent_rep);
+		notify->types =3D 1;
+		notify->index =3D req->req.chid;
+	}
+
+	return ret;
+}
+
+static void
+gk104_fifo_eevent_init(struct nvkm_event *event, int type, int index)
+{
+}
+
+static void
+gk104_fifo_eevent_fini(struct nvkm_event *event, int type, int index)
+{
+}
+
+static const struct nvkm_event_func
+nvkm_fifo_eevent_func =3D {
+	.ctor =3D nvkm_fifo_eevent_ctor,
+	.init =3D gk104_fifo_eevent_init,
+	.fini =3D gk104_fifo_eevent_fini,
+};
+
+void
+nvkm_fifo_eevent(struct nvkm_fifo *fifo, u32 chid, u32 error)
+{
+	struct nvif_notify_eevent_rep rep =3D {
+		.error =3D error,
+		.chid =3D chid
+	};
+	nvkm_event_send(&fifo->eevent, 1, chid, &rep, sizeof(rep));
+}
+
 int
 _nvkm_fifo_channel_ntfy(struct nvkm_object *object, u32 type,
 			struct nvkm_event **event)
 {
 	struct nvkm_fifo *fifo =3D (void *)object->engine;
 	switch (type) {
 	case G82_CHANNEL_DMA_V0_NTFY_UEVENT:
 		if (nv_mclass(object) >=3D G82_CHANNEL_DMA) {
 			*event =3D &fifo->uevent;
 			return 0;
 		}
 		break;
+	case CHANNEL_GPFIFO_ERROR_NOTIFIER_EEVENT:
+		*event =3D &fifo->eevent;
+		return 0;
 	default:
 		break;
 	}
 	return -EINVAL;
 }
=20
 static int
 nvkm_fifo_chid(struct nvkm_fifo *priv, struct nvkm_object *object)
@@ -242,16 +290,17 @@ nvkm_client_name_for_fifo_chid(struct nvkm_fifo *=
fifo, u32 chid)
=20
 	return nvkm_client_name(chan);
 }
=20
 void
 nvkm_fifo_destroy(struct nvkm_fifo *priv)
 {
 	kfree(priv->channel);
+	nvkm_event_fini(&priv->eevent);
 	nvkm_event_fini(&priv->uevent);
 	nvkm_event_fini(&priv->cevent);
 	nvkm_engine_destroy(&priv->base);
 }
=20
 int
 nvkm_fifo_create_(struct nvkm_object *parent, struct nvkm_object *engi=
ne,
 		  struct nvkm_oclass *oclass,
@@ -271,12 +320,16 @@ nvkm_fifo_create_(struct nvkm_object *parent, str=
uct nvkm_object *engine,
 	priv->channel =3D kzalloc(sizeof(*priv->channel) * (max + 1), GFP_KER=
NEL);
 	if (!priv->channel)
 		return -ENOMEM;
=20
 	ret =3D nvkm_event_init(&nvkm_fifo_event_func, 1, 1, &priv->cevent);
 	if (ret)
 		return ret;
=20
+	ret =3D nvkm_event_init(&nvkm_fifo_eevent_func, 1, max + 1, &priv->ee=
vent);
+	if (ret)
+		return ret;
+
 	priv->chid =3D nvkm_fifo_chid;
 	spin_lock_init(&priv->lock);
 	return 0;
 }
diff --git a/drm/nouveau/nvkm/engine/fifo/gk104.c b/drm/nouveau/nvkm/en=
gine/fifo/gk104.c
index 52c22b0..659c05f 100644
--- a/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -30,16 +30,18 @@
 #include <subdev/bar.h>
 #include <subdev/fb.h>
 #include <subdev/mmu.h>
 #include <subdev/timer.h>
=20
 #include <nvif/class.h>
 #include <nvif/unpack.h>
=20
+#include "nouveau_drm.h"
+
 #define _(a,b) { (a), ((1ULL << (a)) | (b)) }
 static const struct {
 	u64 subdev;
 	u64 mask;
 } fifo_engine[] =3D {
 	_(NVDEV_ENGINE_GR      , (1ULL << NVDEV_ENGINE_SW) |
 				 (1ULL << NVDEV_ENGINE_CE2)),
 	_(NVDEV_ENGINE_MSPDEC  , 0),
@@ -567,16 +569,20 @@ gk104_fifo_intr_sched_ctxsw(struct gk104_fifo_pri=
v *priv)
 		u32 chid =3D load ? next : prev;
 		(void)save;
=20
 		if (busy && chsw) {
 			if (!(chan =3D (void *)priv->base.channel[chid]))
 				continue;
 			if (!(engine =3D gk104_fifo_engine(priv, engn)))
 				continue;
+
+			nvkm_fifo_eevent(&priv->base, chid,
+					NOUVEAU_GEM_CHANNEL_FIFO_ERROR_IDLE_TIMEOUT);
+
 			gk104_fifo_recover(priv, engine, chan);
 		}
 	}
 }
=20
 static void
 gk104_fifo_intr_sched(struct gk104_fifo_priv *priv)
 {
@@ -783,16 +789,19 @@ gk104_fifo_intr_fault(struct gk104_fifo_priv *pri=
v, int unit)
 		 ec ? ec->name : ecunk, (u64)inst << 12,
 		 nvkm_client_name(engctx));
=20
 	object =3D engctx;
 	while (object) {
 		switch (nv_mclass(object)) {
 		case KEPLER_CHANNEL_GPFIFO_A:
 		case MAXWELL_CHANNEL_GPFIFO_A:
+			nvkm_fifo_eevent(&priv->base,
+					((struct nvkm_fifo_chan*)object)->chid,
+					NOUVEAU_GEM_CHANNEL_FIFO_ERROR_MMU_ERR_FLT);
 			gk104_fifo_recover(priv, engine, (void *)object);
 			break;
 		}
 		object =3D object->parent;
 	}
=20
 	nvkm_engctx_put(engctx);
 }
@@ -853,16 +862,18 @@ gk104_fifo_intr_pbdma_0(struct gk104_fifo_priv *p=
riv, int unit)
 		nv_error(priv, "PBDMA%d:", unit);
 		nvkm_bitfield_print(gk104_fifo_pbdma_intr_0, show);
 		pr_cont("\n");
 		nv_error(priv,
 			 "PBDMA%d: ch %d [%s] subc %d mthd 0x%04x data 0x%08x\n",
 			 unit, chid,
 			 nvkm_client_name_for_fifo_chid(&priv->base, chid),
 			 subc, mthd, data);
+		nvkm_fifo_eevent(&priv->base, chid,
+				NOUVEAU_GEM_CHANNEL_PBDMA_ERROR);
 	}
=20
 	nv_wr32(priv, 0x040108 + (unit * 0x2000), stat);
 }
=20
 static const struct nvkm_bitfield gk104_fifo_pbdma_intr_1[] =3D {
 	{ 0x00000001, "HCE_RE_ILLEGAL_OP" },
 	{ 0x00000002, "HCE_RE_ALIGNB" },
@@ -881,16 +892,18 @@ gk104_fifo_intr_pbdma_1(struct gk104_fifo_priv *p=
riv, int unit)
=20
 	if (stat) {
 		nv_error(priv, "PBDMA%d:", unit);
 		nvkm_bitfield_print(gk104_fifo_pbdma_intr_1, stat);
 		pr_cont("\n");
 		nv_error(priv, "PBDMA%d: ch %d %08x %08x\n", unit, chid,
 			 nv_rd32(priv, 0x040150 + (unit * 0x2000)),
 			 nv_rd32(priv, 0x040154 + (unit * 0x2000)));
+		nvkm_fifo_eevent(&priv->base, chid,
+				NOUVEAU_GEM_CHANNEL_PBDMA_ERROR);
 	}
=20
 	nv_wr32(priv, 0x040148 + (unit * 0x2000), stat);
 }
=20
 static void
 gk104_fifo_intr_runlist(struct gk104_fifo_priv *priv)
 {
diff --git a/drm/nouveau/nvkm/engine/gr/gf100.c b/drm/nouveau/nvkm/engi=
ne/gr/gf100.c
index e7c3e9e..8482078 100644
--- a/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -32,16 +32,18 @@
 #include <engine/fifo.h>
 #include <subdev/fb.h>
 #include <subdev/mc.h>
 #include <subdev/timer.h>
=20
 #include <nvif/class.h>
 #include <nvif/unpack.h>
=20
+#include "nouveau_drm.h"
+
 /*********************************************************************=
**********
  * Zero Bandwidth Clear
  *********************************************************************=
*********/
=20
 static void
 gf100_gr_zbc_clear_color(struct gf100_gr_priv *priv, int zbc)
 {
 	if (priv->zbc_color[zbc].format) {
@@ -1169,34 +1171,37 @@ gf100_gr_intr(struct nvkm_subdev *subdev)
=20
 	if (stat & 0x00000020) {
 		nv_error(priv,
 			 "ILLEGAL_CLASS ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%0=
4x data 0x%08x\n",
 			 chid, inst << 12, nvkm_client_name(engctx), subc,
 			 class, mthd, data);
 		nv_wr32(priv, 0x400100, 0x00000020);
 		stat &=3D ~0x00000020;
+		nvkm_fifo_eevent(pfifo, chid, NOUVEAU_GEM_CHANNEL_GR_ERROR_SW_NOTIFY=
);
 	}
=20
 	if (stat & 0x00100000) {
 		nv_error(priv, "DATA_ERROR [");
 		nvkm_enum_print(nv50_data_error_names, code);
 		pr_cont("] ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x dat=
a 0x%08x\n",
 			chid, inst << 12, nvkm_client_name(engctx), subc,
 			class, mthd, data);
 		nv_wr32(priv, 0x400100, 0x00100000);
 		stat &=3D ~0x00100000;
+		nvkm_fifo_eevent(pfifo, chid, NOUVEAU_GEM_CHANNEL_GR_ERROR_SW_NOTIFY=
);
 	}
=20
 	if (stat & 0x00200000) {
 		nv_error(priv, "TRAP ch %d [0x%010llx %s]\n", chid, inst << 12,
 			 nvkm_client_name(engctx));
 		gf100_gr_trap_intr(priv);
 		nv_wr32(priv, 0x400100, 0x00200000);
 		stat &=3D ~0x00200000;
+		nvkm_fifo_eevent(pfifo, chid, NOUVEAU_GEM_CHANNEL_GR_ERROR_SW_NOTIFY=
);
 	}
=20
 	if (stat & 0x00080000) {
 		gf100_gr_ctxctl_isr(priv);
 		nv_wr32(priv, 0x400100, 0x00080000);
 		stat &=3D ~0x00080000;
 	}
=20
diff --git a/drm/nouveau/uapi/drm/nouveau_drm.h b/drm/nouveau/uapi/drm/=
nouveau_drm.h
index 1331c28..c9c296a 100644
--- a/drm/nouveau/uapi/drm/nouveau_drm.h
+++ b/drm/nouveau/uapi/drm/nouveau_drm.h
@@ -143,16 +143,27 @@ struct drm_nouveau_gem_cpu_prep {
 	uint32_t handle;
 	uint32_t flags;
 };
=20
 struct drm_nouveau_gem_cpu_fini {
 	uint32_t handle;
 };
=20
+#define NOUVEAU_GEM_CHANNEL_FIFO_ERROR_IDLE_TIMEOUT	8
+#define NOUVEAU_GEM_CHANNEL_GR_ERROR_SW_NOTIFY		13
+#define NOUVEAU_GEM_CHANNEL_FIFO_ERROR_MMU_ERR_FLT	31
+#define NOUVEAU_GEM_CHANNEL_PBDMA_ERROR			32
+struct drm_nouveau_gem_set_error_notifier {
+	uint32_t channel;
+	uint32_t buffer;
+	uint32_t offset; /* bytes, u32-aligned */
+};
+
+
 #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
 #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
 #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
 #define DRM_NOUVEAU_CHANNEL_FREE       0x03 /* deprecated */
 #define DRM_NOUVEAU_GROBJ_ALLOC        0x04 /* deprecated */
 #define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC  0x05 /* deprecated */
 #define DRM_NOUVEAU_GPUOBJ_FREE        0x06 /* deprecated */
 #define DRM_NOUVEAU_NVIF               0x07
@@ -160,19 +171,21 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
 #define DRM_NOUVEAU_GEM_CPU_FINI       0x43
 #define DRM_NOUVEAU_GEM_INFO           0x44
 /* range 0x98..DRM_COMMAND_END (8 entries) is reserved for staging, un=
stable ioctls */
 #define DRM_NOUVEAU_STAGING_IOCTL      0x58
 #define DRM_NOUVEAU_GEM_SET_TILING     (DRM_NOUVEAU_STAGING_IOCTL + 0x=
0)
 #define DRM_NOUVEAU_GEM_PUSHBUF_2      (DRM_NOUVEAU_STAGING_IOCTL + 0x=
1)
+#define DRM_NOUVEAU_GEM_SET_ERROR_NOTIFIER (DRM_NOUVEAU_STAGING_IOCTL =
+ 0x2)
=20
 #define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
 #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE=
 + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE=
 + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
 #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
 /* staging ioctls */
 #define DRM_IOCTL_NOUVEAU_GEM_SET_TILING     DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_NOUVEAU_GEM_SET_TILING, struct drm_nouveau_gem_set_tiling)
 #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF_2      DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_NOUVEAU_GEM_PUSHBUF_2, struct drm_nouveau_gem_pushbuf_2)
+#define DRM_IOCTL_NOUVEAU_GEM_SET_ERROR_NOTIFIER DRM_IOWR(DRM_COMMAND_=
BASE + DRM_NOUVEAU_GEM_SET_ERROR_NOTIFIER, struct drm_nouveau_gem_set_e=
rror_notifier)
=20
 #endif /* __NOUVEAU_DRM_H__ */
--=20
2.1.4
