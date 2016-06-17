From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 2/4] bus: Add support for Tegra ACONNECT
Date: Fri, 17 Jun 2016 13:40:32 +0100
Message-ID: <1466167234-8288-3-git-send-email-jonathanh@nvidia.com>
References: <1466167234-8288-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466167234-8288-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add a bus driver for the Tegra ACONNECT which is used to interface to
various devices within the Audio Processing Engine (APE). The purpose
of the bus driver is to register child devices that are accessed via
the ACONNECT bus and through the device parent child relationship,
ensure that the appropriate power domain and clocks are enabled for
the ACONNECT when any of the child devices are active. Hence, the
ACONNECT driver simply enables runtime-pm for the ACONNECT device
so that when a child device is resumed, it will enable the power-domain
and clocks associated with the ACONNECT.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/bus/Kconfig          |   9 ++++
 drivers/bus/Makefile         |   1 +
 drivers/bus/tegra-aconnect.c | 113 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 drivers/bus/tegra-aconnect.c

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index c5a7de9bc783..4ed7d26e0d19 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -132,6 +132,15 @@ config SUNXI_RSB
 	  with various RSB based devices, such as AXP223, AXP8XX PMICs,
 	  and AC100/AC200 ICs.
 
+config TEGRA_ACONNECT
+	tristate "Tegra ACONNECT Bus Driver"
+	depends on ARCH_TEGRA_210_SOC
+	depends on OF && PM
+	select PM_CLK
+	help
+	  Driver for the Tegra ACONNECT bus which is used to interface with
+	  the devices inside the Audio Processing Engine (APE) for Tegra210.
+
 config UNIPHIER_SYSTEM_BUS
 	tristate "UniPhier System Bus driver"
 	depends on ARCH_UNIPHIER && OF
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index ccff007ee7e8..ac84cc4348e3 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -17,5 +17,6 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
 obj-$(CONFIG_SIMPLE_PM_BUS)	+= simple-pm-bus.o
+obj-$(CONFIG_TEGRA_ACONNECT)	+= tegra-aconnect.o
 obj-$(CONFIG_UNIPHIER_SYSTEM_BUS)	+= uniphier-system-bus.o
 obj-$(CONFIG_VEXPRESS_CONFIG)	+= vexpress-config.o
diff --git a/drivers/bus/tegra-aconnect.c b/drivers/bus/tegra-aconnect.c
new file mode 100644
index 000000000000..bad9e39dc8b3
--- /dev/null
+++ b/drivers/bus/tegra-aconnect.c
@@ -0,0 +1,113 @@
+/*
+ * Tegra ACONNECT Bus Driver
+ *
+ * Copyright (C) 2016, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+
+static int tegra_aconnect_add_clock(struct device *dev, char *name)
+{
+	struct clk *clk;
+	int ret;
+
+	clk = clk_get(dev, name);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "%s clock not found\n", name);
+		return PTR_ERR(clk);
+	}
+
+	ret = pm_clk_add_clk(dev, clk);
+	if (ret)
+		clk_put(clk);
+
+	return ret;
+}
+
+static int tegra_aconnect_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	if (!pdev->dev.of_node)
+		return -EINVAL;
+
+	ret = pm_clk_create(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = tegra_aconnect_add_clock(&pdev->dev, "ape");
+	if (ret)
+		goto clk_destroy;
+
+	ret = tegra_aconnect_add_clock(&pdev->dev, "apb2ape");
+	if (ret)
+		goto clk_destroy;
+
+	pm_runtime_enable(&pdev->dev);
+
+	of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+
+	dev_info(&pdev->dev, "Tegra ACONNECT bus registered\n");
+
+	return 0;
+
+clk_destroy:
+	pm_clk_destroy(&pdev->dev);
+
+	return ret;
+}
+
+static int tegra_aconnect_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	pm_clk_destroy(&pdev->dev);
+
+	return 0;
+}
+
+static int tegra_aconnect_runtime_resume(struct device *dev)
+{
+	return pm_clk_resume(dev);
+}
+
+static int tegra_aconnect_runtime_suspend(struct device *dev)
+{
+	return pm_clk_suspend(dev);
+}
+
+static const struct dev_pm_ops tegra_aconnect_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra_aconnect_runtime_suspend,
+			   tegra_aconnect_runtime_resume, NULL)
+};
+
+static const struct of_device_id tegra_aconnect_of_match[] = {
+	{ .compatible = "nvidia,tegra210-aconnect", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra_aconnect_of_match);
+
+static struct platform_driver tegra_aconnect_driver = {
+	.probe = tegra_aconnect_probe,
+	.remove = tegra_aconnect_remove,
+	.driver = {
+		.name = "tegra-aconnect",
+		.of_match_table = tegra_aconnect_of_match,
+		.pm = &tegra_aconnect_pm_ops,
+	},
+};
+
+module_platform_driver(tegra_aconnect_driver);
+
+MODULE_DESCRIPTION("Tegra ACONNECT Bus Driver");
+MODULE_AUTHOR("Jon Hunter <jonathanh@nvidia.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.1.4
