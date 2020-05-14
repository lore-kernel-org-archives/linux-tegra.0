From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V3 2/8] usb: gadget: tegra-xudc: Add vbus_draw support
Date: Thu, 14 May 2020 11:52:37 +0530
Message-ID: <1589437363-16727-3-git-send-email-nkristam@nvidia.com>
References: <1589437363-16727-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1589437363-16727-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Register vbus_draw to gadget ops and update corresponding vbus
draw current to usb_phy.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V3:
 - Propogated usb_phy->set_power error to vbus_draw caller.
---
V2:
 - Patch re-based.
---
 drivers/usb/gadget/udc/tegra-xudc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 52a6add..53e2d1c 100644
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
 
@@ -2042,6 +2044,20 @@ static int tegra_xudc_gadget_stop(struct usb_gadget *gadget)
 	return 0;
 }
 
+static int tegra_xudc_gadget_vbus_draw(struct usb_gadget *gadget,
+						unsigned int m_a)
+{
+	int ret = 0;
+	struct tegra_xudc *xudc = to_xudc(gadget);
+
+	dev_dbg(xudc->dev, "%s: %u mA\n", __func__, m_a);
+
+	if (xudc->curr_usbphy->chg_type == SDP_TYPE)
+		ret = usb_phy_set_power(xudc->curr_usbphy, m_a);
+
+	return ret;
+}
+
 static int tegra_xudc_set_selfpowered(struct usb_gadget *gadget, int is_on)
 {
 	struct tegra_xudc *xudc = to_xudc(gadget);
@@ -2058,6 +2074,7 @@ static struct usb_gadget_ops tegra_xudc_gadget_ops = {
 	.pullup = tegra_xudc_gadget_pullup,
 	.udc_start = tegra_xudc_gadget_start,
 	.udc_stop = tegra_xudc_gadget_stop,
+	.vbus_draw = tegra_xudc_gadget_vbus_draw,
 	.set_selfpowered = tegra_xudc_set_selfpowered,
 };
 
-- 
2.7.4
