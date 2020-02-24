From: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] usb: host: xhci-tegra: Tegra186/Tegra194 LPM
Date: Mon, 24 Feb 2020 14:21:45 +0800
Message-ID: <20200224062145.25785-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra186 and Tegra194 xHC supports USB 3.0 LPM. This commit enables
XHCI_LPM_SUPPORT quirk for Tegra186 and Tegra194.

Signed-off-by: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/xhci-tegra.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 8163aefc6c6b..a6e36b3c968f 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -203,6 +203,7 @@ struct tegra_xusb_soc {
 
 	bool scale_ss_clock;
 	bool has_ipfs;
+	bool lpm_support;
 };
 
 struct tegra_xusb_context {
@@ -1779,6 +1780,7 @@ static const struct tegra_xusb_soc tegra186_soc = {
 		.data_out = 0xec,
 		.owner = 0xf0,
 	},
+	.lpm_support = true,
 };
 
 static const char * const tegra194_supply_names[] = {
@@ -1808,6 +1810,7 @@ static const struct tegra_xusb_soc tegra194_soc = {
 		.data_out = 0x70,
 		.owner = 0x74,
 	},
+	.lpm_support = true,
 };
 MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
 
@@ -1832,7 +1835,11 @@ static struct platform_driver tegra_xusb_driver = {
 
 static void tegra_xhci_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
+	struct tegra_xusb *tegra = dev_get_drvdata(dev);
+
 	xhci->quirks |= XHCI_PLAT;
+	if (tegra && tegra->soc->lpm_support)
+		xhci->quirks |= XHCI_LPM_SUPPORT;
 }
 
 static int tegra_xhci_setup(struct usb_hcd *hcd)
-- 
2.17.1
