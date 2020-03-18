From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 2/8] usb: gadget: tegra-xudc: Add vbus_draw support
Date: Wed, 18 Mar 2020 16:01:01 +0530
Message-ID: <1584527467-8058-3-git-send-email-nkristam@nvidia.com>
References: <1584527467-8058-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1584527467-8058-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Register vbus_draw to gadget ops and update corresponding vbus
draw current to usb_phy.

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 52a6add..9d3c109 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -492,6 +492,7 @@ struct tegra_xudc {
 	bool powergated;
 
 	struct usb_phy **usbphy;
+	struct usb_phy *curr_usbphy;
 	struct notifier_block vbus_nb;
 
 	struct completion disconnect_complete;
@@ -719,6 +720,7 @@ static int tegra_xudc_vbus_notify(struct notifier_block *nb,
 	if (!xudc->suspended && phy_index != -1) {
 		xudc->curr_utmi_phy = xudc->utmi_phy[phy_index];
 		xudc->curr_usb3_phy = xudc->usb3_phy[phy_index];
+		xudc->curr_usbphy = usbphy;
 		schedule_work(&xudc->usb_role_sw_work);
 	}
 
@@ -2042,6 +2044,19 @@ static int tegra_xudc_gadget_stop(struct usb_gadget *gadget)
 	return 0;
 }
 
+static int tegra_xudc_gadget_vbus_draw(struct usb_gadget *gadget,
+						unsigned int m_a)
+{
+	struct tegra_xudc *xudc = to_xudc(gadget);
+
+	dev_dbg(xudc->dev, "%s: %u mA\n", __func__, m_a);
+
+	if (xudc->curr_usbphy->chg_type == SDP_TYPE)
+		usb_phy_set_power(xudc->curr_usbphy, m_a);
+
+	return 0;
+}
+
 static int tegra_xudc_set_selfpowered(struct usb_gadget *gadget, int is_on)
 {
 	struct tegra_xudc *xudc = to_xudc(gadget);
@@ -2058,6 +2073,7 @@ static struct usb_gadget_ops tegra_xudc_gadget_ops = {
 	.pullup = tegra_xudc_gadget_pullup,
 	.udc_start = tegra_xudc_gadget_start,
 	.udc_stop = tegra_xudc_gadget_stop,
+	.vbus_draw = tegra_xudc_gadget_vbus_draw,
 	.set_selfpowered = tegra_xudc_set_selfpowered,
 };
 
-- 
2.7.4
