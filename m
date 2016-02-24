From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 11/11] secboot/gm20b: add secure boot support
Date: Wed, 24 Feb 2016 14:42:24 +0900
Message-ID: <1456292544-32206-12-git-send-email-acourbot@nvidia.com>
References: <1456292544-32206-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456292544-32206-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add secure boot support for the GM20B chip found in Tegra X1. Secure
boot on Tegra works slightly differently from desktop, notably in the
way the WPR region is set up.

In addition, the firmware bootloaders use a slightly different header
format.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/include/nvkm/subdev/secboot.h |   1 +
 drm/nouveau/nvkm/engine/device/base.c     |   1 +
 drm/nouveau/nvkm/engine/gr/gm20b.c        |   9 +-
 drm/nouveau/nvkm/subdev/secboot/Kbuild    |   1 +
 drm/nouveau/nvkm/subdev/secboot/gm20b.c   | 233 ++++++++++++++++++++++++++++++
 5 files changed, 242 insertions(+), 3 deletions(-)
 create mode 100644 drm/nouveau/nvkm/subdev/secboot/gm20b.c

diff --git a/drm/nouveau/include/nvkm/subdev/secboot.h b/drm/nouveau/include/nvkm/subdev/secboot.h
index a509f2b4aa5f..c6edd95a5b69 100644
--- a/drm/nouveau/include/nvkm/subdev/secboot.h
+++ b/drm/nouveau/include/nvkm/subdev/secboot.h
@@ -54,5 +54,6 @@ int nvkm_secboot_reset(struct nvkm_secboot *, u32 falcon);
 int nvkm_secboot_start(struct nvkm_secboot *, u32 falcon);
 
 int gm200_secboot_new(struct nvkm_device *, int, struct nvkm_secboot **);
+int gm20b_secboot_new(struct nvkm_device *, int, struct nvkm_secboot **);
 
 #endif
diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index ab56abac0bc5..7a315ac8c800 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2075,6 +2075,7 @@ nv12b_chipset = {
 	.fifo = gm20b_fifo_new,
 	.gr = gm20b_gr_new,
 	.sw = gf100_sw_new,
+	.secboot = gm20b_secboot_new,
 };
 
 static int
diff --git a/drm/nouveau/nvkm/engine/gr/gm20b.c b/drm/nouveau/nvkm/engine/gr/gm20b.c
index a440772f8de4..29732bc14415 100644
--- a/drm/nouveau/nvkm/engine/gr/gm20b.c
+++ b/drm/nouveau/nvkm/engine/gr/gm20b.c
@@ -32,12 +32,15 @@ gm20b_gr_init_gpc_mmu(struct gf100_gr *gr)
 	struct nvkm_device *device = gr->base.engine.subdev.device;
 	u32 val;
 
-	/* TODO this needs to be removed once secure boot works */
-	if (1) {
+	/* Bypass MMU check for non-secure boot */
+	if (!device->secboot) {
 		nvkm_wr32(device, 0x100ce4, 0xffffffff);
+
+		if (nvkm_rd32(device, 0x100ce4) != 0xffffffff)
+			nvdev_warn(device,
+			  "cannot bypass secure boot - expect failure soon!\n");
 	}
 
-	/* TODO update once secure boot works */
 	val = nvkm_rd32(device, 0x100c80);
 	val &= 0xf000087f;
 	nvkm_wr32(device, 0x418880, val);
diff --git a/drm/nouveau/nvkm/subdev/secboot/Kbuild b/drm/nouveau/nvkm/subdev/secboot/Kbuild
index c1abf59410d1..b02b868a6589 100644
--- a/drm/nouveau/nvkm/subdev/secboot/Kbuild
+++ b/drm/nouveau/nvkm/subdev/secboot/Kbuild
@@ -1,2 +1,3 @@
 nvkm-y += nvkm/subdev/secboot/base.o
 nvkm-y += nvkm/subdev/secboot/gm200.o
+nvkm-y += nvkm/subdev/secboot/gm20b.o
diff --git a/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drm/nouveau/nvkm/subdev/secboot/gm20b.c
new file mode 100644
index 000000000000..684320484b70
--- /dev/null
+++ b/drm/nouveau/nvkm/subdev/secboot/gm20b.c
@@ -0,0 +1,233 @@
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
+
+#include <core/gpuobj.h>
+
+/*
+ * The BL header format used by GM20B's firmware is slightly different
+ * from the one of GM200. Fix the differences here.
+ */
+struct gm20b_flcn_bl_desc {
+	u32 reserved[4];
+	u32 signature[4];
+	u32 ctx_dma;
+	u32 code_dma_base;
+	u32 non_sec_code_off;
+	u32 non_sec_code_size;
+	u32 sec_code_off;
+	u32 sec_code_size;
+	u32 code_entry_point;
+	u32 data_dma_base;
+	u32 data_size;
+};
+
+/**
+ * gm20b_secboot_fixup_bl_desc - adapt BL descriptor to format used by GM20B FW
+ *
+ * There is only a slight format difference (DMA addresses being 32-bits and
+ * 256B-aligned) to address.
+ */
+static void
+gm20b_secboot_fixup_bl_desc(const struct gm200_flcn_bl_desc *desc, void *ret)
+{
+	struct gm20b_flcn_bl_desc *gdesc = ret;
+	u64 addr;
+
+	memcpy(gdesc->reserved, desc->reserved, sizeof(gdesc->reserved));
+	memcpy(gdesc->signature, desc->signature, sizeof(gdesc->signature));
+	gdesc->ctx_dma = desc->ctx_dma;
+	addr = desc->code_dma_base.hi;
+	addr <<= 32;
+	addr |= desc->code_dma_base.lo;
+	gdesc->code_dma_base = lower_32_bits(addr >> 8);
+	gdesc->non_sec_code_off = desc->non_sec_code_off;
+	gdesc->non_sec_code_size = desc->non_sec_code_size;
+	gdesc->sec_code_off = desc->sec_code_off;
+	gdesc->sec_code_size = desc->sec_code_size;
+	gdesc->code_entry_point = desc->code_entry_point;
+	addr = desc->data_dma_base.hi;
+	addr <<= 32;
+	addr |= desc->data_dma_base.lo;
+	gdesc->data_dma_base = lower_32_bits(addr >> 8);
+	gdesc->data_size = desc->data_size;
+}
+
+static void
+gm20b_secboot_fixup_hs_desc(struct gm200_secboot *gsb,
+			    struct hsflcn_acr_desc *desc)
+{
+	desc->ucode_blob_base = gsb->ls_blob->addr;
+	desc->ucode_blob_size = gsb->ls_blob->size;
+
+	desc->wpr_offset = 0;
+}
+
+static const struct gm200_secboot_func
+gm20b_secboot_func = {
+	.bl_desc_size = sizeof(struct gm20b_flcn_bl_desc),
+	.fixup_bl_desc = gm20b_secboot_fixup_bl_desc,
+	.fixup_hs_desc = gm20b_secboot_fixup_hs_desc,
+};
+
+
+#ifdef CONFIG_ARCH_TEGRA
+#define TEGRA_MC_BASE				0x70019000
+#define MC_SECURITY_CARVEOUT2_CFG0		0xc58
+#define MC_SECURITY_CARVEOUT2_BOM_0		0xc5c
+#define MC_SECURITY_CARVEOUT2_BOM_HI_0		0xc60
+#define MC_SECURITY_CARVEOUT2_SIZE_128K		0xc64
+#define TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED	(1 << 1)
+/**
+ * sb_tegra_read_wpr() - read the WPR registers on Tegra
+ *
+ * On dGPU, we can manage the WPR region ourselves, but on Tegra the WPR region
+ * is reserved from system memory by the bootloader and irreversibly locked.
+ * This function reads the address and size of the pre-configured WPR region.
+ */
+static int
+gm20b_tegra_read_wpr(struct gm200_secboot *gsb)
+{
+	struct nvkm_secboot *sb = &gsb->base;
+	void __iomem *mc;
+	u32 cfg;
+
+	mc = ioremap(TEGRA_MC_BASE, 0xd00);
+	if (!mc) {
+		nvkm_error(&sb->subdev, "Cannot map Tegra MC registers\n");
+		return PTR_ERR(mc);
+	}
+	gsb->wpr_addr = ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_0) |
+	      ((u64)ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_HI_0) << 32);
+	gsb->wpr_size = ioread32_native(mc + MC_SECURITY_CARVEOUT2_SIZE_128K)
+		<< 17;
+	cfg = ioread32_native(mc + MC_SECURITY_CARVEOUT2_CFG0);
+	iounmap(mc);
+
+	/* Check that WPR settings are valid */
+	if (gsb->wpr_size == 0) {
+		nvkm_error(&sb->subdev, "WPR region is empty\n");
+		return -EINVAL;
+	}
+
+	if (!(cfg & TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED)) {
+		nvkm_error(&sb->subdev, "WPR region not locked\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+#else
+static int
+gm20b_tegra_read_wpr(struct gm200_secboot *gsb)
+{
+	nvkm_error(&gsb->base.subdev, "Tegra support not compiled in\n");
+	return -EINVAL;
+}
+#endif
+
+static int
+gm20b_secboot_prepare_blobs(struct nvkm_secboot *sb)
+{
+	struct gm200_secboot *gsb = gm200_secboot(sb);
+	int acr_size;
+	int ret;
+
+	ret = gm20x_secboot_prepare_blobs(gsb);
+	if (ret)
+		return ret;
+
+	acr_size = gsb->acr_load_blob->size;
+	/*
+	 * On Tegra the WPR region is set by the bootloader. It is illegal for
+	 * the HS blob to be larger than this region.
+	 */
+	if (acr_size > gsb->wpr_size) {
+		nvkm_error(&sb->subdev, "WPR region too small for FW blob!\n");
+		nvkm_error(&sb->subdev, "required: %dB\n", acr_size);
+		nvkm_error(&sb->subdev, "WPR size: %dB\n", gsb->wpr_size);
+		return -ENOSPC;
+	}
+
+	return 0;
+}
+
+static int
+gm20b_secboot_init(struct nvkm_secboot *sb)
+{
+	struct gm200_secboot *gsb = gm200_secboot(sb);
+	int ret;
+
+	ret = gm20b_tegra_read_wpr(gsb);
+	if (ret)
+		return ret;
+
+	return gm200_secboot_init(sb);
+}
+
+static const struct nvkm_secboot_func
+gm20b_secboot = {
+	.dtor = gm200_secboot_dtor,
+	.init = gm20b_secboot_init,
+	.prepare_blobs = gm20b_secboot_prepare_blobs,
+	.reset = gm200_secboot_reset,
+	.start = gm200_secboot_start,
+	.managed_falcons = BIT(NVKM_SECBOOT_FALCON_FECS),
+	.boot_falcon = NVKM_SECBOOT_FALCON_PMU,
+};
+
+int
+gm20b_secboot_new(struct nvkm_device *device, int index,
+		  struct nvkm_secboot **psb)
+{
+	int ret;
+	struct gm200_secboot *gsb;
+
+	gsb = kzalloc(sizeof(*gsb), GFP_KERNEL);
+	if (!gsb) {
+		psb = NULL;
+		return -ENOMEM;
+	}
+	*psb = &gsb->base;
+
+	ret = nvkm_secboot_ctor(&gm20b_secboot, device, index, &gsb->base);
+	if (ret)
+		return ret;
+
+	gsb->func = &gm20b_secboot_func;
+
+	return 0;
+}
+
+MODULE_FIRMWARE("nvidia/gm20b/acr/bl.bin");
+MODULE_FIRMWARE("nvidia/gm20b/acr/ucode_load.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gr/fecs_bl.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gr/fecs_inst.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gr/fecs_data.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gr/fecs_sig.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gr/gpccs_inst.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gr/gpccs_data.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gr/sw_ctx.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gr/sw_nonctx.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gr/sw_bundle_init.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gr/sw_method_init.bin");
-- 
2.7.1
