From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 06/12] drm/nouveau/ibus: add GK20A support
Date: Mon, 24 Mar 2014 17:42:28 +0900
Message-ID: <1395650554-31925-7-git-send-email-acourbot@nvidia.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add support for initializing the priv ring of GK20A. This is done by the
BIOS on desktop GPUs, but needs to be done by hand on Tegra.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile                   |   1 +
 drivers/gpu/drm/nouveau/core/include/subdev/ibus.h |   1 +
 drivers/gpu/drm/nouveau/core/subdev/ibus/nvea.c    | 110 +++++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/ibus/nvea.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index a90087bbdf88..592141e62dda 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -132,6 +132,7 @@ nouveau-y += core/subdev/i2c/nv94.o
 nouveau-y += core/subdev/i2c/nvd0.o
 nouveau-y += core/subdev/ibus/nvc0.o
 nouveau-y += core/subdev/ibus/nve0.o
+nouveau-y += core/subdev/ibus/nvea.o
 nouveau-y += core/subdev/instmem/base.o
 nouveau-y += core/subdev/instmem/nv04.o
 nouveau-y += core/subdev/instmem/nv40.o
diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/ibus.h b/drivers/gpu/drm/nouveau/core/include/subdev/ibus.h
index 88814f159d89..056a42f92705 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/ibus.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/ibus.h
@@ -30,5 +30,6 @@ nouveau_ibus(void *obj)
 
 extern struct nouveau_oclass nvc0_ibus_oclass;
 extern struct nouveau_oclass nve0_ibus_oclass;
+extern struct nouveau_oclass nvea_ibus_oclass;
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/subdev/ibus/nvea.c b/drivers/gpu/drm/nouveau/core/subdev/ibus/nvea.c
new file mode 100644
index 000000000000..151851286e99
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/subdev/ibus/nvea.c
@@ -0,0 +1,110 @@
+/*
+ * Copyright (c) 2014, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <subdev/ibus.h>
+
+struct nvea_ibus_priv {
+	struct nouveau_ibus base;
+};
+
+static void
+nvea_ibus_init_priv_ring(struct nvea_ibus_priv *priv)
+{
+	nv_mask(priv, 0x137250, 0x3f, 0);
+
+	nv_mask(priv, 0x000200, 0x20, 0);
+	udelay(20);
+	nv_mask(priv, 0x000200, 0x20, 0x20);
+
+	nv_wr32(priv, 0x12004c, 0x4);
+	nv_wr32(priv, 0x122204, 0x2);
+	nv_rd32(priv, 0x122204);
+}
+
+static void
+nvea_ibus_intr(struct nouveau_subdev *subdev)
+{
+	struct nvea_ibus_priv *priv = (void *)subdev;
+	u32 status0 = nv_rd32(priv, 0x120058);
+	s32 retry = 100;
+	u32 command;
+
+	if (status0 & 0x7) {
+		nv_debug(priv, "resetting priv ring\n");
+		nvea_ibus_init_priv_ring(priv);
+	}
+
+	/* Acknowledge interrupt */
+	nv_mask(priv, 0x12004c, 0x2, 0x2);
+
+	while (--retry >= 0) {
+		command = nv_rd32(priv, 0x12004c) & 0x3f;
+		if (command == 0)
+			break;
+	}
+
+	if (retry < 0)
+		nv_warn(priv, "timeout waiting for ringmaster ack\n");
+}
+
+static int
+nvea_ibus_init(struct nouveau_object *object)
+{
+	struct nvea_ibus_priv *priv = (void *)object;
+	int ret;
+
+	ret = _nouveau_ibus_init(object);
+	if (ret)
+		return ret;
+
+	nvea_ibus_init_priv_ring(priv);
+
+	return 0;
+}
+
+static int
+nvea_ibus_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+	       struct nouveau_oclass *oclass, void *data, u32 size,
+	       struct nouveau_object **pobject)
+{
+	struct nvea_ibus_priv *priv;
+	int ret;
+
+	ret = nouveau_ibus_create(parent, engine, oclass, &priv);
+	*pobject = nv_object(priv);
+	if (ret)
+		return ret;
+
+	nv_subdev(priv)->intr = nvea_ibus_intr;
+	return 0;
+}
+
+struct nouveau_oclass
+nvea_ibus_oclass = {
+	.handle = NV_SUBDEV(IBUS, 0xea),
+	.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = nvea_ibus_ctor,
+		.dtor = _nouveau_ibus_dtor,
+		.init = nvea_ibus_init,
+		.fini = _nouveau_ibus_fini,
+	},
+};
-- 
1.9.1
