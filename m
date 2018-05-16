From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 3/3] usb: xhci: tegra: Add support for managing powergates
Date: Wed, 16 May 2018 14:48:55 +0100
Message-ID: <1526478535-23760-3-git-send-email-jonathanh@nvidia.com>
References: <1526478535-23760-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526478535-23760-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra XHCI controller requires that the XUSBA (for superspeed) and
XUSBC (for host) power-domains are enabled. Commit 8df127456f29
("soc/tegra: pmc: Enable XUSB partitions on boot") was added to force
on these power-domains if the XHCI driver is enabled while proper
power-domain support is added, to ensure the device did not hang on
boot. However, rather than forcing on these power-domains in the PMC
driver we can use the legacy Tegra powergate APIs to turn on these
power-domains during the probe of the Tegra XHCI driver.

In the near future we plan to move the Tegra XHCI driver to use the
generic PM domain framework for power-domains and so to prepare for
this only use the legacy Tegra powergate API if there is not PM
domain associated with device (ie. dev.pm_domain is NULL). Please
note that in the future the superspeed and host resets will be handled
by the generic PM domain provider and so these are only these are only
needed in the case where there is no generic PM domain.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---

Changes since V2:
- Add Thierry's ACK

Changes since V1:
- None

 drivers/usb/host/xhci-tegra.c | 68 +++++++++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 437e08010587..c78fc2942bca 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -22,6 +22,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <soc/tegra/pmc.h>
 
 #include "xhci.h"
 
@@ -974,20 +975,6 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	if (IS_ERR(tegra->padctl))
 		return PTR_ERR(tegra->padctl);
 
-	tegra->host_rst = devm_reset_control_get(&pdev->dev, "xusb_host");
-	if (IS_ERR(tegra->host_rst)) {
-		err = PTR_ERR(tegra->host_rst);
-		dev_err(&pdev->dev, "failed to get xusb_host reset: %d\n", err);
-		goto put_padctl;
-	}
-
-	tegra->ss_rst = devm_reset_control_get(&pdev->dev, "xusb_ss");
-	if (IS_ERR(tegra->ss_rst)) {
-		err = PTR_ERR(tegra->ss_rst);
-		dev_err(&pdev->dev, "failed to get xusb_ss reset: %d\n", err);
-		goto put_padctl;
-	}
-
 	tegra->host_clk = devm_clk_get(&pdev->dev, "xusb_host");
 	if (IS_ERR(tegra->host_clk)) {
 		err = PTR_ERR(tegra->host_clk);
@@ -1051,11 +1038,48 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_padctl;
 	}
 
+	if (!pdev->dev.pm_domain) {
+		tegra->host_rst = devm_reset_control_get(&pdev->dev,
+							 "xusb_host");
+		if (IS_ERR(tegra->host_rst)) {
+			err = PTR_ERR(tegra->host_rst);
+			dev_err(&pdev->dev,
+				"failed to get xusb_host reset: %d\n", err);
+			goto put_padctl;
+		}
+
+		tegra->ss_rst = devm_reset_control_get(&pdev->dev, "xusb_ss");
+		if (IS_ERR(tegra->ss_rst)) {
+			err = PTR_ERR(tegra->ss_rst);
+			dev_err(&pdev->dev, "failed to get xusb_ss reset: %d\n",
+				err);
+			goto put_padctl;
+		}
+
+		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBA,
+							tegra->ss_clk,
+							tegra->ss_rst);
+		if (err) {
+			dev_err(&pdev->dev,
+				"failed to enable XUSBA domain: %d\n", err);
+			goto put_padctl;
+		}
+
+		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
+							tegra->host_clk,
+							tegra->host_rst);
+		if (err) {
+			dev_err(&pdev->dev,
+				"failed to enable XUSBC domain: %d\n", err);
+			goto disable_xusba;
+		}
+	}
+
 	tegra->supplies = devm_kcalloc(&pdev->dev, tegra->soc->num_supplies,
 				       sizeof(*tegra->supplies), GFP_KERNEL);
 	if (!tegra->supplies) {
 		err = -ENOMEM;
-		goto put_padctl;
+		goto disable_xusbc;
 	}
 
 	for (i = 0; i < tegra->soc->num_supplies; i++)
@@ -1065,7 +1089,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 				      tegra->supplies);
 	if (err) {
 		dev_err(&pdev->dev, "failed to get regulators: %d\n", err);
-		goto put_padctl;
+		goto disable_xusbc;
 	}
 
 	for (i = 0; i < tegra->soc->num_types; i++)
@@ -1075,7 +1099,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 				   sizeof(*tegra->phys), GFP_KERNEL);
 	if (!tegra->phys) {
 		err = -ENOMEM;
-		goto put_padctl;
+		goto disable_xusbc;
 	}
 
 	for (i = 0, k = 0; i < tegra->soc->num_types; i++) {
@@ -1091,7 +1115,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 					"failed to get PHY %s: %ld\n", prop,
 					PTR_ERR(phy));
 				err = PTR_ERR(phy);
-				goto put_padctl;
+				goto disable_xusbc;
 			}
 
 			tegra->phys[k++] = phy;
@@ -1102,7 +1126,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 				    dev_name(&pdev->dev));
 	if (!tegra->hcd) {
 		err = -ENOMEM;
-		goto put_padctl;
+		goto disable_xusbc;
 	}
 
 	/*
@@ -1198,6 +1222,12 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 disable_rpm:
 	pm_runtime_disable(&pdev->dev);
 	usb_put_hcd(tegra->hcd);
+disable_xusbc:
+	if (!&pdev->dev.pm_domain)
+		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
+disable_xusba:
+	if (!&pdev->dev.pm_domain)
+		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
 put_padctl:
 	tegra_xusb_padctl_put(tegra->padctl);
 	return err;
-- 
2.7.4
