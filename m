From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [RFC 8/8] Registering mailbox from XUSB Child - Work in progress
Date: Mon,  2 Nov 2015 11:55:23 +0000
Message-ID: <1446465323-9493-9-git-send-email-martyn.welch@collabora.co.uk>
References: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446465323-9493-1-git-send-email-martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org>

The mailbox API expects the device node to have a of_node associated with
it.  Because the child doesn't have it's own node, in the previous patch
tegra_xusb_add_device() was assigning the parents of_node to it's children.
Unfortunately this results in the parents probe being called when the
device is added.

To try and get around this, in this patch we use the parent device node
(which legitimately has an of_node assigned to it). Unfortuntely this
results in the parents device node being stored in the mbox_client
structure, which is used in the receive callback (tegra_xhci_mbox_rx) to
get the required driver data, so a bit of fiddling is needed to get the
child's data rather then the parents.

This loads an appears to be doing the right thing, up until a USB3 device
is plugged into the port and it gets enumerated as USB2 :-(
---
 drivers/mailbox/tegra-xusb-mailbox.c | 2 +-
 drivers/mfd/tegra-xusb.c             | 6 ------
 drivers/usb/host/xhci-tegra.c        | 6 +++---
 include/soc/tegra/xusb.h             | 5 +++++
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mailbox/tegra-xusb-mailbox.c b/drivers/mailbox/tegra-xusb-mailbox.c
index 8924a6d..1421712 100644
--- a/drivers/mailbox/tegra-xusb-mailbox.c
+++ b/drivers/mailbox/tegra-xusb-mailbox.c
@@ -235,7 +235,7 @@ static int tegra_xusb_mbox_probe(struct platform_device *pdev)
 	sregs = pdev->dev.platform_data;
 	mbox->fpci_regs = sregs->fpci_regs;
 
-	mbox->mbox.dev = &pdev->dev;
+	mbox->mbox.dev = pdev->dev.parent;
 	mbox->mbox.chans = devm_kcalloc(&pdev->dev, XUSB_MBOX_NUM_CHANS,
 					sizeof(*mbox->mbox.chans), GFP_KERNEL);
 	if (!mbox->mbox.chans)
diff --git a/drivers/mfd/tegra-xusb.c b/drivers/mfd/tegra-xusb.c
index e9cb365..d615a94 100644
--- a/drivers/mfd/tegra-xusb.c
+++ b/drivers/mfd/tegra-xusb.c
@@ -32,11 +32,6 @@ static struct regmap_config tegra_fpci_regmap_config = {
 	.reg_stride = 4,
 };
 
-struct tegra_xusb_priv {
-	struct platform_device *mbox_pdev;
-	struct platform_device *xhci_pdev;
-};
-
 static struct platform_device *tegra_xusb_add_device(struct device *parent,
 	const char *name, int id, const struct resource *res,
 	unsigned int num_res, const void *data, size_t size_data)
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 0172fe2..e49dbda 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -552,7 +552,8 @@ static void tegra_xhci_mbox_work(struct work_struct *work)
 
 static void tegra_xhci_mbox_rx(struct mbox_client *cl, void *data)
 {
-	struct tegra_xhci_hcd *tegra = dev_get_drvdata(cl->dev);
+	struct tegra_xusb_priv *priv = dev_get_drvdata(cl->dev);
+	struct tegra_xhci_hcd *tegra = dev_get_drvdata(&priv->xhci_pdev->dev);
 	struct tegra_xusb_mbox_msg *msg = data;
 
 	if (is_host_mbox_message(msg->cmd)) {
@@ -694,7 +695,6 @@ static int tegra_xhci_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	tegra->dev = &pdev->dev;
 	platform_set_drvdata(pdev, tegra);
-
 	match = of_match_device(tegra_xhci_of_match, pdev->dev.parent);
 	if(!match)
 		return -ENODEV;
@@ -811,7 +811,7 @@ static int tegra_xhci_probe(struct platform_device *pdev)
 		goto disable_clk;
 
 	INIT_WORK(&tegra->mbox_req_work, tegra_xhci_mbox_work);
-	tegra->mbox_client.dev = &pdev->dev;
+	tegra->mbox_client.dev = pdev->dev.parent;
 	tegra->mbox_client.tx_block = true;
 	tegra->mbox_client.tx_tout = 0;
 	tegra->mbox_client.rx_callback = tegra_xhci_mbox_rx;
diff --git a/include/soc/tegra/xusb.h b/include/soc/tegra/xusb.h
index d3c4dbd..f580b1d 100644
--- a/include/soc/tegra/xusb.h
+++ b/include/soc/tegra/xusb.h
@@ -47,6 +47,11 @@ struct tegra_xusb_mbox_msg {
 	u32 data;
 };
 
+struct tegra_xusb_priv {
+	struct platform_device *mbox_pdev;
+	struct platform_device *xhci_pdev;
+};
+
 struct tegra_xusb_shared_regs {
 	struct regmap *fpci_regs;
 };
-- 
2.1.4
