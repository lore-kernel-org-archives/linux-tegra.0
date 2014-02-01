From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC 12/16] drm/nouveau/fifo: add GK20A support
Date: Sat,  1 Feb 2014 12:16:54 +0900
Message-ID: <1391224618-3794-13-git-send-email-acourbot@nvidia.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391224618-3794-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

GK20A's FIFO is compatible with NVE0, but only features 128 channels and
1 runlist.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile                   |  1 +
 drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h    |  1 +
 drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c    | 27 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/core/include/engine/fifo.h |  1 +
 4 files changed, 30 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index e88145b..6c4b76d 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -236,6 +236,7 @@ nouveau-y += core/engine/fifo/nv50.o
 nouveau-y += core/engine/fifo/nv84.o
 nouveau-y += core/engine/fifo/nvc0.o
 nouveau-y += core/engine/fifo/nve0.o
+nouveau-y += core/engine/fifo/nvea.o
 nouveau-y += core/engine/fifo/nv108.o
 nouveau-y += core/engine/graph/ctxnv40.o
 nouveau-y += core/engine/graph/ctxnv50.o
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h
index 014344e..e96b32b 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h
@@ -8,6 +8,7 @@ int  nve0_fifo_ctor(struct nouveau_object *, struct nouveau_object *,
 		    struct nouveau_object **);
 void nve0_fifo_dtor(struct nouveau_object *);
 int  nve0_fifo_init(struct nouveau_object *);
+int  nve0_fifo_fini(struct nouveau_object *, bool);
 
 struct nve0_fifo_impl {
 	struct nouveau_oclass base;
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c
new file mode 100644
index 0000000..16f8905
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c
@@ -0,0 +1,27 @@
+/*
+ * Copyright (c) 2014, NVIDIA Corporation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ */
+
+#include "nve0.h"
+
+struct nouveau_oclass *
+nvea_fifo_oclass = &(struct nve0_fifo_impl) {
+	.base.handle = NV_ENGINE(FIFO, 0xea),
+	.base.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = nve0_fifo_ctor,
+		.dtor = nve0_fifo_dtor,
+		.init = nve0_fifo_init,
+		.fini = nve0_fifo_fini,
+	},
+	.channels = 128,
+}.base;
diff --git a/drivers/gpu/drm/nouveau/core/include/engine/fifo.h b/drivers/gpu/drm/nouveau/core/include/engine/fifo.h
index 26b6b2b..823356f 100644
--- a/drivers/gpu/drm/nouveau/core/include/engine/fifo.h
+++ b/drivers/gpu/drm/nouveau/core/include/engine/fifo.h
@@ -109,6 +109,7 @@ extern struct nouveau_oclass *nv50_fifo_oclass;
 extern struct nouveau_oclass *nv84_fifo_oclass;
 extern struct nouveau_oclass *nvc0_fifo_oclass;
 extern struct nouveau_oclass *nve0_fifo_oclass;
+extern struct nouveau_oclass *nvea_fifo_oclass;
 extern struct nouveau_oclass *nv108_fifo_oclass;
 
 void nv04_fifo_intr(struct nouveau_subdev *);
-- 
1.8.5.3
