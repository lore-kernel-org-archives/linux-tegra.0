From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] usb: xhci: tegra: fix runtime PM error handling
Date: Sun, 17 Jun 2018 13:12:55 +0200
Message-ID: <20180617111258.13447-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Agner <stefan@agner.ch>, Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The address-of operator will always evaluate to true. However,
power should be explicitly disabled if no power domain is used.

Remove the address-of operator.

Fixes: 58c38116c6cc ("usb: xhci: tegra: Add support for managing powergates")
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/usb/host/xhci-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index a8c1d073cba0..33daac4136e8 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1223,10 +1223,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	usb_put_hcd(tegra->hcd);
 disable_xusbc:
-	if (!&pdev->dev.pm_domain)
+	if (!pdev->dev.pm_domain)
 		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
 disable_xusba:
-	if (!&pdev->dev.pm_domain)
+	if (!pdev->dev.pm_domain)
 		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
 put_padctl:
 	tegra_xusb_padctl_put(tegra->padctl);
-- 
2.17.1
