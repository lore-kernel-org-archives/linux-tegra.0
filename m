From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/3] drm/nouveau: support for probing platform
	devices
Date: Thu, 26 Jun 2014 14:33:32 +0900
Message-ID: <1403760814-26148-2-git-send-email-acourbot@nvidia.com>
References: <1403760814-26148-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1403760814-26148-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a platform driver for Nouveau devices declared using the device tree
or platform data. This driver currently supports GK20A on Tegra
platforms and is only compiled for these platforms if Nouveau is
enabled.

Nouveau will probe the chip type itself using the BOOT0 register, so all
this driver really needs to do is to make sure the module is powered and
its clocks active before calling nouveau_drm_platform_probe().

Heavily based on work done by Thierry Reding.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Kconfig            |   8 ++
 drivers/gpu/drm/nouveau/Makefile           |   3 +
 drivers/gpu/drm/nouveau/nouveau_drm.c      |  53 ++++++---
 drivers/gpu/drm/nouveau/nouveau_drm.h      |   8 ++
 drivers/gpu/drm/nouveau/nouveau_platform.c | 182 +++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_platform.h |  49 ++++++++
 6 files changed, 289 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_platform.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_platform.h

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 637c29a33127..d4abaebfc35b 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -25,6 +25,14 @@ config DRM_NOUVEAU
 	help
 	  Choose this option for open-source nVidia support.
 
+config NOUVEAU_PLATFORM_DRIVER
+	tristate "Nouveau (nVidia) integrated GPUs"
+	depends on DRM_NOUVEAU && ARCH_TEGRA
+	default y
+	help
+	  Support for Nouveau platform driver, used for integrated GPUs as found
+	  on NVIDIA Tegra K1.
+
 config NOUVEAU_DEBUG
 	int "Maximum debug level"
 	depends on DRM_NOUVEAU
diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 8b307e143632..f55f0f34aef9 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -349,3 +349,6 @@ nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
 nouveau-$(CONFIG_DEBUG_FS) += nouveau_debugfs.o
 
 obj-$(CONFIG_DRM_NOUVEAU)+= nouveau.o
+
+# platform driver
+obj-$(CONFIG_NOUVEAU_PLATFORM_DRIVER) += nouveau_platform.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ddd83756b9a2..78295261c350 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -494,10 +494,9 @@ nouveau_drm_unload(struct drm_device *dev)
 	return 0;
 }
 
-static void
-nouveau_drm_remove(struct pci_dev *pdev)
+void
+nouveau_drm_device_remove(struct drm_device *dev)
 {
-	struct drm_device *dev = pci_get_drvdata(pdev);
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_object *device;
 
@@ -508,6 +507,15 @@ nouveau_drm_remove(struct pci_dev *pdev)
 	nouveau_object_ref(NULL, &device);
 	nouveau_object_debug();
 }
+EXPORT_SYMBOL(nouveau_drm_device_remove);
+
+static void
+nouveau_drm_remove(struct pci_dev *pdev)
+{
+	struct drm_device *dev = pci_get_drvdata(pdev);
+
+	nouveau_drm_device_remove(dev);
+}
 
 static int
 nouveau_do_suspend(struct drm_device *dev, bool runtime)
@@ -1003,24 +1011,41 @@ nouveau_drm_pci_driver = {
 	.driver.pm = &nouveau_pm_ops,
 };
 
-int nouveau_drm_platform_probe(struct platform_device *pdev)
+struct drm_device *
+nouveau_platform_device_create_(struct platform_device *pdev, int size,
+				void **pobject)
 {
-	struct nouveau_device *device;
-	int ret;
+	struct drm_device *drm;
+	int err;
 
-	ret = nouveau_device_create(pdev, NOUVEAU_BUS_PLATFORM,
+	err = nouveau_device_create_(pdev, NOUVEAU_BUS_PLATFORM,
 				    nouveau_platform_name(pdev),
 				    dev_name(&pdev->dev), nouveau_config,
-				    nouveau_debug, &device);
-
-	ret = drm_platform_init(&driver, pdev);
-	if (ret) {
-		nouveau_object_ref(NULL, (struct nouveau_object **)&device);
-		return ret;
+				    nouveau_debug, size, pobject);
+	if (err)
+		return ERR_PTR(err);
+
+	drm = drm_dev_alloc(&driver, &pdev->dev);
+	if (!drm) {
+		err = -ENOMEM;
+		goto err_free;
 	}
 
-	return ret;
+	err = drm_dev_set_unique(drm, "%s", dev_name(&pdev->dev));
+	if (err < 0)
+		goto err_free;
+
+	drm->platformdev = pdev;
+	platform_set_drvdata(pdev, drm);
+
+	return drm;
+
+err_free:
+	nouveau_object_ref(NULL, (struct nouveau_object **)pobject);
+
+	return ERR_PTR(err);
 }
+EXPORT_SYMBOL(nouveau_platform_device_create_);
 
 static int __init
 nouveau_drm_init(void)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.h b/drivers/gpu/drm/nouveau/nouveau_drm.h
index 7efbafaf7c1d..dc342232182d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.h
@@ -39,6 +39,7 @@
 #include <drm/ttm/ttm_page_alloc.h>
 
 struct nouveau_channel;
+struct platform_device;
 
 #define DRM_FILE_PAGE_OFFSET (0x100000000ULL >> PAGE_SHIFT)
 
@@ -157,6 +158,13 @@ nouveau_dev(struct drm_device *dev)
 int nouveau_pmops_suspend(struct device *);
 int nouveau_pmops_resume(struct device *);
 
+#define nouveau_platform_device_create(p, u)                                   \
+	nouveau_platform_device_create_(p, sizeof(**u), (void **)u)
+struct drm_device *
+nouveau_platform_device_create_(struct platform_device *pdev,
+				int size, void **pobject);
+void nouveau_drm_device_remove(struct drm_device *dev);
+
 #define NV_FATAL(cli, fmt, args...) nv_fatal((cli), fmt, ##args)
 #define NV_ERROR(cli, fmt, args...) nv_error((cli), fmt, ##args)
 #define NV_WARN(cli, fmt, args...) nv_warn((cli), fmt, ##args)
diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
new file mode 100644
index 000000000000..72ab0519abf6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -0,0 +1,182 @@
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
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/reset.h>
+#include <linux/regulator/consumer.h>
+#include <linux/tegra-powergate.h>
+
+#include "nouveau_drm.h"
+#include "nouveau_platform.h"
+
+static int nouveau_platform_power_up(struct nouveau_platform_gpu *gpu)
+{
+	int err;
+
+	err = regulator_enable(gpu->vdd);
+	if (err)
+		goto err_power;
+
+	err = clk_prepare_enable(gpu->clk);
+	if (err)
+		goto err_clk;
+	err = clk_prepare_enable(gpu->clk_pwr);
+	if (err)
+		goto err_clk_pwr;
+	clk_set_rate(gpu->clk_pwr, 204000000);
+	udelay(10);
+
+	reset_control_assert(gpu->rst);
+	udelay(10);
+
+	err = tegra_powergate_remove_clamping(TEGRA_POWERGATE_3D);
+	if (err)
+		goto err_clamp;
+	udelay(10);
+
+	reset_control_deassert(gpu->rst);
+	udelay(10);
+
+	return 0;
+
+err_clamp:
+	clk_disable_unprepare(gpu->clk_pwr);
+err_clk_pwr:
+	clk_disable_unprepare(gpu->clk);
+err_clk:
+	regulator_disable(gpu->vdd);
+err_power:
+	return err;
+}
+
+static int nouveau_platform_power_down(struct nouveau_platform_gpu *gpu)
+{
+	int err;
+
+	reset_control_assert(gpu->rst);
+	udelay(10);
+
+	clk_disable_unprepare(gpu->clk_pwr);
+	clk_disable_unprepare(gpu->clk);
+	udelay(10);
+
+	err = regulator_disable(gpu->vdd);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int nouveau_platform_probe(struct platform_device *pdev)
+{
+	struct nouveau_platform_gpu *gpu;
+	struct nouveau_platform_device *device;
+	struct drm_device *drm;
+	int err;
+
+	gpu = devm_kzalloc(&pdev->dev, sizeof(*gpu), GFP_KERNEL);
+	if (!gpu)
+		return -ENOMEM;
+
+	gpu->vdd = devm_regulator_get(&pdev->dev, "vdd");
+	if (IS_ERR(gpu->vdd))
+		return PTR_ERR(gpu->vdd);
+
+	gpu->rst = devm_reset_control_get(&pdev->dev, "gpu");
+	if (IS_ERR(gpu->rst))
+		return PTR_ERR(gpu->rst);
+
+	gpu->clk = devm_clk_get(&pdev->dev, "gpu");
+	if (IS_ERR(gpu->clk))
+		return PTR_ERR(gpu->clk);
+
+	gpu->clk_pwr = devm_clk_get(&pdev->dev, "pwr");
+	if (IS_ERR(gpu->clk_pwr))
+		return PTR_ERR(gpu->clk_pwr);
+
+	err = nouveau_platform_power_up(gpu);
+	if (err)
+		return err;
+
+	drm = nouveau_platform_device_create(pdev, &device);
+	if (IS_ERR(drm)) {
+		err = PTR_ERR(drm);
+		goto power_down;
+	}
+
+	device->gpu = gpu;
+
+	err = drm_dev_register(drm, 0);
+	if (err < 0)
+		goto err_unref;
+
+	return 0;
+
+err_unref:
+	drm_dev_unref(drm);
+
+	return 0;
+
+power_down:
+	nouveau_platform_power_down(gpu);
+
+	return err;
+}
+
+static int nouveau_platform_remove(struct platform_device *pdev)
+{
+	struct drm_device *drm_dev = platform_get_drvdata(pdev);
+	struct nouveau_device *device = nouveau_dev(drm_dev);
+	struct nouveau_platform_gpu *gpu = nv_device_to_platform(device)->gpu;
+
+	nouveau_drm_device_remove(drm_dev);
+
+	return nouveau_platform_power_down(gpu);
+}
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id nouveau_platform_match[] = {
+	{ .compatible = "nvidia,gk20a" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, nouveau_platform_match);
+#endif
+
+struct platform_driver nouveau_platform_driver = {
+	.driver = {
+		.name = "nouveau",
+		.of_match_table = of_match_ptr(nouveau_platform_match),
+	},
+	.probe = nouveau_platform_probe,
+	.remove = nouveau_platform_remove,
+};
+
+module_platform_driver(nouveau_platform_driver);
+
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.h b/drivers/gpu/drm/nouveau/nouveau_platform.h
new file mode 100644
index 000000000000..91f66504900e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.h
@@ -0,0 +1,49 @@
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
+#ifndef __NOUVEAU_PLATFORM_H__
+#define __NOUVEAU_PLATFORM_H__
+
+#include "core/device.h"
+
+struct reset_control;
+struct clk;
+struct regulator;
+
+struct nouveau_platform_gpu {
+	struct reset_control *rst;
+	struct clk *clk;
+	struct clk *clk_pwr;
+
+	struct regulator *vdd;
+};
+
+struct nouveau_platform_device {
+	struct nouveau_device device;
+
+	struct nouveau_platform_gpu *gpu;
+};
+
+#define nv_device_to_platform(d)                                               \
+	container_of(d, struct nouveau_platform_device, device)
+
+#endif
-- 
2.0.0
