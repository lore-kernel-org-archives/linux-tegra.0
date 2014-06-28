From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/gk20a: add BAR instance
Date: Sat, 28 Jun 2014 23:10:19 +1000
Message-ID: <CACAvsv5o1j3FxTw602Z7bOQ_DFfGVfjSVWssT4mw6XF05N6QWg@mail.gmail.com>
References: <CACAvsv61HW-7ySzTcFCtZNZ7g-NvmxjKNMWAs=bvfjaL6BL0AQ@mail.gmail.com>
	<CFD3932D.8F2A2%kadams@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CFD3932D.8F2A2%kadams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Jun 28, 2014 at 11:41 AM, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> On 6/27/14 8:56 PM, "Ben Skeggs" <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>>On Sat, Jun 28, 2014 at 4:51 AM, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> quick note re: tegra and gpu bars...
>>>
>>> to this point we've explicitly avoided providing user-mode mappings=
 due
>>>to
>>> power management issues, etc.
>>> looks to me like this would allow such mappings.  is that the case?=
  are
>>> there any paths which would require such mappings to function prope=
rly?
>
>>What power management issues are you worried about in particular?  We
>>have these concerns on discrete cards too, when doing things like
>>changing vram frequencies.  TTM is able to kick out all userspace
>>mappings, and clients will then block in the fault handler until it's
>>safe - if they touch the mappings.
>>
>>Ben.
>
>
> hi ben,
>
> primarily it's the access problem you mentioned.  managing those mapp=
ings,
> and kicking them out at best adds to the latency to take down power/d=
etach
> busii and the like.
>
> and, generally, there are very few (if any) cases where there isn't a
> better way to manipulate the pixels than with the cpu :) i understand
> there are plenty of paths i don't know about here=C5=A0 and so i aske=
d.
I actually don't believe our userspace (on nv50 and up at least)
touches them directly either in most (all?) cases.  It's definitely
something one wants to avoid if at all possible, that's for sure; but
the possibility is there to have/use the CPU mappings.

>
> it's a solvable problem, of course.  but especially in the mobile wor=
ld it
> can pop up unexpectedly.  typically on someone's perf/power/stress te=
sts :)
Unless they're actually used by userspace, I don't *think* this should
be an issue.  It's something we should probably address if it is.

Ben.

>
> ---
> ken
>
>
>
>
>
>>
>>>
>>> thanks
>>> ---
>>> ken
>>>
>>> p.s.: hello :)
>>>
>>> On 6/27/14 7:36 AM, "Alex Courbot" <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>
>>>>GK20A's BAR is functionally identical to NVC0's, but do not support
>>>>being ioremapped write-combined. Create a BAR instance for GK20A th=
at
>>>>reflect that state.
>>>>
>>>>Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>---
>>>>Changes since v1:
>>>>- Fix compilation warning due to missing cast
>>>>
>>>>Patch 1 of the series was ok and thus has not been resent.
>>>>
>>>> drivers/gpu/drm/nouveau/Makefile                  |  1 +
>>>> drivers/gpu/drm/nouveau/core/engine/device/nve0.c |  2 +-
>>>> drivers/gpu/drm/nouveau/core/include/subdev/bar.h |  1 +
>>>> drivers/gpu/drm/nouveau/core/subdev/bar/gk20a.c   | 54
>>>>+++++++++++++++++++++++
>>>> drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c    |  6 +--
>>>> drivers/gpu/drm/nouveau/core/subdev/bar/priv.h    |  6 +++
>>>> 6 files changed, 66 insertions(+), 4 deletions(-)
>>>> create mode 100644 drivers/gpu/drm/nouveau/core/subdev/bar/gk20a.c
>>>>
>>>>diff --git a/drivers/gpu/drm/nouveau/Makefile
>>>>b/drivers/gpu/drm/nouveau/Makefile
>>>>index 8b307e143632..11d9561d67c1 100644
>>>>--- a/drivers/gpu/drm/nouveau/Makefile
>>>>+++ b/drivers/gpu/drm/nouveau/Makefile
>>>>@@ -26,6 +26,7 @@ nouveau-y +=3D core/core/subdev.o
>>>> nouveau-y +=3D core/subdev/bar/base.o
>>>> nouveau-y +=3D core/subdev/bar/nv50.o
>>>> nouveau-y +=3D core/subdev/bar/nvc0.o
>>>>+nouveau-y +=3D core/subdev/bar/gk20a.o
>>>> nouveau-y +=3D core/subdev/bios/base.o
>>>> nouveau-y +=3D core/subdev/bios/bit.o
>>>> nouveau-y +=3D core/subdev/bios/boost.o
>>>>diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
>>>>b/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
>>>>index 2d1e97d4264f..a2b9ccc48f66 100644
>>>>--- a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
>>>>+++ b/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
>>>>@@ -165,7 +165,7 @@ nve0_identify(struct nouveau_device *device)
>>>>               device->oclass[NVDEV_SUBDEV_IBUS   ] =3D
>>>>&gk20a_ibus_oclass;
>>>>               device->oclass[NVDEV_SUBDEV_INSTMEM] =3D
>>>>nv50_instmem_oclass;
>>>>               device->oclass[NVDEV_SUBDEV_VM     ] =3D
>>>>&nvc0_vmmgr_oclass;
>>>>-              device->oclass[NVDEV_SUBDEV_BAR    ] =3D &nvc0_bar_o=
class;
>>>>+              device->oclass[NVDEV_SUBDEV_BAR    ] =3D &gk20a_bar_=
oclass;
>>>>               device->oclass[NVDEV_ENGINE_DMAOBJ ] =3D
>>>>&nvd0_dmaeng_oclass;
>>>>               device->oclass[NVDEV_ENGINE_FIFO   ] =3D
>>>>gk20a_fifo_oclass;
>>>>               device->oclass[NVDEV_ENGINE_SW     ] =3D
>>>>nvc0_software_oclass;
>>>>diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/bar.h
>>>>b/drivers/gpu/drm/nouveau/core/include/subdev/bar.h
>>>>index 9002cbb6432b..be037fac534c 100644
>>>>--- a/drivers/gpu/drm/nouveau/core/include/subdev/bar.h
>>>>+++ b/drivers/gpu/drm/nouveau/core/include/subdev/bar.h
>>>>@@ -33,5 +33,6 @@ nouveau_bar(void *obj)
>>>>
>>>> extern struct nouveau_oclass nv50_bar_oclass;
>>>> extern struct nouveau_oclass nvc0_bar_oclass;
>>>>+extern struct nouveau_oclass gk20a_bar_oclass;
>>>>
>>>> #endif
>>>>diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/gk20a.c
>>>>b/drivers/gpu/drm/nouveau/core/subdev/bar/gk20a.c
>>>>new file mode 100644
>>>>index 000000000000..bf877af9d3bd
>>>>--- /dev/null
>>>>+++ b/drivers/gpu/drm/nouveau/core/subdev/bar/gk20a.c
>>>>@@ -0,0 +1,54 @@
>>>>+/*
>>>>+ * Copyright (c) 2014, NVIDIA CORPORATION. All rights reserved.
>>>>+ *
>>>>+ * Permission is hereby granted, free of charge, to any person
>>>>obtaining
>>>>a
>>>>+ * copy of this software and associated documentation files (the
>>>>"Software"),
>>>>+ * to deal in the Software without restriction, including without
>>>>limitation
>>>>+ * the rights to use, copy, modify, merge, publish, distribute,
>>>>sublicense,
>>>>+ * and/or sell copies of the Software, and to permit persons to wh=
om
>>>>the
>>>>+ * Software is furnished to do so, subject to the following condit=
ions:
>>>>+ *
>>>>+ * The above copyright notice and this permission notice shall be
>>>>included in
>>>>+ * all copies or substantial portions of the Software.
>>>>+ *
>>>>+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>>>>EXPRESS OR
>>>>+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>>MERCHANTABILITY,
>>>>+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EV=
ENT
>>>>SHALL
>>>>+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
>>>>OTHER
>>>>+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>>>ARISING
>>>>+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR O=
THER
>>>>+ * DEALINGS IN THE SOFTWARE.
>>>>+ */
>>>>+
>>>>+#include <subdev/bar.h>
>>>>+
>>>>+#include "priv.h"
>>>>+
>>>>+int
>>>>+gk20a_bar_ctor(struct nouveau_object *parent, struct nouveau_objec=
t
>>>>*engine,
>>>>+             struct nouveau_oclass *oclass, void *data, u32 size,
>>>>+             struct nouveau_object **pobject)
>>>>+{
>>>>+      struct nouveau_bar *bar;
>>>>+      int ret;
>>>>+
>>>>+      ret =3D nvc0_bar_ctor(parent, engine, oclass, data, size, po=
bject);
>>>>+      if (ret)
>>>>+              return ret;
>>>>+
>>>>+      bar =3D (struct nouveau_bar *)*pobject;
>>>>+      bar->iomap_uncached =3D true;
>>>>+
>>>>+      return 0;
>>>>+}
>>>>+
>>>>+struct nouveau_oclass
>>>>+gk20a_bar_oclass =3D {
>>>>+      .handle =3D NV_SUBDEV(BAR, 0xea),
>>>>+      .ofuncs =3D &(struct nouveau_ofuncs) {
>>>>+              .ctor =3D gk20a_bar_ctor,
>>>>+              .dtor =3D nvc0_bar_dtor,
>>>>+              .init =3D nvc0_bar_init,
>>>>+              .fini =3D _nouveau_bar_fini,
>>>>+      },
>>>>+};
>>>>diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
>>>>b/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
>>>>index ca8139b9ab27..0a44459844e3 100644
>>>>--- a/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
>>>>+++ b/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
>>>>@@ -133,7 +133,7 @@ nvc0_bar_init_vm(struct nvc0_bar_priv *priv, st=
ruct
>>>>nvc0_bar_priv_vm *bar_vm,
>>>>       return 0;
>>>> }
>>>>
>>>>-static int
>>>>+int
>>>> nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object
>>>>*engine,
>>>>             struct nouveau_oclass *oclass, void *data, u32 size,
>>>>             struct nouveau_object **pobject)
>>>>@@ -169,7 +169,7 @@ nvc0_bar_ctor(struct nouveau_object *parent, st=
ruct
>>>>nouveau_object *engine,
>>>>       return 0;
>>>> }
>>>>
>>>>-static void
>>>>+void
>>>> nvc0_bar_dtor(struct nouveau_object *object)
>>>> {
>>>>       struct nvc0_bar_priv *priv =3D (void *)object;
>>>>@@ -188,7 +188,7 @@ nvc0_bar_dtor(struct nouveau_object *object)
>>>>       nouveau_bar_destroy(&priv->base);
>>>> }
>>>>
>>>>-static int
>>>>+int
>>>> nvc0_bar_init(struct nouveau_object *object)
>>>> {
>>>>       struct nvc0_bar_priv *priv =3D (void *)object;
>>>>diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/priv.h
>>>>b/drivers/gpu/drm/nouveau/core/subdev/bar/priv.h
>>>>index ffad8f337ead..3ee8b1476d00 100644
>>>>--- a/drivers/gpu/drm/nouveau/core/subdev/bar/priv.h
>>>>+++ b/drivers/gpu/drm/nouveau/core/subdev/bar/priv.h
>>>>@@ -23,4 +23,10 @@ int  nouveau_bar_alloc(struct nouveau_bar *, str=
uct
>>>>nouveau_object *,
>>>>
>>>> void nv84_bar_flush(struct nouveau_bar *);
>>>>
>>>>+int nvc0_bar_ctor(struct nouveau_object *, struct nouveau_object *=
,
>>>>+                struct nouveau_oclass *, void *, u32,
>>>>+                struct nouveau_object **);
>>>>+void nvc0_bar_dtor(struct nouveau_object *);
>>>>+int nvc0_bar_init(struct nouveau_object *);
>>>>+
>>>> #endif
>>>>--
>>>>2.0.0
>>>>
>>>>--
>>>>To unsubscribe from this list: send the line "unsubscribe linux-teg=
ra"
>>>>in
>>>>the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
