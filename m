From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/2] usb: tegra: Move UTMI-pads reset from ehci-tegra to tegra-phy
Date: Mon, 11 Dec 2017 02:07:38 +0300
Message-ID: <853ce44924e396b907332d4f3ad4ae70eae9bbcc.1512946782.git.digetx@gmail.com>
References: <ddf583790b551999ef063107be12a2d85e7b6a86.1512946782.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ddf583790b551999ef063107be12a2d85e7b6a86.1512946782.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <ddf583790b551999ef063107be12a2d85e7b6a86.1512946782.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <ddf583790b551999ef063107be12a2d85e7b6a86.1512946782.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

UTMI pads are shared by USB controllers and reset of UTMI pads is shared
with the reset of USB1 controller. Currently reset of UTMI pads is done by
the EHCI driver and ChipIdea UDC works because EHCI driver always happen
to be probed first. Move reset controls from ehci-tegra to tegra-phy in
order to resolve the problem.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c     | 87 ++++++++++++++++++---------------------
 drivers/usb/phy/phy-tegra-usb.c   | 46 +++++++++++++++++++++
 include/linux/usb/tegra_usb_phy.h |  2 +
 3 files changed, 87 insertions(+), 48 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index c809f7d2f08f..63294892e198 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -36,7 +36,6 @@
 #define DRV_NAME "tegra-ehci"
 
 static struct hc_driver __read_mostly tegra_ehci_hc_driver;
-static bool usb1_reset_attempted;
 
 struct tegra_ehci_soc_config {
 	bool has_hostpc;
@@ -51,67 +50,54 @@ struct tegra_ehci_hcd {
 	enum tegra_usb_phy_port_speed port_speed;
 };
 
-/*
- * The 1st USB controller contains some UTMI pad registers that are global for
- * all the controllers on the chip. Those registers are also cleared when
- * reset is asserted to the 1st controller. This means that the 1st controller
- * can only be reset when no other controlled has finished probing. So we'll
- * reset the 1st controller before doing any other setup on any of the
- * controllers, and then never again.
- *
- * Since this is a PHY issue, the Tegra PHY driver should probably be doing
- * the resetting of the USB controllers. But to keep compatibility with old
- * device trees that don't have reset phandles in the PHYs, do it here.
- * Those old DTs will be vulnerable to total USB breakage if the 1st EHCI
- * device isn't the first one to finish probing, so warn them.
- */
 static int tegra_reset_usb_controller(struct platform_device *pdev)
 {
 	struct device_node *phy_np;
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct tegra_ehci_hcd *tegra =
 		(struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
-	bool has_utmi_pad_registers = false;
+	struct reset_control *rst;
+	int err;
 
 	phy_np = of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
 	if (!phy_np)
 		return -ENOENT;
 
-	if (of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers"))
-		has_utmi_pad_registers = true;
+	/*
+	 * The 1st USB controller contains some UTMI pad registers that are
+	 * global for all the controllers on the chip. Those registers are
+	 * also cleared when reset is asserted to the 1st controller.
+	 */
+	rst = of_reset_control_get_shared(phy_np, "utmi-pads");
+	if (IS_ERR(rst)) {
+		dev_warn(&pdev->dev,
+			 "can't get utmi-pads reset from the PHY\n");
+		dev_warn(&pdev->dev,
+			 "continuing, but please update your DT\n");
+	} else {
+		/*
+		 * PHY driver performs UTMI-pads reset in a case of
+		 * non-legacy DT.
+		 */
+		reset_control_put(rst);
+	}
 
-	if (!usb1_reset_attempted) {
-		struct reset_control *usb1_reset;
+	of_node_put(phy_np);
 
-		if (!has_utmi_pad_registers)
-			usb1_reset = of_reset_control_get(phy_np, "utmi-pads");
-		else
-			usb1_reset = tegra->rst;
-
-		if (IS_ERR(usb1_reset)) {
-			dev_warn(&pdev->dev,
-				 "can't get utmi-pads reset from the PHY\n");
-			dev_warn(&pdev->dev,
-				 "continuing, but please update your DT\n");
-		} else {
-			reset_control_assert(usb1_reset);
-			udelay(1);
-			reset_control_deassert(usb1_reset);
-
-			if (!has_utmi_pad_registers)
-				reset_control_put(usb1_reset);
-		}
+	/* reset control is shared, hence initialize it first */
+	err = reset_control_deassert(tegra->rst);
+	if (err)
+		return err;
 
-		usb1_reset_attempted = true;
-	}
+	err = reset_control_assert(tegra->rst);
+	if (err)
+		return err;
 
-	if (!has_utmi_pad_registers) {
-		reset_control_assert(tegra->rst);
-		udelay(1);
-		reset_control_deassert(tegra->rst);
-	}
+	udelay(1);
 
-	of_node_put(phy_np);
+	err = reset_control_deassert(tegra->rst);
+	if (err)
+		return err;
 
 	return 0;
 }
@@ -440,7 +426,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		goto cleanup_hcd_create;
 	}
 
-	tegra->rst = devm_reset_control_get(&pdev->dev, "usb");
+	tegra->rst = devm_reset_control_get_shared(&pdev->dev, "usb");
 	if (IS_ERR(tegra->rst)) {
 		dev_err(&pdev->dev, "Can't get ehci reset\n");
 		err = PTR_ERR(tegra->rst);
@@ -452,8 +438,10 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		goto cleanup_hcd_create;
 
 	err = tegra_reset_usb_controller(pdev);
-	if (err)
+	if (err) {
+		dev_err(&pdev->dev, "Failed to reset controller\n");
 		goto cleanup_clk_en;
+	}
 
 	u_phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
 	if (IS_ERR(u_phy)) {
@@ -537,6 +525,9 @@ static int tegra_ehci_remove(struct platform_device *pdev)
 	usb_phy_shutdown(hcd->usb_phy);
 	usb_remove_hcd(hcd);
 
+	reset_control_assert(tegra->rst);
+	udelay(1);
+
 	clk_disable_unprepare(tegra->clk);
 
 	usb_put_hcd(hcd);
diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 019968a5d0ab..d8b43a09228c 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -246,9 +246,48 @@ static int utmip_pad_open(struct tegra_usb_phy *phy)
 		return err;
 	}
 
+	phy->pad_rst = devm_reset_control_get_optional_shared(
+						phy->u_phy.dev, "utmi-pads");
+	if (IS_ERR(phy->pad_rst)) {
+		err = PTR_ERR(phy->pad_rst);
+		dev_err(phy->u_phy.dev,
+			"Failed to get UTMI-pads reset: %d\n", err);
+		return err;
+	}
+
+	err = reset_control_deassert(phy->pad_rst);
+	if (err) {
+		dev_err(phy->u_phy.dev,
+			"Failed to initialize UTMI-pads reset: %d\n", err);
+		return err;
+	}
+
 	return 0;
 }
 
+static int utmip_pad_close(struct tegra_usb_phy *phy)
+{
+	int ret;
+
+	ret = clk_prepare_enable(phy->pad_clk);
+	if (ret) {
+		dev_err(phy->u_phy.dev,
+			"Failed to enable UTMI-pads clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = reset_control_assert(phy->pad_rst);
+	if (ret)
+		dev_err(phy->u_phy.dev,
+			"Failed to assert UTMI-pads reset: %d\n", ret);
+
+	udelay(1);
+
+	clk_disable_unprepare(phy->pad_clk);
+
+	return ret;
+}
+
 static void utmip_pad_power_on(struct tegra_usb_phy *phy)
 {
 	unsigned long val, flags;
@@ -260,6 +299,10 @@ static void utmip_pad_power_on(struct tegra_usb_phy *phy)
 	spin_lock_irqsave(&utmip_pad_lock, flags);
 
 	if (utmip_pad_count++ == 0) {
+		reset_control_assert(phy->pad_rst);
+		udelay(1);
+		reset_control_deassert(phy->pad_rst);
+
 		val = readl(base + UTMIP_BIAS_CFG0);
 		val &= ~(UTMIP_OTGPD | UTMIP_BIASPD);
 
@@ -702,6 +745,9 @@ static void tegra_usb_phy_close(struct tegra_usb_phy *phy)
 	if (!IS_ERR(phy->vbus))
 		regulator_disable(phy->vbus);
 
+	if (!phy->is_ulpi_phy)
+		utmip_pad_close(phy);
+
 	clk_disable_unprepare(phy->pll_u);
 }
 
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index d641ea1660b7..0c5c3ea8b2d7 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -17,6 +17,7 @@
 #define __TEGRA_USB_PHY_H
 
 #include <linux/clk.h>
+#include <linux/reset.h>
 #include <linux/usb/otg.h>
 
 /*
@@ -76,6 +77,7 @@ struct tegra_usb_phy {
 	bool is_legacy_phy;
 	bool is_ulpi_phy;
 	int reset_gpio;
+	struct reset_control *pad_rst;
 };
 
 void tegra_usb_phy_preresume(struct usb_phy *phy);
-- 
2.15.1
