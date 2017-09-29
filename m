From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] usb: phy: tegra: Fix phy suspend for UDC
Date: Fri, 29 Sep 2017 14:06:28 +0100
Message-ID: <1506690388-23112-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")
added UDC support for Tegra but with UDC support enabled, is was found
that Tegra30, Tegra114 and Tegra124 would hang on entry to suspend.

The hang occurred during the suspend of the USB PHY when the Tegra PHY
driver attempted to disable the PHY clock. The problem is that before
the Tegra PHY driver is suspended, the chipidea driver already disabled
the PHY clock and when the Tegra PHY driver suspended, it could not read
DEVLC register and caused the device to hang.

The Tegra USB PHY driver is used by both the Tegra EHCI driver and now
the chipidea UDC driver and so simply removing the disabling of the PHY
clock from the USB PHY driver would not work for the Tegra EHCI driver.
Fortunately, the status of the USB PHY clock can be read from the
USB_SUSP_CTRL register and therefore, to workaround this issue, simply
poll the register prior to disabling the clock in USB PHY driver to see
if clock gating has already been initiated. Please note that it can take
a few uS for the clock to disable and so simply reading this status
register once on entry is not sufficient.

Please note that no issues are seen with Tegra20 because it has a slightly
different PHY to Tegra30/114/124.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-tegra-usb.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 5fe4a5704bde..c8fff99bd16e 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -329,6 +329,14 @@ static void utmi_phy_clk_disable(struct tegra_usb_phy *phy)
 	unsigned long val;
 	void __iomem *base = phy->regs;
 
+	/*
+	 * The USB driver may have already initiated the phy clock
+	 * disable so wait to see if the clock turns off and if not
+	 * then proceed with gating the clock.
+	 */
+	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID, 0) == 0)
+		return;
+
 	if (phy->is_legacy_phy) {
 		val = readl(base + USB_SUSP_CTRL);
 		val |= USB_SUSP_SET;
-- 
2.7.4
