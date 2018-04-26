From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 1/3] usb: xhci: tegra: Prepare for adding runtime PM support
Date: Thu, 26 Apr 2018 15:59:08 +0100
Message-ID: <1524754750-3633-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When adding runtime PM support to the Tegra XHCI driver, it is desirable
to move the function calls to enable the clocks, regulators and PHY from
the tegra_xusb_probe into the runtime PM handlers. Currently, the
clocks, regulators and PHY are all enabled before we call
usb_create_hcd() in tegra_xusb_probe(), however, we cannot call
pm_runtime_get_sync() at this point because the platform device data is
not yet initialised. Fortunately, the function usb_create_hcd() can be
called before we enable the clocks, regulators and PHY and so prepare
for adding runtime PM support, by moving the call to usb_create_hcd()
before we enable the hardware.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

Changes since V1:
- None

 drivers/usb/host/xhci-tegra.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 2c076ea80522..02b0b24faa58 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1054,10 +1054,23 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		}
 	}
 
+	tegra->hcd = usb_create_hcd(&tegra_xhci_hc_driver, &pdev->dev,
+				    dev_name(&pdev->dev));
+	if (!tegra->hcd) {
+		err = -ENOMEM;
+		goto put_padctl;
+	}
+
+	/*
+	 * This must happen after usb_create_hcd(), because usb_create_hcd()
+	 * will overwrite the drvdata of the device with the hcd it creates.
+	 */
+	platform_set_drvdata(pdev, tegra);
+
 	err = tegra_xusb_clk_enable(tegra);
 	if (err) {
 		dev_err(&pdev->dev, "failed to enable clocks: %d\n", err);
-		goto put_padctl;
+		goto put_usb2;
 	}
 
 	err = regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies);
@@ -1080,19 +1093,6 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto disable_phy;
 	}
 
-	tegra->hcd = usb_create_hcd(&tegra_xhci_hc_driver, &pdev->dev,
-				    dev_name(&pdev->dev));
-	if (!tegra->hcd) {
-		err = -ENOMEM;
-		goto disable_phy;
-	}
-
-	/*
-	 * This must happen after usb_create_hcd(), because usb_create_hcd()
-	 * will overwrite the drvdata of the device with the hcd it creates.
-	 */
-	platform_set_drvdata(pdev, tegra);
-
 	tegra->hcd->regs = tegra->regs;
 	tegra->hcd->rsrc_start = regs->start;
 	tegra->hcd->rsrc_len = resource_size(regs);
@@ -1100,7 +1100,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	err = usb_add_hcd(tegra->hcd, tegra->xhci_irq, IRQF_SHARED);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to add USB HCD: %d\n", err);
-		goto put_usb2;
+		goto disable_phy;
 	}
 
 	device_wakeup_enable(tegra->hcd->self.controller);
@@ -1155,14 +1155,14 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	usb_put_hcd(xhci->shared_hcd);
 remove_usb2:
 	usb_remove_hcd(tegra->hcd);
-put_usb2:
-	usb_put_hcd(tegra->hcd);
 disable_phy:
 	tegra_xusb_phy_disable(tegra);
 disable_regulator:
 	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
 disable_clk:
 	tegra_xusb_clk_disable(tegra);
+put_usb2:
+	usb_put_hcd(tegra->hcd);
 put_padctl:
 	tegra_xusb_padctl_put(tegra->padctl);
 	return err;
-- 
2.7.4
