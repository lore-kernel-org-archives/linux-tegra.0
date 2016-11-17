From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] soc/tegra: Implement Tegra186 PMC support
Date: Thu, 17 Nov 2016 18:16:36 +0100
Message-ID: <20161117171636.20580-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The power management controller on Tegra186 has changed in backwards-
incompatible ways with respect to earlier generations. This implements a
new driver that supports inversion of the PMU interrupt as well as the
"recovery", "bootloader" and "forced-recovery" reboot commands.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |  34 +++++
 drivers/soc/tegra/Makefile                         |   2 +-
 drivers/soc/tegra/pmc-tegra186.c                   | 169 +++++++++++++++++++++
 3 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
 create mode 100644 drivers/soc/tegra/pmc-tegra186.c

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
new file mode 100644
index 000000000000..078a58b0302f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
@@ -0,0 +1,34 @@
+NVIDIA Tegra Power Management Controller (PMC)
+
+Required properties:
+- compatible: Should contain one of the following:
+  - "nvidia,tegra186-pmc": for Tegra186
+- reg: Must contain an (offset, length) pair of the register set for each
+  entry in reg-names.
+- reg-names: Must include the following entries:
+  - "pmc"
+  - "wake"
+  - "aotag"
+  - "scratch"
+
+Optional properties:
+- nvidia,invert-interrupt: If present, inverts the PMU interrupt signal.
+
+Example:
+
+SoC DTSI:
+
+	pmc@c3600000 {
+		compatible = "nvidia,tegra186-pmc";
+		reg = <0 0x0c360000 0 0x10000>,
+		      <0 0x0c370000 0 0x10000>,
+		      <0 0x0c380000 0 0x10000>,
+		      <0 0x0c390000 0 0x10000>;
+		reg-names = "pmc", "wake", "aotag", "scratch";
+	};
+
+Board DTS:
+
+	pmc@c360000 {
+		nvidia,invert-interrupt;
+	};
diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
index ae857ff7d53d..9976a0de1927 100644
--- a/drivers/soc/tegra/Makefile
+++ b/drivers/soc/tegra/Makefile
@@ -1,4 +1,4 @@
 obj-y += fuse/
 
 obj-y += common.o
-obj-y += pmc.o
+obj-y += pmc.o pmc-tegra186.o
diff --git a/drivers/soc/tegra/pmc-tegra186.c b/drivers/soc/tegra/pmc-tegra186.c
new file mode 100644
index 000000000000..ee28eddd8e3c
--- /dev/null
+++ b/drivers/soc/tegra/pmc-tegra186.c
@@ -0,0 +1,169 @@
+/*
+ * Copyright (c) 2016, NVIDIA CORPORATION. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+
+#include <asm/system_misc.h>
+
+#define PMC_CNTRL 0x000
+#define  PMC_CNTRL_MAIN_RST BIT(4)
+
+#define PMC_RST_STATUS 0x070
+
+#define WAKE_AOWAKE_CTRL 0x4f4
+#define  WAKE_AOWAKE_CTRL_INTR_POLARITY BIT(0)
+
+#define SCRATCH_SCRATCH0 0x2000
+#define  SCRATCH_SCRATCH0_MODE_RECOVERY BIT(31)
+#define  SCRATCH_SCRATCH0_MODE_BOOTLOADER BIT(30)
+#define  SCRATCH_SCRATCH0_MODE_RCM BIT(1)
+#define  SCRATCH_SCRATCH0_MODE_MASK (SCRATCH_SCRATCH0_MODE_RECOVERY | \
+				     SCRATCH_SCRATCH0_MODE_BOOTLOADER | \
+				     SCRATCH_SCRATCH0_MODE_RCM)
+
+struct tegra_pmc {
+	struct device *dev;
+	void __iomem *regs;
+	void __iomem *wake;
+	void __iomem *aotag;
+	void __iomem *scratch;
+
+	void (*system_restart)(enum reboot_mode mode, const char *cmd);
+	struct notifier_block restart;
+};
+
+static int tegra186_pmc_restart_notify(struct notifier_block *nb,
+				       unsigned long action,
+				       void *data)
+{
+	struct tegra_pmc *pmc = container_of(nb, struct tegra_pmc, restart);
+	const char *cmd = data;
+	u32 value;
+
+	value = readl(pmc->scratch + SCRATCH_SCRATCH0);
+	value &= ~SCRATCH_SCRATCH0_MODE_MASK;
+
+	if (cmd) {
+		if (strcmp(cmd, "recovery") == 0)
+			value |= SCRATCH_SCRATCH0_MODE_RECOVERY;
+
+		if (strcmp(cmd, "bootloader") == 0)
+			value |= SCRATCH_SCRATCH0_MODE_BOOTLOADER;
+
+		if (strcmp(cmd, "forced-recovery") == 0)
+			value |= SCRATCH_SCRATCH0_MODE_RCM;
+	}
+
+	writel(value, pmc->scratch + SCRATCH_SCRATCH0);
+
+	/*
+	 * If available, call the system restart implementation that was
+	 * registered earlier (typically PSCI).
+	 */
+	if (pmc->system_restart) {
+		pmc->system_restart(reboot_mode, cmd);
+		return NOTIFY_DONE;
+	}
+
+	/* reset everything but SCRATCH0_SCRATCH0 and PMC_RST_STATUS */
+	value = readl(pmc->regs + PMC_CNTRL);
+	value |= PMC_CNTRL_MAIN_RST;
+	writel(value, pmc->regs + PMC_CNTRL);
+
+	return NOTIFY_DONE;
+}
+
+static int tegra186_pmc_setup(struct tegra_pmc *pmc)
+{
+	struct device_node *np = pmc->dev->of_node;
+	bool invert;
+	u32 value;
+
+	invert = of_property_read_bool(np, "nvidia,invert-interrupt");
+
+	value = readl(pmc->wake + WAKE_AOWAKE_CTRL);
+
+	if (invert)
+		value |= WAKE_AOWAKE_CTRL_INTR_POLARITY;
+	else
+		value &= ~WAKE_AOWAKE_CTRL_INTR_POLARITY;
+
+	writel(value, pmc->wake + WAKE_AOWAKE_CTRL);
+
+	/*
+	 * We need to hook any system restart implementation registered
+	 * previously so we can write SCRATCH_SCRATCH0 before reset.
+	 */
+	pmc->system_restart = arm_pm_restart;
+	arm_pm_restart = NULL;
+
+	pmc->restart.notifier_call = tegra186_pmc_restart_notify;
+	pmc->restart.priority = 128;
+
+	return register_restart_handler(&pmc->restart);
+}
+
+static int tegra186_pmc_probe(struct platform_device *pdev)
+{
+	struct tegra_pmc *pmc;
+	struct resource *res;
+
+	pmc = devm_kzalloc(&pdev->dev, sizeof(*pmc), GFP_KERNEL);
+	if (!pmc)
+		return -ENOMEM;
+
+	pmc->dev = &pdev->dev;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pmc");
+	pmc->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pmc->regs))
+		return PTR_ERR(pmc->regs);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "wake");
+	pmc->wake = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pmc->wake))
+		return PTR_ERR(pmc->wake);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aotag");
+	pmc->aotag = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pmc->aotag))
+		return PTR_ERR(pmc->aotag);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "scratch");
+	pmc->scratch = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pmc->scratch))
+		return PTR_ERR(pmc->scratch);
+
+	tegra186_pmc_setup(pmc);
+
+	return 0;
+}
+
+static const struct of_device_id tegra186_pmc_of_match[] = {
+	{ .compatible = "nvidia,tegra186-pmc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tegra186_pmc_of_match);
+
+static struct platform_driver tegra186_pmc_driver = {
+	.driver = {
+		.name = "tegra186-pmc",
+		.of_match_table = tegra186_pmc_of_match,
+	},
+	.probe = tegra186_pmc_probe,
+};
+builtin_platform_driver(tegra186_pmc_driver);
-- 
2.10.2
