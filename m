From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH v2 3/9] usb: tegra: host: Remove references to plat data
Date: Mon, 15 Jul 2013 22:53:43 +0300
Message-ID: <1373918029-28977-4-git-send-email-ttynkkynen@nvidia.com>
References: <1373918029-28977-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1373918029-28977-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, swarren@wwwdotorg.org, gregkh@linuxfoundation.org, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Platform data is not used in tegra-ehci anymore, so remove all
references to it.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
---
 drivers/usb/host/ehci-tegra.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 06e8feb..a208cea 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -27,7 +27,6 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/tegra_usb.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/usb/ehci_def.h>
@@ -327,18 +326,11 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	struct usb_hcd *hcd;
 	struct ehci_hcd *ehci;
 	struct tegra_ehci_hcd *tegra;
-	struct tegra_ehci_platform_data *pdata;
 	int err = 0;
 	int irq;
 	struct device_node *np_phy;
 	struct usb_phy *u_phy;
 
-	pdata = pdev->dev.platform_data;
-	if (!pdata) {
-		dev_err(&pdev->dev, "Platform data missing\n");
-		return -EINVAL;
-	}
-
 	/* Right now device-tree probed devices don't get dma_mask set.
 	 * Since shared usb code relies on it, set it here for now.
 	 * Once we have dma capability bindings this can go away.
-- 
1.8.1.5
