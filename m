From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/8] drm/tegra: Add VIC support
Date: Thu, 10 Nov 2016 20:23:41 +0200
Message-ID: <20161110182345.31777-5-mperttunen@nvidia.com>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161110182345.31777-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This patch adds support for Video Image Compositor engine which
can be used for 2d operations.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/Makefile |   3 +-
 drivers/gpu/drm/tegra/drm.c    |   3 +
 drivers/gpu/drm/tegra/drm.h    |   1 +
 drivers/gpu/drm/tegra/vic.c    | 400 +++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/vic.h    |  31 ++++
 include/linux/host1x.h         |   1 +
 6 files changed, 438 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tegra/vic.c
 create mode 100644 drivers/gpu/drm/tegra/vic.h

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index 93e9a4a..6af3a9a 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -14,6 +14,7 @@ tegra-drm-y := \
 	dpaux.o \
 	gr2d.o \
 	gr3d.o \
-	falcon.o
+	falcon.o \
+	vic.o
 
 obj-$(CONFIG_DRM_TEGRA) += tegra-drm.o
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ecfe7ba..707404d 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1151,11 +1151,13 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra124-sor", },
 	{ .compatible = "nvidia,tegra124-hdmi", },
 	{ .compatible = "nvidia,tegra124-dsi", },
+	{ .compatible = "nvidia,tegra124-vic", },
 	{ .compatible = "nvidia,tegra132-dsi", },
 	{ .compatible = "nvidia,tegra210-dc", },
 	{ .compatible = "nvidia,tegra210-dsi", },
 	{ .compatible = "nvidia,tegra210-sor", },
 	{ .compatible = "nvidia,tegra210-sor1", },
+	{ .compatible = "nvidia,tegra210-vic", },
 	{ /* sentinel */ }
 };
 
@@ -1177,6 +1179,7 @@ static struct platform_driver * const drivers[] = {
 	&tegra_sor_driver,
 	&tegra_gr2d_driver,
 	&tegra_gr3d_driver,
+	&tegra_vic_driver,
 };
 
 static int __init host1x_drm_init(void)
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index f75b505..8efaaa4 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -292,5 +292,6 @@ extern struct platform_driver tegra_dpaux_driver;
 extern struct platform_driver tegra_sor_driver;
 extern struct platform_driver tegra_gr2d_driver;
 extern struct platform_driver tegra_gr3d_driver;
+extern struct platform_driver tegra_vic_driver;
 
 #endif /* HOST1X_DRM_H */
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
new file mode 100644
index 0000000..9eda5e5
--- /dev/null
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -0,0 +1,400 @@
+/*
+ * Copyright (c) 2015, NVIDIA Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/clk.h>
+#include <linux/host1x.h>
+#include <linux/iommu.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <soc/tegra/pmc.h>
+
+#include "drm.h"
+#include "falcon.h"
+#include "vic.h"
+
+struct vic_config {
+	/* Firmware name */
+	const char *ucode_name;
+};
+
+struct vic {
+	struct falcon falcon;
+	bool booted;
+
+	void __iomem *regs;
+	struct tegra_drm_client client;
+	struct host1x_channel *channel;
+	struct iommu_domain *domain;
+	struct device *dev;
+	struct clk *clk;
+
+	/* Platform configuration */
+	const struct vic_config *config;
+};
+
+static inline struct vic *to_vic(struct tegra_drm_client *client)
+{
+	return container_of(client, struct vic, client);
+}
+
+static void vic_writel(struct vic *vic, u32 value, unsigned int offset)
+{
+	writel(value, vic->regs + offset);
+}
+
+static int vic_runtime_resume(struct device *dev)
+{
+	struct vic *vic = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(vic->clk);
+}
+
+static int vic_runtime_suspend(struct device *dev)
+{
+	struct vic *vic = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(vic->clk);
+
+	vic->booted = false;
+
+	return 0;
+}
+
+static int vic_boot(struct vic *vic)
+{
+	u32 fce_ucode_size, fce_bin_data_offset;
+	void *hdr;
+	int err = 0;
+
+	if (vic->booted)
+		return 0;
+
+	if (!vic->falcon.firmware.valid) {
+		err = falcon_read_firmware(&vic->falcon,
+					   vic->config->ucode_name);
+		if (err < 0)
+			return err;
+	}
+
+	/* setup clockgating registers */
+	vic_writel(vic, CG_IDLE_CG_DLY_CNT(4) |
+			CG_IDLE_CG_EN |
+			CG_WAKEUP_DLY_CNT(4),
+		   NV_PVIC_MISC_PRI_VIC_CG);
+
+	err = falcon_boot(&vic->falcon);
+	if (err < 0)
+		return err;
+
+	hdr = vic->falcon.firmware.vaddr;
+	fce_bin_data_offset = *(u32 *)(hdr + VIC_UCODE_FCE_DATA_OFFSET);
+	hdr = vic->falcon.firmware.vaddr +
+		*(u32 *)(hdr + VIC_UCODE_FCE_HEADER_OFFSET);
+	fce_ucode_size = *(u32 *)(hdr + FCE_UCODE_SIZE_OFFSET);
+
+	falcon_execute_method(&vic->falcon, VIC_SET_APPLICATION_ID, 1);
+	falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_SIZE,
+			      fce_ucode_size);
+	falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_OFFSET,
+			      (vic->falcon.firmware.paddr + fce_bin_data_offset)
+				>> 8);
+
+	err = falcon_wait_idle(&vic->falcon);
+	if (err < 0) {
+		dev_err(vic->dev,
+			"failed to set application ID and FCE base\n");
+		return err;
+	}
+
+	vic->booted = true;
+
+	return 0;
+}
+
+static void *vic_falcon_alloc(struct falcon *falcon, size_t size,
+			       dma_addr_t *iova)
+{
+	struct tegra_drm *tegra = falcon->data;
+
+	return tegra_drm_alloc(tegra, size, iova);
+}
+
+static void vic_falcon_free(struct falcon *falcon, size_t size,
+			    dma_addr_t iova, void *va)
+{
+	struct tegra_drm *tegra = falcon->data;
+
+	return tegra_drm_free(tegra, size, va, iova);
+}
+
+static const struct falcon_ops vic_falcon_ops = {
+	.alloc = vic_falcon_alloc,
+	.free = vic_falcon_free
+};
+
+static int vic_init(struct host1x_client *client)
+{
+	struct tegra_drm_client *drm = host1x_to_drm_client(client);
+	struct drm_device *dev = dev_get_drvdata(client->parent);
+	struct tegra_drm *tegra = dev->dev_private;
+	struct vic *vic = to_vic(drm);
+	int err;
+
+	if (tegra->domain) {
+		err = iommu_attach_device(tegra->domain, vic->dev);
+		if (err < 0) {
+			dev_err(vic->dev, "failed to attach to domain: %d\n",
+				err);
+			return err;
+		}
+
+		vic->domain = tegra->domain;
+	}
+
+	vic->falcon.dev = vic->dev;
+	vic->falcon.regs = vic->regs;
+	vic->falcon.data = tegra;
+	vic->falcon.ops = &vic_falcon_ops;
+	err = falcon_init(&vic->falcon);
+	if (err < 0)
+		goto detach_device;
+
+	vic->channel = host1x_channel_request(client->dev);
+	if (!vic->channel) {
+		err = -ENOMEM;
+		goto exit_falcon;
+	}
+
+	client->syncpts[0] = host1x_syncpt_request(client->dev, 0);
+	if (!client->syncpts[0]) {
+		err = -ENOMEM;
+		goto free_channel;
+	}
+
+	err = tegra_drm_register_client(tegra, drm);
+	if (err < 0)
+		goto free_syncpt;
+
+	return 0;
+
+free_syncpt:
+	host1x_syncpt_free(client->syncpts[0]);
+free_channel:
+	host1x_channel_free(vic->channel);
+exit_falcon:
+	falcon_exit(&vic->falcon);
+detach_device:
+	if (tegra->domain)
+		iommu_detach_device(tegra->domain, vic->dev);
+
+	return err;
+}
+
+static int vic_exit(struct host1x_client *client)
+{
+	struct tegra_drm_client *drm = host1x_to_drm_client(client);
+	struct drm_device *dev = dev_get_drvdata(client->parent);
+	struct tegra_drm *tegra = dev->dev_private;
+	struct vic *vic = to_vic(drm);
+	int err;
+
+	err = tegra_drm_unregister_client(tegra, drm);
+	if (err < 0)
+		return err;
+
+	host1x_syncpt_free(client->syncpts[0]);
+	host1x_channel_free(vic->channel);
+
+	falcon_exit(&vic->falcon);
+
+	if (vic->domain) {
+		iommu_detach_device(vic->domain, vic->dev);
+		vic->domain = NULL;
+	}
+
+	return 0;
+}
+
+static const struct host1x_client_ops vic_client_ops = {
+	.init = vic_init,
+	.exit = vic_exit,
+};
+
+static int vic_open_channel(struct tegra_drm_client *client,
+			    struct tegra_drm_context *context)
+{
+	struct vic *vic = to_vic(client);
+	int err;
+
+	err = pm_runtime_get_sync(vic->dev);
+	if (err < 0)
+		return err;
+
+	/*
+	 * Try to boot the Falcon microcontroller. Booting is deferred until
+	 * here because the firmware might not yet be available during system
+	 * boot, for example if it's on remote storage.
+	 */
+	err = vic_boot(vic);
+	if (err < 0) {
+		pm_runtime_put(vic->dev);
+		return err;
+	}
+
+	context->channel = host1x_channel_get(vic->channel);
+	if (!context->channel) {
+		pm_runtime_put(vic->dev);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void vic_close_channel(struct tegra_drm_context *context)
+{
+	struct vic *vic = to_vic(context->client);
+
+	host1x_channel_put(context->channel);
+
+	pm_runtime_put(vic->dev);
+}
+
+static const struct tegra_drm_client_ops vic_ops = {
+	.open_channel = vic_open_channel,
+	.close_channel = vic_close_channel,
+	.submit = tegra_drm_submit,
+};
+
+static const struct vic_config vic_t124_config = {
+	.ucode_name = "nvidia/tegra124/vic03_ucode.bin",
+};
+
+static const struct vic_config vic_t210_config = {
+	.ucode_name = "nvidia/tegra210/vic04_ucode.bin",
+};
+
+static const struct of_device_id vic_match[] = {
+	{ .compatible = "nvidia,tegra124-vic", .data = &vic_t124_config },
+	{ .compatible = "nvidia,tegra210-vic", .data = &vic_t210_config },
+	{ },
+};
+
+static int vic_probe(struct platform_device *pdev)
+{
+	struct vic_config *vic_config = NULL;
+	struct device *dev = &pdev->dev;
+	struct host1x_syncpt **syncpts;
+	struct resource *regs;
+	const struct of_device_id *match;
+	struct vic *vic;
+	int err;
+
+	match = of_match_device(vic_match, dev);
+	vic_config = (struct vic_config *)match->data;
+
+	vic = devm_kzalloc(dev, sizeof(*vic), GFP_KERNEL);
+	if (!vic)
+		return -ENOMEM;
+
+	syncpts = devm_kzalloc(dev, sizeof(*syncpts), GFP_KERNEL);
+	if (!syncpts)
+		return -ENOMEM;
+
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!regs) {
+		dev_err(&pdev->dev, "failed to get registers\n");
+		return -ENXIO;
+	}
+
+	vic->regs = devm_ioremap_resource(dev, regs);
+	if (IS_ERR(vic->regs))
+		return PTR_ERR(vic->regs);
+
+	vic->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(vic->clk)) {
+		dev_err(&pdev->dev, "failed to get clock\n");
+		return PTR_ERR(vic->clk);
+	}
+
+	platform_set_drvdata(pdev, vic);
+
+	INIT_LIST_HEAD(&vic->client.base.list);
+	vic->client.base.ops = &vic_client_ops;
+	vic->client.base.dev = dev;
+	vic->client.base.class = HOST1X_CLASS_VIC;
+	vic->client.base.syncpts = syncpts;
+	vic->client.base.num_syncpts = 1;
+	vic->dev = dev;
+	vic->config = vic_config;
+
+	INIT_LIST_HEAD(&vic->client.list);
+	vic->client.ops = &vic_ops;
+
+	err = host1x_client_register(&vic->client.base);
+	if (err < 0) {
+		dev_err(dev, "failed to register host1x client: %d\n", err);
+		platform_set_drvdata(pdev, NULL);
+		return err;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		err = vic_runtime_resume(&pdev->dev);
+		if (err < 0)
+			goto unregister_client;
+	}
+
+	dev_info(&pdev->dev, "initialized");
+
+	return 0;
+
+unregister_client:
+	host1x_client_unregister(&vic->client.base);
+
+	return err;
+}
+
+static int vic_remove(struct platform_device *pdev)
+{
+	struct vic *vic = platform_get_drvdata(pdev);
+	int err;
+
+	err = host1x_client_unregister(&vic->client.base);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
+			err);
+		return err;
+	}
+
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
+	else
+		vic_runtime_suspend(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops vic_pm_ops = {
+	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
+};
+
+struct platform_driver tegra_vic_driver = {
+	.driver = {
+		.name = "tegra-vic",
+		.of_match_table = vic_match,
+		.pm = &vic_pm_ops
+	},
+	.probe = vic_probe,
+	.remove = vic_remove,
+};
diff --git a/drivers/gpu/drm/tegra/vic.h b/drivers/gpu/drm/tegra/vic.h
new file mode 100644
index 0000000..2184481
--- /dev/null
+++ b/drivers/gpu/drm/tegra/vic.h
@@ -0,0 +1,31 @@
+/*
+ * Copyright (c) 2015, NVIDIA Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef TEGRA_VIC_H
+#define TEGRA_VIC_H
+
+/* VIC methods */
+
+#define VIC_SET_APPLICATION_ID			0x00000200
+#define VIC_SET_FCE_UCODE_SIZE			0x0000071C
+#define VIC_SET_FCE_UCODE_OFFSET		0x0000072C
+
+/* VIC registers */
+
+#define NV_PVIC_MISC_PRI_VIC_CG			0x000016d0
+#define CG_IDLE_CG_DLY_CNT(val)			((val & 0x3f) << 0)
+#define CG_IDLE_CG_EN				(1 << 6)
+#define CG_WAKEUP_DLY_CNT(val)			((val & 0xf) << 16)
+
+/* Firmware offsets */
+
+#define VIC_UCODE_FCE_HEADER_OFFSET		(6*4)
+#define VIC_UCODE_FCE_DATA_OFFSET		(7*4)
+#define FCE_UCODE_SIZE_OFFSET			(2*4)
+
+#endif /* TEGRA_VIC_H */
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 1ffbf2a..3d04aa1 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -26,6 +26,7 @@ enum host1x_class {
 	HOST1X_CLASS_HOST1X = 0x1,
 	HOST1X_CLASS_GR2D = 0x51,
 	HOST1X_CLASS_GR2D_SB = 0x52,
+	HOST1X_CLASS_VIC = 0x5D,
 	HOST1X_CLASS_GR3D = 0x60,
 };
 
-- 
2.10.2
