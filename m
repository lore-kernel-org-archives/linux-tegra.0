From: Thierry Reding <thierry.reding@gmail.com>
Subject: [RFC 1/5] usb: chipidea: Add support for Tegra20/30/114/124
Date: Thu, 26 May 2016 17:40:01 +0200
Message-ID: <20160526154005.11558-2-thierry.reding@gmail.com>
References: <20160526154005.11558-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160526154005.11558-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

All of these Tegra SoC generations have a ChipIdea UDC IP block that can
be used for device mode communication with a host. Implement rudimentary
support that doesn't allow switching between host and device modes.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/chipidea/Makefile        |   1 +
 drivers/usb/chipidea/ci_hdrc_tegra.c | 109 +++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 drivers/usb/chipidea/ci_hdrc_tegra.c

diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makefile
index 518e445476c3..3532df6561d9 100644
--- a/drivers/usb/chipidea/Makefile
+++ b/drivers/usb/chipidea/Makefile
@@ -10,6 +10,7 @@ ci_hdrc-$(CONFIG_USB_OTG_FSM)		+= otg_fsm.o
 obj-$(CONFIG_USB_CHIPIDEA)	+= ci_hdrc_usb2.o
 obj-$(CONFIG_USB_CHIPIDEA)	+= ci_hdrc_msm.o
 obj-$(CONFIG_USB_CHIPIDEA)	+= ci_hdrc_zevio.o
+obj-$(CONFIG_USB_CHIPIDEA)	+= ci_hdrc_tegra.o
 
 obj-$(CONFIG_USB_CHIPIDEA_PCI)	+= ci_hdrc_pci.o
 
diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
new file mode 100644
index 000000000000..d3cd68441856
--- /dev/null
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -0,0 +1,109 @@
+/*
+ * Copyright (c) 2016, NVIDIA Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include <linux/usb/chipidea.h>
+
+#include "ci.h"
+
+struct tegra_udc {
+	struct ci_hdrc_platform_data data;
+	struct platform_device *dev;
+
+	struct usb_phy *phy;
+	struct clk *clk;
+};
+
+static const struct of_device_id tegra_udc_of_match[] = {
+	{ .compatible = "nvidia,tegra20-udc" },
+	{ .compatible = "nvidia,tegra30-udc" },
+	{ .compatible = "nvidia,tegra114-udc" },
+	{ .compatible = "nvidia,tegra124-udc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tegra_udc_of_match);
+
+static int tegra_udc_probe(struct platform_device *pdev)
+{
+	struct tegra_udc *udc;
+	int err;
+
+	udc = devm_kzalloc(&pdev->dev, sizeof(*udc), GFP_KERNEL);
+	if (!udc)
+		return -ENOMEM;
+
+	udc->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
+	if (IS_ERR(udc->phy)) {
+		err = PTR_ERR(udc->phy);
+		dev_err(&pdev->dev, "failed to get PHY: %d\n", err);
+		return err;
+	}
+
+	udc->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(udc->clk)) {
+		err = PTR_ERR(udc->clk);
+		dev_err(&pdev->dev, "failed to get clock: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(udc->clk);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	/* setup and register ChipIdea HDRC device */
+	udc->data.name = "tegra-udc";
+	udc->data.capoffset = DEF_CAPOFFSET;
+	udc->data.flags = 0;
+	udc->data.usb_phy = udc->phy;
+
+	udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
+				      pdev->num_resources, &udc->data);
+	if (IS_ERR(udc->dev)) {
+		err = PTR_ERR(udc->dev);
+		dev_err(&pdev->dev, "failed to add HDRC device: %d\n", err);
+		goto disable_clock;
+	}
+
+	platform_set_drvdata(pdev, udc);
+
+	return 0;
+
+disable_clock:
+	clk_disable_unprepare(udc->clk);
+	return err;
+}
+
+static int tegra_udc_remove(struct platform_device *pdev)
+{
+	struct tegra_udc *udc = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(udc->clk);
+
+	return 0;
+}
+
+static struct platform_driver tegra_udc_driver = {
+	.driver = {
+		.name = "tegra-udc",
+		.of_match_table = tegra_udc_of_match,
+	},
+	.probe = tegra_udc_probe,
+	.remove = tegra_udc_remove,
+};
+module_platform_driver(tegra_udc_driver);
+
+MODULE_DESCRIPTION("NVIDIA Tegra USB device mode driver");
+MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
+MODULE_ALIAS("platform:tegra-udc");
+MODULE_LICENSE("GPL v2");
-- 
2.8.3
