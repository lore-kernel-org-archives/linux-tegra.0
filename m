From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 6/9] usb: host: tegra: Locate a PHY via standard API
Date: Thu, 25 Jul 2013 21:38:06 +0300
Message-ID: <1374777489-13093-7-git-send-email-ttynkkynen@nvidia.com>
References: <1374777489-13093-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374777489-13093-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use devm_get_phy_by_phandle to get a PHY device instead of the custom
Tegra functions.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
