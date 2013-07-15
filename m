From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH v2 6/9] usb: host: tegra: Locate a PHY via standard API
Date: Mon, 15 Jul 2013 22:53:46 +0300
Message-ID: <1373918029-28977-7-git-send-email-ttynkkynen@nvidia.com>
References: <1373918029-28977-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1373918029-28977-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, swarren@wwwdotorg.org, gregkh@linuxfoundation.org, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use devm_get_phy_by_phandle to get a PHY device instead of the custom
Tegra functions.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
---
 drivers/usb/host/ehci-tegra.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index a208cea..db8031f 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -328,7 +328,6 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	struct tegra_ehci_hcd *tegra;
 	int err = 0;
 	int irq;
-	struct device_node *np_phy;
 	struct usb_phy *u_phy;
 
 	/* Right now device-tree probed devices don't get dma_mask set.
@@ -367,13 +366,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	udelay(1);
 	tegra_periph_reset_deassert(tegra->clk);
 
-	np_phy = of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
-	if (!np_phy) {
-		err = -ENODEV;
-		goto cleanup_clk_en;
-	}
-
-	u_phy = tegra_usb_get_phy(np_phy);
+	u_phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
 	if (IS_ERR(u_phy)) {
 		err = PTR_ERR(u_phy);
 		goto cleanup_clk_en;
-- 
1.8.1.5
