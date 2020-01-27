From: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Date: Sun, 26 Jan 2020 21:35:48 -0500
Message-ID: <20200127023548.27107-1-pgwipeout@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The ci_hdrc_tegra driver does not currently support dual role mode, but
it does not explicitly prevent its use.
Certain devices support dual role mode, but not automatic role switch.
This can cause the device to lock up during initialization of the
driver.

Detect this state by checking for the extcon phandle when dual role mode
is set to otg.
If it doesn't exist request the driver to only enable manual role
switching.

Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
Signed-off-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 7455df0ede49..2f6f6ce3e8f5 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -89,6 +89,13 @@ static int tegra_udc_probe(struct platform_device *pdev)
 	udc->data.usb_phy = udc->phy;
 	udc->data.capoffset = DEF_CAPOFFSET;
 
+	/* check the dual mode and warn about bad configurations */
+	if (usb_get_dr_mode(&pdev->dev) == USB_DR_MODE_OTG &&
+	   !of_property_read_bool(pdev->dev.of_node, "extcon")) {
+		dev_warn(&pdev->dev, "no extcon registered, otg unavailable");
+		udc->data.flags |= CI_HDRC_DUAL_ROLE_NOT_OTG;
+	}
+
 	udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
 				      pdev->num_resources, &udc->data);
 	if (IS_ERR(udc->dev)) {
-- 
2.17.1
