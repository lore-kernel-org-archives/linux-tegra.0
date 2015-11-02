From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: [RFC 7/8] Start migrating XUSB away from MFD
Date: Mon,  2 Nov 2015 11:55:22 +0000
Message-ID: <1446465323-9493-8-git-send-email-martyn.welch@collabora.co.uk>
References: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: thierry.reding@gmail.com, swarren@wwwdotorg.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, abrestic@chromium.org, Martyn Welch <martyn@welchs.me.uk>
List-Id: linux-tegra@vger.kernel.org

From: Martyn Welch <martyn@welchs.me.uk>

This is my initial attempt to get xusb working without being a MFD on the
latest upstream kernel. It's still a bit hacky in places, but does seem to
get the USB2 up and working (USB3 device is recognised as a USB3 device
rather than enumberating as a USB2 device).
---
 drivers/mailbox/tegra-xusb-mailbox.c |  16 ++---
 drivers/mfd/tegra-xusb.c             | 122 +++++++++++++++++++++++++++++++----
 drivers/usb/host/xhci-tegra.c        |  52 +++++++++------
 include/soc/tegra/xusb.h             |   4 ++
 4 files changed, 152 insertions(+), 42 deletions(-)

diff --git a/drivers/mailbox/tegra-xusb-mailbox.c b/drivers/mailbox/tegra-xusb-mailbox.c
index 4e2477d..8924a6d 100644
--- a/drivers/mailbox/tegra-xusb-mailbox.c
+++ b/drivers/mailbox/tegra-xusb-mailbox.c
@@ -220,15 +220,11 @@ static struct mbox_chan *tegra_xusb_mbox_of_xlate(struct mbox_controller *ctlr,
 	return chan;
 }
 
-static const struct of_device_id tegra_xusb_mbox_of_match[] = {
-	{ .compatible = "nvidia,tegra124-xusb-mbox" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, tegra_xusb_mbox_of_match);
-
 static int tegra_xusb_mbox_probe(struct platform_device *pdev)
 {
 	struct tegra_xusb_mbox *mbox;
+	struct platform_device *parent;
+	struct tegra_xusb_shared_regs *sregs;
 	int ret;
 
 	mbox = devm_kzalloc(&pdev->dev, sizeof(*mbox), GFP_KERNEL);
@@ -236,7 +232,8 @@ static int tegra_xusb_mbox_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, mbox);
 	spin_lock_init(&mbox->lock);
-	mbox->fpci_regs = dev_get_drvdata(pdev->dev.parent);
+	sregs = pdev->dev.platform_data;
+	mbox->fpci_regs = sregs->fpci_regs;
 
 	mbox->mbox.dev = &pdev->dev;
 	mbox->mbox.chans = devm_kcalloc(&pdev->dev, XUSB_MBOX_NUM_CHANS,
@@ -249,7 +246,9 @@ static int tegra_xusb_mbox_probe(struct platform_device *pdev)
 	mbox->mbox.txpoll_period = 1;
 	mbox->mbox.of_xlate = tegra_xusb_mbox_of_xlate;
 
-	mbox->irq = platform_get_irq(pdev, 0);
+	parent = to_platform_device(pdev->dev.parent);
+
+	mbox->irq = platform_get_irq(parent, 1);
 	if (mbox->irq < 0)
 		return mbox->irq;
 	ret = devm_request_irq(&pdev->dev, mbox->irq, tegra_xusb_mbox_irq, 0,
@@ -280,7 +279,6 @@ static struct platform_driver tegra_xusb_mbox_driver = {
 	.remove = tegra_xusb_mbox_remove,
 	.driver = {
 		.name = "tegra-xusb-mbox",
-		.of_match_table = tegra_xusb_mbox_of_match,
 	},
 };
 module_platform_driver(tegra_xusb_mbox_driver);
diff --git a/drivers/mfd/tegra-xusb.c b/drivers/mfd/tegra-xusb.c
index e11fa23..e9cb365 100644
--- a/drivers/mfd/tegra-xusb.c
+++ b/drivers/mfd/tegra-xusb.c
@@ -18,6 +18,8 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
+#include <soc/tegra/xusb.h>
+
 static const struct of_device_id tegra_xusb_of_match[] = {
 	{ .compatible = "nvidia,tegra124-xusb", },
 	{},
@@ -30,39 +32,133 @@ static struct regmap_config tegra_fpci_regmap_config = {
 	.reg_stride = 4,
 };
 
+struct tegra_xusb_priv {
+	struct platform_device *mbox_pdev;
+	struct platform_device *xhci_pdev;
+};
+
+static struct platform_device *tegra_xusb_add_device(struct device *parent,
+	const char *name, int id, const struct resource *res,
+	unsigned int num_res, const void *data, size_t size_data)
+{
+	int ret = -ENOMEM;
+	struct platform_device *pdev;
+
+	pdev = platform_device_alloc(name, id);
+	if (!pdev)
+		goto err_alloc;
+
+	pdev->dev.parent = parent;
+	pdev->dev.dma_mask = parent->dma_mask;
+	pdev->dev.dma_parms = parent->dma_parms;
+	pdev->dev.coherent_dma_mask = parent->coherent_dma_mask;
+	pdev->dev.of_node = parent->of_node;
+
+	ret = platform_device_add_resources(pdev,
+			res, num_res);
+	if (ret)
+		goto err;
+
+	ret = platform_device_add_data(pdev,
+			data, size_data);
+	if (ret)
+		goto err;
+
+	ret = platform_device_add(pdev);
+	if (ret)
+		goto err;
+
+	return pdev;
+
+err:
+	kfree(pdev->dev.dma_mask);
+
+err_alloc:
+	platform_device_put(pdev);
+	return ERR_PTR(ret);
+}
+
 static int tegra_xusb_probe(struct platform_device *pdev)
 {
 	struct resource *res;
-	struct regmap *fpci_regs;
 	void __iomem *fpci_base;
 	int ret;
+	struct tegra_xusb_shared_regs *sregs;
+	struct tegra_xusb_priv *priv;
+
+	sregs = devm_kzalloc(&pdev->dev, sizeof(*sregs), GFP_KERNEL);
+	if (!sregs)
+		return -ENOMEM;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	/*
+	  The registers are a bit jumbled up:
+
+	  xhci uses:    0x70098000 - 0x700980cf
+	  mailbox uses: 0x700980e0 - 0x700980f3
+	  xhci uses:    0x7009841c - 0x7009841f - Undocumented paging register
+	  mailbox uses: 0x70098428 - 0x7009842b
+	  xhci uses:    0x70098800 - 0x700989ff - Undocumented paging window
+
+	  Use a regmap to cover this area and pass it to child nodes.
+	*/
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
 	fpci_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(fpci_base))
-		return PTR_ERR(fpci_base);
+	if (IS_ERR(fpci_base)) {
+		ret = PTR_ERR(fpci_base);
+		dev_err(&pdev->dev, "Failed to get shared resource: %d\n", ret);
+		return ret;
+	}
 
 	tegra_fpci_regmap_config.max_register = res->end - res->start - 3;
-	fpci_regs = devm_regmap_init_mmio(&pdev->dev, fpci_base,
-					  &tegra_fpci_regmap_config);
-	if (IS_ERR(fpci_regs)) {
-		ret = PTR_ERR(fpci_regs);
+	sregs->fpci_regs = devm_regmap_init_mmio(&pdev->dev, fpci_base,
+			&tegra_fpci_regmap_config);
+	if (IS_ERR(sregs->fpci_regs)) {
+		ret = PTR_ERR(sregs->fpci_regs);
 		dev_err(&pdev->dev, "Failed to init regmap: %d\n", ret);
 		return ret;
 	}
-	platform_set_drvdata(pdev, fpci_regs);
 
-	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to add sub-devices: %d\n", ret);
-		return ret;
+	priv->mbox_pdev = tegra_xusb_add_device(&pdev->dev,
+			"tegra-xusb-mbox", PLATFORM_DEVID_NONE, NULL, 0,
+			sregs, sizeof(sregs));
+	if (IS_ERR(priv->mbox_pdev)) {
+		dev_err(&pdev->dev, "Failed to add mailbox subdevice\n");
+		return PTR_ERR(priv->mbox_pdev);
+	}
+
+	priv->xhci_pdev = tegra_xusb_add_device(&pdev->dev,
+			"tegra-xhci", PLATFORM_DEVID_NONE, NULL, 0, sregs,
+			sizeof(sregs));
+	if (IS_ERR(priv->xhci_pdev)) {
+		dev_err(&pdev->dev, "Failed to add xhci subdevice\n");
+		return PTR_ERR(priv->xhci_pdev);
 	}
 
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static int tegra_xusb_remove(struct platform_device *pdev)
+{
+	struct tegra_xusb_priv *priv;
+
+	priv = platform_get_drvdata(pdev);
+
+	platform_device_unregister(priv->xhci_pdev);
+
+	platform_device_unregister(priv->mbox_pdev);
+
 	return 0;
 }
 
 static struct platform_driver tegra_xusb_driver = {
 	.probe = tegra_xusb_probe,
+	.remove = tegra_xusb_remove,
 	.driver = {
 		.name = "tegra-xusb",
 		.of_match_table = tegra_xusb_of_match,
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index d510dc5..0172fe2 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -598,7 +598,7 @@ static const struct tegra_xhci_soc_data tegra124_soc_data = {
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
 
 static const struct of_device_id tegra_xhci_of_match[] = {
-	{ .compatible = "nvidia,tegra124-xhci", .data = &tegra124_soc_data },
+	{ .compatible = "nvidia,tegra124-xusb", .data = &tegra124_soc_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_xhci_of_match);
@@ -682,6 +682,8 @@ static int tegra_xhci_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct usb_hcd *hcd;
 	struct phy *phy;
+	struct platform_device *parent;
+	struct tegra_xusb_shared_regs *sregs;
 	unsigned int i, j, k;
 	int ret;
 
@@ -693,7 +695,10 @@ static int tegra_xhci_probe(struct platform_device *pdev)
 	tegra->dev = &pdev->dev;
 	platform_set_drvdata(pdev, tegra);
 
-	match = of_match_device(tegra_xhci_of_match, &pdev->dev);
+	match = of_match_device(tegra_xhci_of_match, pdev->dev.parent);
+	if(!match)
+		return -ENODEV;
+
 	tegra->soc = match->data;
 
 	hcd = usb_create_hcd(&tegra_xhci_hc_driver, &pdev->dev,
@@ -702,9 +707,9 @@ static int tegra_xhci_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	tegra->hcd = hcd;
 
-	tegra->fpci_regs = dev_get_drvdata(pdev->dev.parent);
+	parent = to_platform_device(pdev->dev.parent);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource(parent, IORESOURCE_MEM, 0);
 	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(hcd->regs)) {
 		ret = PTR_ERR(hcd->regs);
@@ -713,71 +718,74 @@ static int tegra_xhci_probe(struct platform_device *pdev)
 	hcd->rsrc_start = res->start;
 	hcd->rsrc_len = resource_size(res);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	res = platform_get_resource(parent, IORESOURCE_MEM, 1);
 	tegra->ipfs_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(tegra->ipfs_base)) {
 		ret = PTR_ERR(tegra->ipfs_base);
 		goto put_hcd;
 	}
 
-	tegra->irq = platform_get_irq(pdev, 0);
+	sregs = pdev->dev.platform_data;
+	tegra->fpci_regs = sregs->fpci_regs;
+
+	tegra->irq = platform_get_irq(parent, 0);
 	if (tegra->irq < 0) {
 		ret = tegra->irq;
 		goto put_hcd;
 	}
 
-	tegra->host_rst = devm_reset_control_get(&pdev->dev, "xusb_host");
+	tegra->host_rst = devm_reset_control_get(pdev->dev.parent, "xusb_host");
 	if (IS_ERR(tegra->host_rst)) {
 		ret = PTR_ERR(tegra->host_rst);
 		goto put_hcd;
 	}
-	tegra->ss_rst = devm_reset_control_get(&pdev->dev, "xusb_ss");
+	tegra->ss_rst = devm_reset_control_get(pdev->dev.parent, "xusb_ss");
 	if (IS_ERR(tegra->ss_rst)) {
 		ret = PTR_ERR(tegra->ss_rst);
 		goto put_hcd;
 	}
 
-	tegra->host_clk = devm_clk_get(&pdev->dev, "xusb_host");
+	tegra->host_clk = devm_clk_get(pdev->dev.parent, "xusb_host");
 	if (IS_ERR(tegra->host_clk)) {
 		ret = PTR_ERR(tegra->host_clk);
 		goto put_hcd;
 	}
-	tegra->falc_clk = devm_clk_get(&pdev->dev, "xusb_falcon_src");
+	tegra->falc_clk = devm_clk_get(pdev->dev.parent, "xusb_falcon_src");
 	if (IS_ERR(tegra->falc_clk)) {
 		ret = PTR_ERR(tegra->falc_clk);
 		goto put_hcd;
 	}
-	tegra->ss_clk = devm_clk_get(&pdev->dev, "xusb_ss");
+	tegra->ss_clk = devm_clk_get(pdev->dev.parent, "xusb_ss");
 	if (IS_ERR(tegra->ss_clk)) {
 		ret = PTR_ERR(tegra->ss_clk);
 		goto put_hcd;
 	}
-	tegra->ss_src_clk = devm_clk_get(&pdev->dev, "xusb_ss_src");
+	tegra->ss_src_clk = devm_clk_get(pdev->dev.parent, "xusb_ss_src");
 	if (IS_ERR(tegra->ss_src_clk)) {
 		ret = PTR_ERR(tegra->ss_src_clk);
 		goto put_hcd;
 	}
-	tegra->hs_src_clk = devm_clk_get(&pdev->dev, "xusb_hs_src");
+	tegra->hs_src_clk = devm_clk_get(pdev->dev.parent, "xusb_hs_src");
 	if (IS_ERR(tegra->hs_src_clk)) {
 		ret = PTR_ERR(tegra->hs_src_clk);
 		goto put_hcd;
 	}
-	tegra->fs_src_clk = devm_clk_get(&pdev->dev, "xusb_fs_src");
+	tegra->fs_src_clk = devm_clk_get(pdev->dev.parent, "xusb_fs_src");
 	if (IS_ERR(tegra->fs_src_clk)) {
 		ret = PTR_ERR(tegra->fs_src_clk);
 		goto put_hcd;
 	}
-	tegra->pll_u_480m = devm_clk_get(&pdev->dev, "pll_u_480m");
+	tegra->pll_u_480m = devm_clk_get(pdev->dev.parent, "pll_u_480m");
 	if (IS_ERR(tegra->pll_u_480m)) {
 		ret = PTR_ERR(tegra->pll_u_480m);
 		goto put_hcd;
 	}
-	tegra->clk_m = devm_clk_get(&pdev->dev, "clk_m");
+	tegra->clk_m = devm_clk_get(pdev->dev.parent, "clk_m");
 	if (IS_ERR(tegra->clk_m)) {
 		ret = PTR_ERR(tegra->clk_m);
 		goto put_hcd;
 	}
-	tegra->pll_e = devm_clk_get(&pdev->dev, "pll_e");
+	tegra->pll_e = devm_clk_get(pdev->dev.parent, "pll_e");
 	if (IS_ERR(tegra->pll_e)) {
 		ret = PTR_ERR(tegra->pll_e);
 		goto put_hcd;
@@ -812,7 +820,6 @@ static int tegra_xhci_probe(struct platform_device *pdev)
 		ret = PTR_ERR(tegra->mbox_chan);
 		goto disable_regulator;
 	}
-
 	for (i = 0; i < tegra->soc->num_types; i++)
 		tegra->num_phys += tegra->soc->phy_types[i].num;
 	tegra->phys = devm_kcalloc(&pdev->dev, tegra->num_phys,
@@ -821,6 +828,7 @@ static int tegra_xhci_probe(struct platform_device *pdev)
 		ret = -ENOMEM;
 		goto put_mbox;
 	}
+
 	for (i = 0, k = 0; i < tegra->soc->num_types; i++) {
 		char prop[8];
 
@@ -925,13 +933,17 @@ static struct platform_driver tegra_xhci_driver = {
 	.driver = {
 		.name = "tegra-xhci",
 		.pm = &tegra_xhci_pm_ops,
-		.of_match_table = tegra_xhci_of_match,
 	},
 };
 
+static const struct xhci_driver_overrides tegra_xhci_overrides __initconst = {
+	.extra_priv_size = sizeof(struct xhci_hcd),
+	.reset = tegra_xhci_setup,
+};
+
 static int __init tegra_xhci_init(void)
 {
-	xhci_init_driver(&tegra_xhci_hc_driver, tegra_xhci_setup);
+	xhci_init_driver(&tegra_xhci_hc_driver, &tegra_xhci_overrides);
 	return platform_driver_register(&tegra_xhci_driver);
 }
 module_init(tegra_xhci_init);
diff --git a/include/soc/tegra/xusb.h b/include/soc/tegra/xusb.h
index 0136dc1..d3c4dbd 100644
--- a/include/soc/tegra/xusb.h
+++ b/include/soc/tegra/xusb.h
@@ -47,4 +47,8 @@ struct tegra_xusb_mbox_msg {
 	u32 data;
 };
 
+struct tegra_xusb_shared_regs {
+	struct regmap *fpci_regs;
+};
+
 #endif /* __SOC_TEGRA_XUSB_H__ */
-- 
2.1.4
