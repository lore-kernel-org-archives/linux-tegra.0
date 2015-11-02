From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: [RFC 1/8] mfd: Add driver for NVIDIA Tegra XUSB
Date: Mon,  2 Nov 2015 11:55:16 +0000
Message-ID: <1446465323-9493-2-git-send-email-martyn.welch@collabora.co.uk>
References: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: thierry.reding@gmail.com, swarren@wwwdotorg.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, abrestic@chromium.org, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Andrew Bresticker <abrestic@chromium.org>

Add an MFD driver for the XUSB host complex found on NVIDIA Tegra124
and later SoCs.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/mfd/Kconfig      |  7 +++++
 drivers/mfd/Makefile     |  1 +
 drivers/mfd/tegra-xusb.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 drivers/mfd/tegra-xusb.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 99d6367..f8f9ea3 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1479,6 +1479,13 @@ config MFD_STW481X
 	  in various ST Microelectronics and ST-Ericsson embedded
 	  Nomadik series.
 
+config MFD_TEGRA_XUSB
+	tristate "NVIDIA Tegra XUSB"
+	depends on ARCH_TEGRA
+	select MFD_CORE
+	help
+	  Support for the XUSB complex found on NVIDIA Tegra124 and later SoCs.
+
 menu "Multimedia Capabilities Port drivers"
 	depends on ARCH_SA1100
 
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index a59e3fc..8646703 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -188,6 +188,7 @@ obj-$(CONFIG_MFD_HI6421_PMIC)	+= hi6421-pmic-core.o
 obj-$(CONFIG_MFD_DLN2)		+= dln2.o
 obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
 obj-$(CONFIG_MFD_SKY81452)	+= sky81452.o
+obj-$(CONFIG_MFD_TEGRA_XUSB)	+= tegra-xusb.o
 
 intel-soc-pmic-objs		:= intel_soc_pmic_core.o intel_soc_pmic_crc.o
 obj-$(CONFIG_INTEL_SOC_PMIC)	+= intel-soc-pmic.o
diff --git a/drivers/mfd/tegra-xusb.c b/drivers/mfd/tegra-xusb.c
new file mode 100644
index 0000000..e11fa23
--- /dev/null
+++ b/drivers/mfd/tegra-xusb.c
@@ -0,0 +1,75 @@
+/*
+ * NVIDIA Tegra XUSB MFD driver
+ *
+ * Copyright (C) 2015 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mfd/core.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+static const struct of_device_id tegra_xusb_of_match[] = {
+	{ .compatible = "nvidia,tegra124-xusb", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
+
+static struct regmap_config tegra_fpci_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int tegra_xusb_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct regmap *fpci_regs;
+	void __iomem *fpci_base;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	fpci_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(fpci_base))
+		return PTR_ERR(fpci_base);
+
+	tegra_fpci_regmap_config.max_register = res->end - res->start - 3;
+	fpci_regs = devm_regmap_init_mmio(&pdev->dev, fpci_base,
+					  &tegra_fpci_regmap_config);
+	if (IS_ERR(fpci_regs)) {
+		ret = PTR_ERR(fpci_regs);
+		dev_err(&pdev->dev, "Failed to init regmap: %d\n", ret);
+		return ret;
+	}
+	platform_set_drvdata(pdev, fpci_regs);
+
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to add sub-devices: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver tegra_xusb_driver = {
+	.probe = tegra_xusb_probe,
+	.driver = {
+		.name = "tegra-xusb",
+		.of_match_table = tegra_xusb_of_match,
+	},
+};
+module_platform_driver(tegra_xusb_driver);
+
+MODULE_DESCRIPTION("NVIDIA Tegra XUSB MFD");
+MODULE_AUTHOR("Andrew Bresticker <abrestic@chromium.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.1.4
