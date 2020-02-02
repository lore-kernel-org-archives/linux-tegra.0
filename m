From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] usb: phy: tegra: Add clarifying comments about the shared registers
Date: Mon,  3 Feb 2020 01:42:59 +0300
Message-ID: <20200202224259.29187-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tools like Coccinelle may erroneously recommend to use the
devm_platform_ioremap_resource() API for the registers mapping because
these tools are not aware about the implementation details of the driver.
Let's add a clarifying comments to the code, which should help to stop
future attempts to break the driver.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/phy/phy-tegra-usb.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 037e8eee737d..6153cc35aba0 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -969,6 +969,10 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 		return  -ENXIO;
 	}
 
+	/*
+	 * Note that UTMI pad registers are shared by all PHYs, therefore
+	 * devm_platform_ioremap_resource() can't be used here.
+	 */
 	tegra_phy->pad_regs = devm_ioremap(&pdev->dev, res->start,
 					   resource_size(res));
 	if (!tegra_phy->pad_regs) {
@@ -1087,6 +1091,10 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		return  -ENXIO;
 	}
 
+	/*
+	 * Note that PHY and USB controller are using shared registers,
+	 * therefore devm_platform_ioremap_resource() can't be used here.
+	 */
 	tegra_phy->regs = devm_ioremap(&pdev->dev, res->start,
 				       resource_size(res));
 	if (!tegra_phy->regs) {
-- 
2.24.0
