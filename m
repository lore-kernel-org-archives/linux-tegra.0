From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 11/18] usb: gadget: tegra-xudc: use phy_set_mode to set/unset device mode
Date: Mon, 30 Dec 2019 16:39:48 +0530
Message-ID: <1577704195-2535-12-git-send-email-nkristam@nvidia.com>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When device mode is set/uset, vbus override activity is done via
exported functions from padctl driver. Use phy_set_mode instead.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V2-V3:
 - No changes in this version
---
 drivers/usb/gadget/udc/tegra-xudc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 0f27d57..283c320 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -615,7 +615,7 @@ static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 
 	dev_dbg(xudc->dev, "device mode on\n");
 
-	tegra_xusb_padctl_set_vbus_override(xudc->padctl, true);
+	phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG, USB_ROLE_DEVICE);
 
 	xudc->device_mode = true;
 
@@ -636,7 +636,7 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 
 	reinit_completion(&xudc->disconnect_complete);
 
-	tegra_xusb_padctl_set_vbus_override(xudc->padctl, false);
+	phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
 
 	pls = (xudc_readl(xudc, PORTSC) & PORTSC_PLS_MASK) >>
 		PORTSC_PLS_SHIFT;
@@ -716,9 +716,11 @@ static void tegra_xudc_plc_reset_work(struct work_struct *work)
 
 		if (pls == PORTSC_PLS_INACTIVE) {
 			dev_info(xudc->dev, "PLS = Inactive. Toggle VBUS\n");
-			tegra_xusb_padctl_set_vbus_override(xudc->padctl,
-							      false);
-			tegra_xusb_padctl_set_vbus_override(xudc->padctl, true);
+			phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG,
+					 USB_ROLE_NONE);
+			phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG,
+					 USB_ROLE_DEVICE);
+
 			xudc->wait_csc = false;
 		}
 	}
-- 
2.7.4
