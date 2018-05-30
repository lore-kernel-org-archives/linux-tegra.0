From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] usb: xhci: tegra: Fix runtime PM support
Date: Wed, 30 May 2018 16:11:42 +0100
Message-ID: <1527693102-4711-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Fix silly mistake when enabling runtime PM support for the Tegra XHCI
driver. If runtime PM was enabled correctly for the XHCI device, then
we should call pm_runtime_get_sync() to enable the device.

Fixes: ee9e5f4c7825 ("usb: xhci: tegra: Add runtime PM support")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index c78fc2942bca..a8c1d073cba0 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1136,7 +1136,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, tegra);
 
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev))
+	if (pm_runtime_enabled(&pdev->dev))
 		err = pm_runtime_get_sync(&pdev->dev);
 	else
 		err = tegra_xusb_runtime_resume(&pdev->dev);
-- 
2.7.4
