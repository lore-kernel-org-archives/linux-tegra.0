From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 3/6] gk20a: remove RAM device
Date: Tue, 17 Feb 2015 16:48:01 +0900
Message-ID: <1424159284-19920-4-git-send-email-acourbot@nvidia.com>
References: <1424159284-19920-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424159284-19920-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Now that Nouveau can operate even when there is no RAM device, remove
the dummy one used by GK20A.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/subdev/fb/Kbuild     |  1 -
 drm/nouveau/nvkm/subdev/fb/gk20a.c    |  1 -
 drm/nouveau/nvkm/subdev/fb/priv.h     |  1 -
 drm/nouveau/nvkm/subdev/fb/ramgk20a.c | 67 -----------------------------------
 4 files changed, 70 deletions(-)
 delete mode 100644 drm/nouveau/nvkm/subdev/fb/ramgk20a.c

diff --git a/drm/nouveau/nvkm/subdev/fb/Kbuild b/drm/nouveau/nvkm/subdev/fb/Kbuild
index 904d601e8a50..d6be4c6c5408 100644
--- a/drm/nouveau/nvkm/subdev/fb/Kbuild
+++ b/drm/nouveau/nvkm/subdev/fb/Kbuild
@@ -37,7 +37,6 @@ nvkm-y += nvkm/subdev/fb/ramgt215.o
 nvkm-y += nvkm/subdev/fb/rammcp77.o
 nvkm-y += nvkm/subdev/fb/ramgf100.o
 nvkm-y += nvkm/subdev/fb/ramgk104.o
-nvkm-y += nvkm/subdev/fb/ramgk20a.o
 nvkm-y += nvkm/subdev/fb/ramgm107.o
 nvkm-y += nvkm/subdev/fb/sddr2.o
 nvkm-y += nvkm/subdev/fb/sddr3.o
diff --git a/drm/nouveau/nvkm/subdev/fb/gk20a.c b/drm/nouveau/nvkm/subdev/fb/gk20a.c
index 6762847c05e8..a5d7857d3898 100644
--- a/drm/nouveau/nvkm/subdev/fb/gk20a.c
+++ b/drm/nouveau/nvkm/subdev/fb/gk20a.c
@@ -65,5 +65,4 @@ gk20a_fb_oclass = &(struct nvkm_fb_impl) {
 		.fini = _nvkm_fb_fini,
 	},
 	.memtype = gf100_fb_memtype_valid,
-	.ram = &gk20a_ram_oclass,
 }.base;
diff --git a/drm/nouveau/nvkm/subdev/fb/priv.h b/drm/nouveau/nvkm/subdev/fb/priv.h
index d82da02daa1f..485c4b64819a 100644
--- a/drm/nouveau/nvkm/subdev/fb/priv.h
+++ b/drm/nouveau/nvkm/subdev/fb/priv.h
@@ -32,7 +32,6 @@ extern struct nvkm_oclass gt215_ram_oclass;
 extern struct nvkm_oclass mcp77_ram_oclass;
 extern struct nvkm_oclass gf100_ram_oclass;
 extern struct nvkm_oclass gk104_ram_oclass;
-extern struct nvkm_oclass gk20a_ram_oclass;
 extern struct nvkm_oclass gm107_ram_oclass;
 
 int nvkm_sddr2_calc(struct nvkm_ram *ram);
diff --git a/drm/nouveau/nvkm/subdev/fb/ramgk20a.c b/drm/nouveau/nvkm/subdev/fb/ramgk20a.c
deleted file mode 100644
index 60d8e1cead61..000000000000
--- a/drm/nouveau/nvkm/subdev/fb/ramgk20a.c
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * Copyright (c) 2014, NVIDIA CORPORATION. All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-#include "priv.h"
-
-#include <core/device.h>
-
-static void
-gk20a_ram_put(struct nvkm_fb *pfb, struct nvkm_mem **pmem)
-{
-	BUG();
-}
-
-static int
-gk20a_ram_get(struct nvkm_fb *pfb, u64 size, u32 align, u32 ncmin,
-	     u32 memtype, struct nvkm_mem **pmem)
-{
-	BUG();
-}
-
-static int
-gk20a_ram_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
-	       struct nvkm_oclass *oclass, void *data, u32 datasize,
-	       struct nvkm_object **pobject)
-{
-	struct nvkm_ram *ram;
-	int ret;
-
-	ret = nvkm_ram_create(parent, engine, oclass, &ram);
-	*pobject = nv_object(ram);
-	if (ret)
-		return ret;
-	ram->type = NV_MEM_TYPE_STOLEN;
-	ram->size = get_num_physpages() << PAGE_SHIFT;
-
-	ram->get = gk20a_ram_get;
-	ram->put = gk20a_ram_put;
-	return 0;
-}
-
-struct nvkm_oclass
-gk20a_ram_oclass = {
-	.ofuncs = &(struct nvkm_ofuncs) {
-		.ctor = gk20a_ram_ctor,
-		.dtor = _nvkm_ram_dtor,
-		.init = _nvkm_ram_init,
-		.fini = _nvkm_ram_fini,
-	},
-};
-- 
2.3.0
