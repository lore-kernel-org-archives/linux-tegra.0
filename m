From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/8] usb: chipidea: Add support for Tegra20/30/114/124
Date: Thu, 27 Jul 2017 19:46:07 +0300
Message-ID: <f103baa439a64b517e6c8cb51c30e81987dfedb3.1501173271.git.digetx@gmail.com>
References: <cover.1501173271.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1501173271.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1501173271.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1501173271.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

All of these Tegra SoC generations have a ChipIdea UDC IP block that can
be used for device mode communication with a host. Implement rudimentary
support that doesn't allow switching between host and device modes.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: rebased patches and added DMA alignment quirk for Tegra20]
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
---
 drivers/usb/chipidea/Makefile        |   1 +
 drivers/usb/chipidea/ci_hdrc_tegra.c | 160 +++++++++++++++++++++++++++++++++++
 2 files changed, 161 insertions(+)
 create mode 100644 drivers/usb/chipidea/ci_hdrc_tegra.c

diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makefile
index 39fca5715ed3..ddcbddf8361a 100644
--- a/drivers/usb/chipidea/Makefile
+++ b/drivers/usb/chipidea/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_USB_CHIPIDEA)	+= ci_hdrc_zevio.o
 obj-$(CONFIG_USB_CHIPIDEA_PCI)	+= ci_hdrc_pci.o
 
 obj-$(CONFIG_USB_CHIPIDEA_OF)	+= usbmisc_imx.o ci_hdrc_imx.o
+obj-$(CONFIG_USB_CHIPIDEA_OF)	+= ci_hdrc_tegra.o
diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
new file mode 100644
index 000000000000..7814500e71fa
--- /dev/null
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -0,0 +1,160 @@
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
+struct tegra_udc_soc_info {
+	bool supports_unaligned_dma;
+};
+
+struct tegra_udc {
+	struct ci_hdrc_platform_data data;
+	struct platform_device *dev;
+
+	struct usb_phy *phy;
+	struct clk *clk;
+};
+
+static const struct tegra_udc_soc_info tegra20_udc_soc_info = {
+	.supports_unaligned_dma = false,
+};
+
+static const struct tegra_udc_soc_info tegra30_udc_soc_info = {
+	.supports_unaligned_dma = true,
+};
+
+static const struct tegra_udc_soc_info tegra114_udc_soc_info = {
+	.supports_unaligned_dma = true,
+};
+
+static const struct tegra_udc_soc_info tegra124_udc_soc_info = {
+	.supports_unaligned_dma = true,
+};
+
+static const struct of_device_id tegra_udc_of_match[] = {
+	{
+		.compatible = "nvidia,tegra20-udc",
+		.data = &tegra20_udc_soc_info,
+	}, {
+		.compatible = "nvidia,tegra30-udc",
+		.data = &tegra30_udc_soc_info,
+	}, {
+		.compatible = "nvidia,tegra114-udc",
+		.data = &tegra114_udc_soc_info,
+	}, {
+		.compatible = "nvidia,tegra124-udc",
+		.data = &tegra124_udc_soc_info,
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(of, tegra_udc_of_match);
+
+static int tegra_udc_probe(struct platform_device *pdev)
+{
+	const struct tegra_udc_soc_info *soc;
+	const struct of_device_id *id;
+	struct tegra_udc *udc;
+	int err;
+
+	udc = devm_kzalloc(&pdev->dev, sizeof(*udc), GFP_KERNEL);
+	if (!udc)
+		return -ENOMEM;
+
+	id = of_match_node(tegra_udc_of_match, pdev->dev.of_node);
+	if (!id)
+		return -ENODEV;
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
+	/* setup device specific quirks */
+	soc = id->data;
+
+	if (!soc->supports_unaligned_dma)
+		udc->data.flags |= CI_HDRC_REQUIRES_ALIGNED_DMA;
+
+	/*
+	 * Tegra's USB PHY driver doesn't implement optional phy_init()
+	 * hook, so we have to power on UDC controller before ChipIdea
+	 * driver initialization kicks in.
+	 */
+	usb_phy_set_suspend(udc->phy, 0);
+
+	udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
+				      pdev->num_resources, &udc->data);
+	if (IS_ERR(udc->dev)) {
+		err = PTR_ERR(udc->dev);
+		dev_err(&pdev->dev, "failed to add HDRC device: %d\n", err);
+		goto power_off;
+	}
+
+	platform_set_drvdata(pdev, udc);
+
+	return 0;
+
+power_off:
+	usb_phy_set_suspend(udc->phy, 1);
+	clk_disable_unprepare(udc->clk);
+	return err;
+}
+
+static int tegra_udc_remove(struct platform_device *pdev)
+{
+	struct tegra_udc *udc = platform_get_drvdata(pdev);
+
+	usb_phy_set_suspend(udc->phy, 1);
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
+MODULE_AUTHOR("Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
+MODULE_ALIAS("platform:tegra-udc");
+MODULE_LICENSE("GPL v2");
-- 
2.13.3
