From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 07/11] core: add support for secure boot
Date: Wed, 24 Feb 2016 14:42:20 +0900
Message-ID: <1456292544-32206-8-git-send-email-acourbot@nvidia.com>
References: <1456292544-32206-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456292544-32206-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On GM200 and later GPUs, firmware for some essential falcons (notably
GR ones) must be authenticated by a NVIDIA-produced signature and
loaded by a high-secure falcon in order to be able to access privileged
registers, in a process known as Secure Boot.

Secure Boot requires building a binary blob containing the firmwares
and signatures of the falcons to be loaded. This blob is then given to
a high-secure falcon running a signed loader firmware that copies the
blob into a write-protected region, checks that the signatures are
valid, and finally loads the verified firmware into the managed falcons
and switches them to privileged mode.

This patch adds infrastructure code to support this process on chips
that require it.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/include/nvkm/core/device.h    |   3 +
 drm/nouveau/include/nvkm/subdev/secboot.h |  56 ++++++
 drm/nouveau/nvkm/core/subdev.c            |   1 +
 drm/nouveau/nvkm/engine/device/base.c     |   2 +
 drm/nouveau/nvkm/engine/device/priv.h     |   1 +
 drm/nouveau/nvkm/subdev/Kbuild            |   1 +
 drm/nouveau/nvkm/subdev/secboot/Kbuild    |   1 +
 drm/nouveau/nvkm/subdev/secboot/base.c    | 296 ++++++++++++++++++++++++++++++
 drm/nouveau/nvkm/subdev/secboot/priv.h    |  48 +++++
 9 files changed, 409 insertions(+)
 create mode 100644 drm/nouveau/include/nvkm/subdev/secboot.h
 create mode 100644 drm/nouveau/nvkm/subdev/secboot/Kbuild
 create mode 100644 drm/nouveau/nvkm/subdev/secboot/base.c
 create mode 100644 drm/nouveau/nvkm/subdev/secboot/priv.h

diff --git a/drm/nouveau/include/nvkm/core/device.h b/drm/nouveau/include/nvkm/core/device.h
index 913192c94876..d154a75e93a9 100644
--- a/drm/nouveau/include/nvkm/core/device.h
+++ b/drm/nouveau/include/nvkm/core/device.h
@@ -24,6 +24,7 @@ enum nvkm_devidx {
 	NVKM_SUBDEV_VOLT,
 	NVKM_SUBDEV_THERM,
 	NVKM_SUBDEV_CLK,
+	NVKM_SUBDEV_SECBOOT,
 
 	NVKM_ENGINE_DMAOBJ,
 	NVKM_ENGINE_IFB,
@@ -119,6 +120,7 @@ struct nvkm_device {
 	struct nvkm_therm *therm;
 	struct nvkm_timer *timer;
 	struct nvkm_volt *volt;
+	struct nvkm_secboot *secboot;
 
 	struct nvkm_engine *bsp;
 	struct nvkm_engine *ce[3];
@@ -184,6 +186,7 @@ struct nvkm_device_chip {
 	int (*therm  )(struct nvkm_device *, int idx, struct nvkm_therm **);
 	int (*timer  )(struct nvkm_device *, int idx, struct nvkm_timer **);
 	int (*volt   )(struct nvkm_device *, int idx, struct nvkm_volt **);
+	int (*secboot)(struct nvkm_device *, int idx, struct nvkm_secboot **);
 
 	int (*bsp    )(struct nvkm_device *, int idx, struct nvkm_engine **);
 	int (*ce[3]  )(struct nvkm_device *, int idx, struct nvkm_engine **);
diff --git a/drm/nouveau/include/nvkm/subdev/secboot.h b/drm/nouveau/include/nvkm/subdev/secboot.h
new file mode 100644
index 000000000000..f40b57567676
--- /dev/null
+++ b/drm/nouveau/include/nvkm/subdev/secboot.h
@@ -0,0 +1,56 @@
+/*
+ * Copyright (c) 2016, NVIDIA CORPORATION. All rights reserved.
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
+#ifndef __NVKM_SECURE_BOOT_H__
+#define __NVKM_SECURE_BOOT_H__
+
+#include <core/subdev.h>
+
+enum nvkm_secboot_falcon {
+	NVKM_SECBOOT_FALCON_PMU	= 0,
+	NVKM_SECBOOT_FALCON_RESERVED = 1,
+	NVKM_SECBOOT_FALCON_FECS = 2,
+	NVKM_SECBOOT_FALCON_GPCCS = 3,
+	NVKM_SECBOOT_FALCON_END = 4,
+	NVKM_SECBOOT_FALCON_INVALID = 0xffffffff,
+};
+
+/**
+ * @base:		base IO address of the falcon performing secure boot
+ * @irq_mask:		IRQ mask of the falcon performing secure boot
+ * @enable_mask:	enable mask of the falcon performing secure boot
+*/
+struct nvkm_secboot {
+	const struct nvkm_secboot_func *func;
+	struct nvkm_subdev subdev;
+
+	u32 base;
+	u32 irq_mask;
+	u32 enable_mask;
+};
+#define nvkm_secboot(p) container_of((p), struct nvkm_secboot, subdev)
+
+bool nvkm_secboot_is_managed(struct nvkm_secboot *, enum nvkm_secboot_falcon);
+int nvkm_secboot_reset(struct nvkm_secboot *, u32 falcon);
+int nvkm_secboot_start(struct nvkm_secboot *, u32 falcon);
+
+#endif
diff --git a/drm/nouveau/nvkm/core/subdev.c b/drm/nouveau/nvkm/core/subdev.c
index 7de98470a2a0..d8b3d2a362ad 100644
--- a/drm/nouveau/nvkm/core/subdev.c
+++ b/drm/nouveau/nvkm/core/subdev.c
@@ -49,6 +49,7 @@ nvkm_subdev_name[NVKM_SUBDEV_NR] = {
 	[NVKM_SUBDEV_THERM  ] = "therm",
 	[NVKM_SUBDEV_TIMER  ] = "tmr",
 	[NVKM_SUBDEV_VOLT   ] = "volt",
+	[NVKM_SUBDEV_SECBOOT] = "secboot",
 	[NVKM_ENGINE_BSP    ] = "bsp",
 	[NVKM_ENGINE_CE0    ] = "ce0",
 	[NVKM_ENGINE_CE1    ] = "ce1",
diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index da371b805562..ba44ba925f4b 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2123,6 +2123,7 @@ nvkm_device_subdev(struct nvkm_device *device, int index)
 	_(THERM  , device->therm  , &device->therm->subdev);
 	_(TIMER  , device->timer  , &device->timer->subdev);
 	_(VOLT   , device->volt   , &device->volt->subdev);
+	_(SECBOOT, device->secboot, &device->secboot->subdev);
 #undef _
 	default:
 		engine = nvkm_device_engine(device, index);
@@ -2572,6 +2573,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		_(NVKM_SUBDEV_THERM  ,   therm);
 		_(NVKM_SUBDEV_TIMER  ,   timer);
 		_(NVKM_SUBDEV_VOLT   ,    volt);
+		_(NVKM_SUBDEV_SECBOOT, secboot);
 		_(NVKM_ENGINE_BSP    ,     bsp);
 		_(NVKM_ENGINE_CE0    ,   ce[0]);
 		_(NVKM_ENGINE_CE1    ,   ce[1]);
diff --git a/drm/nouveau/nvkm/engine/device/priv.h b/drm/nouveau/nvkm/engine/device/priv.h
index ed3ad2c30e17..03fe0afbf6bf 100644
--- a/drm/nouveau/nvkm/engine/device/priv.h
+++ b/drm/nouveau/nvkm/engine/device/priv.h
@@ -22,6 +22,7 @@
 #include <subdev/therm.h>
 #include <subdev/timer.h>
 #include <subdev/volt.h>
+#include <subdev/secboot.h>
 
 #include <engine/bsp.h>
 #include <engine/ce.h>
diff --git a/drm/nouveau/nvkm/subdev/Kbuild b/drm/nouveau/nvkm/subdev/Kbuild
index ee2c38f50ef5..ec8c5eb30653 100644
--- a/drm/nouveau/nvkm/subdev/Kbuild
+++ b/drm/nouveau/nvkm/subdev/Kbuild
@@ -15,6 +15,7 @@ include $(src)/nvkm/subdev/mmu/Kbuild
 include $(src)/nvkm/subdev/mxm/Kbuild
 include $(src)/nvkm/subdev/pci/Kbuild
 include $(src)/nvkm/subdev/pmu/Kbuild
+include $(src)/nvkm/subdev/secboot/Kbuild
 include $(src)/nvkm/subdev/therm/Kbuild
 include $(src)/nvkm/subdev/timer/Kbuild
 include $(src)/nvkm/subdev/volt/Kbuild
diff --git a/drm/nouveau/nvkm/subdev/secboot/Kbuild b/drm/nouveau/nvkm/subdev/secboot/Kbuild
new file mode 100644
index 000000000000..e757096b2ff0
--- /dev/null
+++ b/drm/nouveau/nvkm/subdev/secboot/Kbuild
@@ -0,0 +1 @@
+nvkm-y += nvkm/subdev/secboot/base.o
diff --git a/drm/nouveau/nvkm/subdev/secboot/base.c b/drm/nouveau/nvkm/subdev/secboot/base.c
new file mode 100644
index 000000000000..b718ba79177c
--- /dev/null
+++ b/drm/nouveau/nvkm/subdev/secboot/base.c
@@ -0,0 +1,296 @@
+/*
+ * Copyright (c) 2016, NVIDIA CORPORATION. All rights reserved.
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
+#include "priv.h"
+#include <subdev/timer.h>
+
+static const char *
+managed_falcons_names[] = {
+	[NVKM_SECBOOT_FALCON_PMU] = "PMU",
+	[NVKM_SECBOOT_FALCON_RESERVED] = "<reserved>",
+	[NVKM_SECBOOT_FALCON_FECS] = "FECS",
+	[NVKM_SECBOOT_FALCON_GPCCS] = "GPCCS",
+	[NVKM_SECBOOT_FALCON_END] = "<invalid>",
+};
+
+/*
+ * Helper falcon functions
+ */
+
+static int
+falcon_clear_halt_interrupt(struct nvkm_device *device, u32 base)
+{
+	int ret;
+
+	/* clear halt interrupt */
+	nvkm_mask(device, base + 0x004, 0x10, 0x10);
+	/* wait until halt interrupt is cleared */
+	ret = nvkm_wait_msec(device, 10, base + 0x008, 0x10, 0x0);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int
+falcon_wait_idle(struct nvkm_device *device, u32 base)
+{
+	int ret;
+
+	ret = nvkm_wait_msec(device, 10, base + 0x04c, 0xffff, 0x0);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int
+nvkm_secboot_falcon_enable(struct nvkm_secboot *sb)
+{
+	struct nvkm_device *device = sb->subdev.device;
+	int ret;
+
+	/* enable engine */
+	nvkm_mask(device, 0x200, sb->enable_mask, sb->enable_mask);
+	nvkm_rd32(device, 0x200);
+	ret = nvkm_wait_msec(device, 10, sb->base + 0x10c, 0x6, 0x0);
+	if (ret < 0) {
+		nvkm_mask(device, 0x200, sb->enable_mask, 0x0);
+		nvkm_error(&sb->subdev, "Falcon mem scrubbing timeout\n");
+		return ret;
+	}
+
+	ret = falcon_wait_idle(device, sb->base);
+	if (ret)
+		return ret;
+
+	/* enable IRQs */
+	nvkm_wr32(device, sb->base + 0x010, 0xff);
+	nvkm_mask(device, 0x640, sb->irq_mask, 0x1000000);
+	nvkm_mask(device, 0x644, sb->irq_mask, 0x1000000);
+
+	return 0;
+}
+
+static int
+nvkm_secboot_falcon_disable(struct nvkm_secboot *sb)
+{
+	struct nvkm_device *device = sb->subdev.device;
+	int ret;
+
+	ret = falcon_clear_halt_interrupt(device, sb->base);
+	if (ret)
+		return ret;
+
+	ret = falcon_wait_idle(device, sb->base);
+	if (ret)
+		return ret;
+
+	if ((nvkm_rd32(device, 0x200) & sb->enable_mask) != 0) {
+		/* disable IRQs */
+		nvkm_mask(device, 0x644, sb->irq_mask, 0x0);
+		nvkm_mask(device, 0x640, sb->irq_mask, 0x0);
+		nvkm_wr32(device, sb->base + 0x014, 0xff);
+		/* disable engine */
+		nvkm_mask(device, 0x200, sb->enable_mask, 0x0);
+	}
+
+	return 0;
+}
+
+int
+nvkm_secboot_falcon_reset(struct nvkm_secboot *sb)
+{
+	int ret;
+
+	ret = nvkm_secboot_falcon_disable(sb);
+	if (ret)
+		return ret;
+
+	ret = nvkm_secboot_falcon_enable(sb);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * nvkm_secboot_falcon_run - run the falcon that will perform secure boot
+ *
+ * This function is to be called after all chip-specific preparations have
+ * been completed. It will start the falcon to perform secure boot, wait for
+ * it to halt, and report if an error occurred.
+ */
+int
+nvkm_secboot_falcon_run(struct nvkm_secboot *sb)
+{
+	struct nvkm_device *device = sb->subdev.device;
+	int ret;
+
+	/* Start falcon */
+	nvkm_wr32(device, sb->base + 0x100, 0x2);
+
+	/* Wait for falcon halt */
+	ret = nvkm_wait_msec(device, 100, sb->base + 0x100, 0x10, 0x10);
+	if (ret < 0)
+		return ret;
+
+	/* If mailbox register contains an error code, then ACR has failed */
+	ret = nvkm_rd32(device, sb->base + 0x040);
+	if (ret) {
+		nvkm_error(&sb->subdev, "ACR boot failed, ret 0x%08x", ret);
+		falcon_clear_halt_interrupt(device, sb->base);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+
+/**
+ * nvkm_secboot_reset() - reset specified falcon
+ */
+int
+nvkm_secboot_reset(struct nvkm_secboot *sb, u32 falcon)
+{
+	/* Unmanaged falcon? */
+	if (!(BIT(falcon) & sb->func->managed_falcons)) {
+		nvkm_error(&sb->subdev, "cannot reset unmanaged falcon!\n");
+		return -EINVAL;
+	}
+
+	return sb->func->reset(sb, falcon);
+}
+
+/**
+ * nvkm_secboot_start() - start specified falcon
+ */
+int
+nvkm_secboot_start(struct nvkm_secboot *sb, u32 falcon)
+{
+	/* Unmanaged falcon? */
+	if (!(BIT(falcon) & sb->func->managed_falcons)) {
+		nvkm_error(&sb->subdev, "cannot start unmanaged falcon!\n");
+		return -EINVAL;
+	}
+
+	return sb->func->start(sb, falcon);
+}
+
+/**
+ * nvkm_secboot_is_managed() - check whether a given falcon is securely-managed
+ */
+bool
+nvkm_secboot_is_managed(struct nvkm_secboot *secboot,
+			enum nvkm_secboot_falcon fid)
+{
+	if (!secboot)
+		return false;
+
+	return secboot->func->managed_falcons & BIT(fid);
+}
+
+static int
+nvkm_secboot_oneinit(struct nvkm_subdev *subdev)
+{
+	struct nvkm_secboot *sb = nvkm_secboot(subdev);
+	int ret = 0;
+
+	/* Call chip-specific init function */
+	if (sb->func->init)
+		ret = sb->func->init(sb);
+	if (ret) {
+		nvkm_error(subdev, "Secure Boot initialization failed: %d\n",
+			   ret);
+		return ret;
+	}
+
+	/*
+	 * Build all blobs - the same blobs can be used to perform secure boot
+	 * multiple times
+	 */
+	if (sb->func->prepare_blobs)
+		ret = sb->func->prepare_blobs(sb);
+
+	return ret;
+}
+
+static int
+nvkm_secboot_fini(struct nvkm_subdev *subdev, bool suspend)
+{
+	struct nvkm_secboot *sb = nvkm_secboot(subdev);
+	int ret = 0;
+
+	if (sb->func->fini)
+		ret = sb->func->fini(sb, suspend);
+
+	return ret;
+}
+
+static void *
+nvkm_secboot_dtor(struct nvkm_subdev *subdev)
+{
+	struct nvkm_secboot *sb = nvkm_secboot(subdev);
+	void *ret = NULL;
+
+	if (sb->func->dtor)
+		ret = sb->func->dtor(sb);
+
+	return ret;
+}
+
+static const struct nvkm_subdev_func
+nvkm_secboot = {
+	.oneinit = nvkm_secboot_oneinit,
+	.fini = nvkm_secboot_fini,
+	.dtor = nvkm_secboot_dtor,
+};
+
+int
+nvkm_secboot_ctor(const struct nvkm_secboot_func *func,
+		  struct nvkm_device *device, int index,
+		  struct nvkm_secboot *sb)
+{
+	unsigned long fid;
+
+	nvkm_subdev_ctor(&nvkm_secboot, device, index, 0, &sb->subdev);
+	sb->func = func;
+
+	/* setup the performing falcon's base address and masks */
+	switch (func->boot_falcon) {
+	case NVKM_SECBOOT_FALCON_PMU:
+		sb->base = 0x10a000;
+		sb->irq_mask = 0x1000000;
+		sb->enable_mask = 0x2000;
+		break;
+	default:
+		nvkm_error(&sb->subdev, "invalid secure boot falcon\n");
+		return -EINVAL;
+	};
+
+	nvkm_debug(&sb->subdev, "securely managed falcons:\n");
+	for_each_set_bit(fid, &sb->func->managed_falcons,
+			 NVKM_SECBOOT_FALCON_END)
+		nvkm_debug(&sb->subdev, "- %s\n", managed_falcons_names[fid]);
+
+	return 0;
+}
diff --git a/drm/nouveau/nvkm/subdev/secboot/priv.h b/drm/nouveau/nvkm/subdev/secboot/priv.h
new file mode 100644
index 000000000000..44ef4b3d8824
--- /dev/null
+++ b/drm/nouveau/nvkm/subdev/secboot/priv.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright (c) 2015, NVIDIA CORPORATION. All rights reserved.
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
+#ifndef __NVKM_SECBOOT_PRIV_H__
+#define __NVKM_SECBOOT_PRIV_H__
+
+#include <subdev/secboot.h>
+#include <subdev/mmu.h>
+
+struct nvkm_secboot_func {
+	int (*init)(struct nvkm_secboot *);
+	int (*fini)(struct nvkm_secboot *, bool suspend);
+	void *(*dtor)(struct nvkm_secboot *);
+	int (*prepare_blobs)(struct nvkm_secboot *);
+	int (*reset)(struct nvkm_secboot *, enum nvkm_secboot_falcon);
+	int (*start)(struct nvkm_secboot *, enum nvkm_secboot_falcon);
+
+	/* ID of the falcon that will perform secure boot */
+	enum nvkm_secboot_falcon boot_falcon;
+	/* Bit-mask of IDs of managed falcons */
+	unsigned long managed_falcons;
+};
+
+int nvkm_secboot_ctor(const struct nvkm_secboot_func *, struct nvkm_device *,
+		      int index, struct nvkm_secboot *);
+int nvkm_secboot_falcon_reset(struct nvkm_secboot *);
+int nvkm_secboot_falcon_run(struct nvkm_secboot *);
+
+#endif
-- 
2.7.1
