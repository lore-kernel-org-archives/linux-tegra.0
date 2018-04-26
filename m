From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 2/3] usb: xhci: tegra: Add runtime PM support
Date: Thu, 26 Apr 2018 15:59:09 +0100
Message-ID: <1524754750-3633-2-git-send-email-jonathanh@nvidia.com>
References: <1524754750-3633-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524754750-3633-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add runtime PM support to the Tegra XHCI driver and move the function
calls to enable/disable the clocks, regulators and PHY into the runtime
PM callbacks.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

Changes since V1:
- Re-worked change to handle case where runtime PM is disabled.

 drivers/usb/host/xhci-tegra.c | 89 ++++++++++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 02b0b24faa58..85f2381883ad 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -18,6 +18,7 @@
 #include <linux/phy/tegra/xusb.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -761,6 +762,50 @@ static void tegra_xusb_phy_disable(struct tegra_xusb *tegra)
 	}
 }
 
+static int tegra_xusb_runtime_suspend(struct device *dev)
+{
+	struct tegra_xusb *tegra = dev_get_drvdata(dev);
+
+	tegra_xusb_phy_disable(tegra);
+	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
+	tegra_xusb_clk_disable(tegra);
+
+	return 0;
+}
+
+static int tegra_xusb_runtime_resume(struct device *dev)
+{
+	struct tegra_xusb *tegra = dev_get_drvdata(dev);
+	int err;
+
+	err = tegra_xusb_clk_enable(tegra);
+	if (err) {
+		dev_err(dev, "failed to enable clocks: %d\n", err);
+		return err;
+	}
+
+	err = regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies);
+	if (err) {
+		dev_err(dev, "failed to enable regulators: %d\n", err);
+		goto disable_clk;
+	}
+
+	err = tegra_xusb_phy_enable(tegra);
+	if (err < 0) {
+		dev_err(dev, "failed to enable PHYs: %d\n", err);
+		goto disable_regulator;
+	}
+
+	return 0;
+
+disable_regulator:
+	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
+disable_clk:
+	tegra_xusb_clk_disable(tegra);
+	return err;
+}
+
+
 static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 {
 	unsigned int code_tag_blocks, code_size_blocks, code_blocks;
@@ -1067,22 +1112,15 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	 */
 	platform_set_drvdata(pdev, tegra);
 
-	err = tegra_xusb_clk_enable(tegra);
-	if (err) {
-		dev_err(&pdev->dev, "failed to enable clocks: %d\n", err);
-		goto put_usb2;
-	}
+	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev))
+		err = pm_runtime_get_sync(&pdev->dev);
+	else
+		err = tegra_xusb_runtime_resume(&pdev->dev);
 
-	err = regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies);
-	if (err) {
-		dev_err(&pdev->dev, "failed to enable regulators: %d\n", err);
-		goto disable_clk;
-	}
-
-	err = tegra_xusb_phy_enable(tegra);
 	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable PHYs: %d\n", err);
-		goto disable_regulator;
+		dev_err(&pdev->dev, "failed to enable device: %d\n", err);
+		goto disable_rpm;
 	}
 
 	tegra_xusb_ipfs_config(tegra, regs);
@@ -1090,7 +1128,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	err = tegra_xusb_load_firmware(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to load firmware: %d\n", err);
-		goto disable_phy;
+		goto put_rpm;
 	}
 
 	tegra->hcd->regs = tegra->regs;
@@ -1100,7 +1138,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	err = usb_add_hcd(tegra->hcd, tegra->xhci_irq, IRQF_SHARED);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to add USB HCD: %d\n", err);
-		goto disable_phy;
+		goto put_rpm;
 	}
 
 	device_wakeup_enable(tegra->hcd->self.controller);
@@ -1155,13 +1193,11 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	usb_put_hcd(xhci->shared_hcd);
 remove_usb2:
 	usb_remove_hcd(tegra->hcd);
-disable_phy:
-	tegra_xusb_phy_disable(tegra);
-disable_regulator:
-	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
-disable_clk:
-	tegra_xusb_clk_disable(tegra);
-put_usb2:
+put_rpm:
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		tegra_xusb_runtime_suspend(&pdev->dev);
+disable_rpm:
+	pm_runtime_disable(&pdev->dev);
 	usb_put_hcd(tegra->hcd);
 put_padctl:
 	tegra_xusb_padctl_put(tegra->padctl);
@@ -1181,9 +1217,8 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 	dma_free_coherent(&pdev->dev, tegra->fw.size, tegra->fw.virt,
 			  tegra->fw.phys);
 
-	tegra_xusb_phy_disable(tegra);
-	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
-	tegra_xusb_clk_disable(tegra);
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	tegra_xusb_padctl_put(tegra->padctl);
 
@@ -1211,6 +1246,8 @@ static int tegra_xusb_resume(struct device *dev)
 #endif
 
 static const struct dev_pm_ops tegra_xusb_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra_xusb_runtime_suspend,
+			   tegra_xusb_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(tegra_xusb_suspend, tegra_xusb_resume)
 };
 
-- 
2.7.4
