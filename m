From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/7] drm/tegra: Add falcon helper library
Date: Wed, 14 Dec 2016 13:16:12 +0200
Message-ID: <20161214111617.24548-3-mperttunen@nvidia.com>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214111617.24548-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add a set of falcon helper routines for use by the tegradrm client drivers
of the various falcon-based engines.

The falcon is a microcontroller that acts as a frontend for the rest of a
particular Tegra engine.  In order to properly utilize these engines, the
frontend must be booted before pushing any commands.

Based on work by Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/Makefile |   3 +-
 drivers/gpu/drm/tegra/falcon.c | 259 +++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/falcon.h | 127 ++++++++++++++++++++
 3 files changed, 388 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tegra/falcon.c
 create mode 100644 drivers/gpu/drm/tegra/falcon.h

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index 2c66a8d..93e9a4a 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -13,6 +13,7 @@ tegra-drm-y := \
 	sor.o \
 	dpaux.o \
 	gr2d.o \
-	gr3d.o
+	gr3d.o \
+	falcon.o
 
 obj-$(CONFIG_DRM_TEGRA) += tegra-drm.o
diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
new file mode 100644
index 0000000..f685e729
--- /dev/null
+++ b/drivers/gpu/drm/tegra/falcon.c
@@ -0,0 +1,259 @@
+/*
+ * Copyright (c) 2015, NVIDIA Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/pci_ids.h>
+#include <linux/iopoll.h>
+
+#include "falcon.h"
+#include "drm.h"
+
+enum falcon_memory {
+	FALCON_MEMORY_IMEM,
+	FALCON_MEMORY_DATA,
+};
+
+static void falcon_writel(struct falcon *falcon, u32 value, u32 offset)
+{
+	writel(value, falcon->regs + offset);
+}
+
+int falcon_wait_idle(struct falcon *falcon)
+{
+	u32 value;
+
+	return readl_poll_timeout(falcon->regs + FALCON_IDLESTATE, value,
+				  (value == 0), 10, 100000);
+}
+
+static int falcon_dma_wait_idle(struct falcon *falcon)
+{
+	u32 value;
+
+	return readl_poll_timeout(falcon->regs + FALCON_DMATRFCMD, value,
+				  (value & FALCON_DMATRFCMD_IDLE), 10, 100000);
+}
+
+static int falcon_copy_chunk(struct falcon *falcon,
+			     phys_addr_t base,
+			     unsigned long offset,
+			     enum falcon_memory target)
+{
+	u32 cmd = FALCON_DMATRFCMD_SIZE_256B;
+
+	if (target == FALCON_MEMORY_IMEM)
+		cmd |= FALCON_DMATRFCMD_IMEM;
+
+	falcon_writel(falcon, offset, FALCON_DMATRFMOFFS);
+	falcon_writel(falcon, base, FALCON_DMATRFFBOFFS);
+	falcon_writel(falcon, cmd, FALCON_DMATRFCMD);
+
+	return falcon_dma_wait_idle(falcon);
+}
+
+static void falcon_copy_firmware_image(struct falcon *falcon,
+				       const struct firmware *firmware)
+{
+	u32 *firmware_vaddr = falcon->firmware.vaddr;
+	dma_addr_t daddr;
+	size_t i;
+	int err;
+
+	/* copy the whole thing taking into account endianness */
+	for (i = 0; i < firmware->size / sizeof(u32); i++)
+		firmware_vaddr[i] = le32_to_cpu(((u32 *)firmware->data)[i]);
+
+	/* ensure that caches are flushed and falcon can see the firmware */
+	daddr = dma_map_single(falcon->dev, firmware_vaddr,
+			       falcon->firmware.size, DMA_TO_DEVICE);
+	err = dma_mapping_error(falcon->dev, daddr);
+	if (err) {
+		dev_err(falcon->dev, "failed to map firmware: %d\n", err);
+		return;
+	}
+	dma_sync_single_for_device(falcon->dev, daddr,
+				   falcon->firmware.size, DMA_TO_DEVICE);
+	dma_unmap_single(falcon->dev, daddr, falcon->firmware.size,
+			 DMA_TO_DEVICE);
+}
+
+static int falcon_parse_firmware_image(struct falcon *falcon)
+{
+	struct falcon_fw_bin_header_v1 *bin = (void *)falcon->firmware.vaddr;
+	struct falcon_fw_os_header_v1 *os;
+
+	/* endian problems would show up right here */
+	if (bin->magic != PCI_VENDOR_ID_NVIDIA) {
+		dev_err(falcon->dev, "incorrect firmware magic\n");
+		return -EINVAL;
+	}
+
+	/* currently only version 1 is supported */
+	if (bin->version != 1) {
+		dev_err(falcon->dev, "unsupported firmware version\n");
+		return -EINVAL;
+	}
+
+	/* check that the firmware size is consistent */
+	if (bin->size > falcon->firmware.size) {
+		dev_err(falcon->dev, "firmware image size inconsistency\n");
+		return -EINVAL;
+	}
+
+	os = falcon->firmware.vaddr + bin->os_header_offset;
+
+	falcon->firmware.bin_data.size = bin->os_size;
+	falcon->firmware.bin_data.offset = bin->os_data_offset;
+	falcon->firmware.code.offset = os->code_offset;
+	falcon->firmware.code.size = os->code_size;
+	falcon->firmware.data.offset = os->data_offset;
+	falcon->firmware.data.size = os->data_size;
+
+	return 0;
+}
+
+int falcon_read_firmware(struct falcon *falcon, const char *name)
+{
+	int err;
+
+	/* request_firmware prints error if it fails */
+	err = request_firmware(&falcon->firmware.firmware, name, falcon->dev);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+int falcon_load_firmware(struct falcon *falcon)
+{
+	const struct firmware *firmware = falcon->firmware.firmware;
+	int err;
+
+	falcon->firmware.size = firmware->size;
+
+	/* allocate iova space for the firmware */
+	falcon->firmware.vaddr = falcon->ops->alloc(falcon, firmware->size,
+						    &falcon->firmware.paddr);
+	if (!falcon->firmware.vaddr) {
+		dev_err(falcon->dev, "dma memory mapping failed\n");
+		return -ENOMEM;
+	}
+
+	/* copy firmware image into local area. this also ensures endianness */
+	falcon_copy_firmware_image(falcon, firmware);
+
+	/* parse the image data */
+	err = falcon_parse_firmware_image(falcon);
+	if (err < 0) {
+		dev_err(falcon->dev, "failed to parse firmware image\n");
+		goto err_setup_firmware_image;
+	}
+
+	release_firmware(firmware);
+	falcon->firmware.firmware = NULL;
+
+	return 0;
+
+err_setup_firmware_image:
+	falcon->ops->free(falcon, falcon->firmware.size,
+			  falcon->firmware.paddr, falcon->firmware.vaddr);
+
+	return err;
+}
+
+int falcon_init(struct falcon *falcon)
+{
+	/* check mandatory ops */
+	if (!falcon->ops || !falcon->ops->alloc || !falcon->ops->free)
+		return -EINVAL;
+
+	falcon->firmware.vaddr = NULL;
+
+	return 0;
+}
+
+void falcon_exit(struct falcon *falcon)
+{
+	if (falcon->firmware.firmware) {
+		release_firmware(falcon->firmware.firmware);
+		falcon->firmware.firmware = NULL;
+	}
+
+	if (falcon->firmware.vaddr) {
+		falcon->ops->free(falcon, falcon->firmware.size,
+				  falcon->firmware.paddr,
+				  falcon->firmware.vaddr);
+		falcon->firmware.vaddr = NULL;
+	}
+}
+
+int falcon_boot(struct falcon *falcon)
+{
+	unsigned long offset;
+	int err;
+
+	if (!falcon->firmware.vaddr)
+		return -EINVAL;
+
+	falcon_writel(falcon, 0, FALCON_DMACTL);
+
+	/* setup the address of the binary data so Falcon can access it later */
+	falcon_writel(falcon, (falcon->firmware.paddr +
+			       falcon->firmware.bin_data.offset) >> 8,
+		      FALCON_DMATRFBASE);
+
+	/* copy the data segment into Falcon internal memory */
+	for (offset = 0; offset < falcon->firmware.data.size; offset += 256)
+		falcon_copy_chunk(falcon,
+				  falcon->firmware.data.offset + offset,
+				  offset, FALCON_MEMORY_DATA);
+
+	/* copy the first code segment into Falcon internal memory */
+	falcon_copy_chunk(falcon, falcon->firmware.code.offset,
+			  0, FALCON_MEMORY_IMEM);
+
+	/* setup falcon interrupts */
+	falcon_writel(falcon, FALCON_IRQMSET_EXT(0xff) |
+			      FALCON_IRQMSET_SWGEN1 |
+			      FALCON_IRQMSET_SWGEN0 |
+			      FALCON_IRQMSET_EXTERR |
+			      FALCON_IRQMSET_HALT |
+			      FALCON_IRQMSET_WDTMR,
+		      FALCON_IRQMSET);
+	falcon_writel(falcon, FALCON_IRQDEST_EXT(0xff) |
+			      FALCON_IRQDEST_SWGEN1 |
+			      FALCON_IRQDEST_SWGEN0 |
+			      FALCON_IRQDEST_EXTERR |
+			      FALCON_IRQDEST_HALT,
+		      FALCON_IRQDEST);
+
+	/* enable interface */
+	falcon_writel(falcon, FALCON_ITFEN_MTHDEN |
+			      FALCON_ITFEN_CTXEN,
+		      FALCON_ITFEN);
+
+	/* boot falcon */
+	falcon_writel(falcon, 0x00000000, FALCON_BOOTVEC);
+	falcon_writel(falcon, FALCON_CPUCTL_STARTCPU, FALCON_CPUCTL);
+
+	err = falcon_wait_idle(falcon);
+	if (err < 0) {
+		dev_err(falcon->dev, "Falcon boot failed due to timeout\n");
+		return err;
+	}
+
+	return 0;
+}
+
+void falcon_execute_method(struct falcon *falcon, u32 method, u32 data)
+{
+	falcon_writel(falcon, method >> 2, FALCON_UCLASS_METHOD_OFFSET);
+	falcon_writel(falcon, data, FALCON_UCLASS_METHOD_DATA);
+}
diff --git a/drivers/gpu/drm/tegra/falcon.h b/drivers/gpu/drm/tegra/falcon.h
new file mode 100644
index 0000000..4504ed5
--- /dev/null
+++ b/drivers/gpu/drm/tegra/falcon.h
@@ -0,0 +1,127 @@
+/*
+ * Copyright (c) 2015, NVIDIA Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _FALCON_H_
+#define _FALCON_H_
+
+#include <linux/types.h>
+
+#define FALCON_UCLASS_METHOD_OFFSET		0x00000040
+
+#define FALCON_UCLASS_METHOD_DATA		0x00000044
+
+#define FALCON_IRQMSET				0x00001010
+#define FALCON_IRQMSET_WDTMR			(1 << 1)
+#define FALCON_IRQMSET_HALT			(1 << 4)
+#define FALCON_IRQMSET_EXTERR			(1 << 5)
+#define FALCON_IRQMSET_SWGEN0			(1 << 6)
+#define FALCON_IRQMSET_SWGEN1			(1 << 7)
+#define FALCON_IRQMSET_EXT(v)			(((v) & 0xff) << 8)
+
+#define FALCON_IRQDEST				0x0000101c
+#define FALCON_IRQDEST_HALT			(1 << 4)
+#define FALCON_IRQDEST_EXTERR			(1 << 5)
+#define FALCON_IRQDEST_SWGEN0			(1 << 6)
+#define FALCON_IRQDEST_SWGEN1			(1 << 7)
+#define FALCON_IRQDEST_EXT(v)			(((v) & 0xff) << 8)
+
+#define FALCON_ITFEN				0x00001048
+#define FALCON_ITFEN_CTXEN			(1 << 0)
+#define FALCON_ITFEN_MTHDEN			(1 << 1)
+
+#define FALCON_IDLESTATE			0x0000104c
+
+#define FALCON_CPUCTL				0x00001100
+#define FALCON_CPUCTL_STARTCPU			(1 << 1)
+
+#define FALCON_BOOTVEC				0x00001104
+
+#define FALCON_DMACTL				0x0000110c
+#define FALCON_DMACTL_DMEM_SCRUBBING		(1 << 1)
+#define FALCON_DMACTL_IMEM_SCRUBBING		(1 << 2)
+
+#define FALCON_DMATRFBASE			0x00001110
+
+#define FALCON_DMATRFMOFFS			0x00001114
+
+#define FALCON_DMATRFCMD			0x00001118
+#define FALCON_DMATRFCMD_IDLE			(1 << 1)
+#define FALCON_DMATRFCMD_IMEM			(1 << 4)
+#define FALCON_DMATRFCMD_SIZE_256B		(6 << 8)
+
+#define FALCON_DMATRFFBOFFS			0x0000111c
+
+struct falcon_fw_bin_header_v1 {
+	u32 magic;		/* 0x10de */
+	u32 version;		/* version of bin format (1) */
+	u32 size;		/* entire image size including this header */
+	u32 os_header_offset;
+	u32 os_data_offset;
+	u32 os_size;
+};
+
+struct falcon_fw_os_app_v1 {
+	u32 offset;
+	u32 size;
+};
+
+struct falcon_fw_os_header_v1 {
+	u32 code_offset;
+	u32 code_size;
+	u32 data_offset;
+	u32 data_size;
+};
+
+struct falcon;
+
+struct falcon_ops {
+	void *(*alloc)(struct falcon *falcon, size_t size,
+		       dma_addr_t *paddr);
+	void (*free)(struct falcon *falcon, size_t size,
+		     dma_addr_t paddr, void *vaddr);
+};
+
+struct falcon_firmware_section {
+	unsigned long offset;
+	size_t size;
+};
+
+struct falcon_firmware {
+	/* Firmware after it is read but not loaded */
+	const struct firmware *firmware;
+
+	/* Raw firmware data */
+	dma_addr_t paddr;
+	void *vaddr;
+	size_t size;
+
+	/* Parsed firmware information */
+	struct falcon_firmware_section bin_data;
+	struct falcon_firmware_section data;
+	struct falcon_firmware_section code;
+};
+
+struct falcon {
+	/* Set by falcon client */
+	struct device *dev;
+	void __iomem *regs;
+	const struct falcon_ops *ops;
+	void *data;
+
+	struct falcon_firmware firmware;
+};
+
+int falcon_init(struct falcon *falcon);
+void falcon_exit(struct falcon *falcon);
+int falcon_read_firmware(struct falcon *falcon, const char *firmware_name);
+int falcon_load_firmware(struct falcon *falcon);
+int falcon_boot(struct falcon *falcon);
+void falcon_execute_method(struct falcon *falcon, u32 method, u32 data);
+int falcon_wait_idle(struct falcon *falcon);
+
+#endif /* _FALCON_H_ */
-- 
2.10.2
