From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3 REPOST 5/7] USB: EHCI: tegra: fix circular module dependencies
Date: Thu, 13 Jun 2013 11:24:11 -0600
Message-ID: <1371144253-21295-6-git-send-email-swarren@wwwdotorg.org>
References: <1371144253-21295-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371144253-21295-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra EHCI driver directly calls various functions in the Tegra USB
PHY driver. The reverse is also true; the PHY driver calls into the EHCI
driver. This is problematic when the two are built as modules.

The calls from the PHY to EHCI driver were originally added in commit
bbdabdb "usb: add APIs to access host registers from Tegra PHY", for the
following reasons:

1) The register being touched is an EHCI register, so logically only the
   EHCI driver should touch it.
2) (1) implies that some locking may be needed to correctly implement the
   r/m/w access to this shared register.
3) We were expecting to pass only the PHY register space to the Tegra PHY
   driver, and hence it would not have access to touch the shared
   registers.

To solve this, that commit added functions in the EHCI driver to touch the
shared register on behalf of the PHY driver.

In practice, we ended up not having any locking in the implementaiton of
those functions, and I've been led to believe this is safe. Equally, (3)
did not happen either. Hence, it is possible for the PHY driver to touch
the shared register directly.

Given that, this patch moves the code to touch the shared register back
into the PHY driver, to eliminate the module problems. If we actually
need locking or co-ordination in the future, I propose we put the lock
support into some pre-existing core module, or into a third separate
module, in order to avoid the circular dependencies.

I apologize for my contribution to code churn here.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
v3: No change.
v2: No change; just rebased on new versions of earlier patches.
---
 drivers/usb/host/ehci-tegra.c     | 36 ------------------------------------
 drivers/usb/phy/phy-tegra-usb.c   | 39 ++++++++++++++++++++++++++++++++++++---
 include/linux/usb/tegra_usb_phy.h |  4 ----
 3 files changed, 36 insertions(+), 43 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index dde5189..8063429 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -34,11 +34,6 @@
 #define TEGRA_USB2_BASE			0xC5004000
 #define TEGRA_USB3_BASE			0xC5008000
 
-/* PORTSC registers */
-#define TEGRA_USB_PORTSC1			0x184
-#define TEGRA_USB_PORTSC1_PTS(x)	(((x) & 0x3) << 30)
-#define TEGRA_USB_PORTSC1_PHCD	(1 << 23)
-
 #define TEGRA_USB_DMA_ALIGN 32
 
 struct tegra_ehci_hcd {
@@ -380,37 +375,6 @@ static int setup_vbus_gpio(struct platform_device *pdev,
 	return err;
 }
 
-/* Bits of PORTSC1, which will get cleared by writing 1 into them */
-#define TEGRA_PORTSC1_RWC_BITS (PORT_CSC | PORT_PEC | PORT_OCC)
-
-void tegra_ehci_set_pts(struct usb_phy *x, u8 pts_val)
-{
-	unsigned long val;
-	struct usb_hcd *hcd = bus_to_hcd(x->otg->host);
-	void __iomem *base = hcd->regs;
-
-	val = readl(base + TEGRA_USB_PORTSC1) & ~TEGRA_PORTSC1_RWC_BITS;
-	val &= ~TEGRA_USB_PORTSC1_PTS(3);
-	val |= TEGRA_USB_PORTSC1_PTS(pts_val & 3);
-	writel(val, base + TEGRA_USB_PORTSC1);
-}
-EXPORT_SYMBOL_GPL(tegra_ehci_set_pts);
-
-void tegra_ehci_set_phcd(struct usb_phy *x, bool enable)
-{
-	unsigned long val;
-	struct usb_hcd *hcd = bus_to_hcd(x->otg->host);
-	void __iomem *base = hcd->regs;
-
-	val = readl(base + TEGRA_USB_PORTSC1) & ~TEGRA_PORTSC1_RWC_BITS;
-	if (enable)
-		val |= TEGRA_USB_PORTSC1_PHCD;
-	else
-		val &= ~TEGRA_USB_PORTSC1_PHCD;
-	writel(val, base + TEGRA_USB_PORTSC1);
-}
-EXPORT_SYMBOL_GPL(tegra_ehci_set_phcd);
-
 static int tegra_ehci_probe(struct platform_device *pdev)
 {
 	struct resource *res;
diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index f0727f2..3446245 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -32,11 +32,20 @@
 #include <linux/usb/otg.h>
 #include <linux/usb/ulpi.h>
 #include <asm/mach-types.h>
+#include <linux/usb/ehci_def.h>
 #include <linux/usb/tegra_usb_phy.h>
 #include <linux/module.h>
 
 #define ULPI_VIEWPORT		0x170
 
+/* PORTSC registers */
+#define TEGRA_USB_PORTSC1				0x184
+#define TEGRA_USB_PORTSC1_PTS(x)			(((x) & 0x3) << 30)
+#define TEGRA_USB_PORTSC1_PHCD				(1 << 23)
+
+/* Bits of PORTSC1, which will get cleared by writing 1 into them */
+#define TEGRA_PORTSC1_RWC_BITS	(PORT_CSC | PORT_PEC | PORT_OCC)
+
 #define USB_SUSP_CTRL		0x400
 #define   USB_WAKE_ON_CNNT_EN_DEV	(1 << 3)
 #define   USB_WAKE_ON_DISCON_EN_DEV	(1 << 4)
@@ -197,6 +206,30 @@ static struct tegra_utmip_config utmip_default[] = {
 	},
 };
 
+static void set_pts(struct tegra_usb_phy *phy, u8 pts_val)
+{
+	void __iomem *base = phy->regs;
+	unsigned long val;
+
+	val = readl(base + TEGRA_USB_PORTSC1) & ~TEGRA_PORTSC1_RWC_BITS;
+	val &= ~TEGRA_USB_PORTSC1_PTS(3);
+	val |= TEGRA_USB_PORTSC1_PTS(pts_val & 3);
+	writel(val, base + TEGRA_USB_PORTSC1);
+}
+
+static void set_phcd(struct tegra_usb_phy *phy, bool enable)
+{
+	void __iomem *base = phy->regs;
+	unsigned long val;
+
+	val = readl(base + TEGRA_USB_PORTSC1) & ~TEGRA_PORTSC1_RWC_BITS;
+	if (enable)
+		val |= TEGRA_USB_PORTSC1_PHCD;
+	else
+		val &= ~TEGRA_USB_PORTSC1_PHCD;
+	writel(val, base + TEGRA_USB_PORTSC1);
+}
+
 static int utmip_pad_open(struct tegra_usb_phy *phy)
 {
 	phy->pad_clk = devm_clk_get(phy->dev, "utmi-pads");
@@ -283,7 +316,7 @@ static void utmi_phy_clk_disable(struct tegra_usb_phy *phy)
 		val &= ~USB_SUSP_SET;
 		writel(val, base + USB_SUSP_CTRL);
 	} else
-		tegra_ehci_set_phcd(&phy->u_phy, true);
+		set_phcd(phy, true);
 
 	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID, 0) < 0)
 		pr_err("%s: timeout waiting for phy to stabilize\n", __func__);
@@ -305,7 +338,7 @@ static void utmi_phy_clk_enable(struct tegra_usb_phy *phy)
 		val &= ~USB_SUSP_CLR;
 		writel(val, base + USB_SUSP_CTRL);
 	} else
-		tegra_ehci_set_phcd(&phy->u_phy, false);
+		set_phcd(phy, false);
 
 	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
 						     USB_PHY_CLK_VALID))
@@ -428,7 +461,7 @@ static int utmi_phy_power_on(struct tegra_usb_phy *phy)
 	utmi_phy_clk_enable(phy);
 
 	if (!phy->is_legacy_phy)
-		tegra_ehci_set_pts(&phy->u_phy, 0);
+		set_pts(phy, 0);
 
 	return 0;
 }
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 0cd15d2..d2ca919 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -76,8 +76,4 @@ void tegra_ehci_phy_restore_start(struct usb_phy *phy,
 
 void tegra_ehci_phy_restore_end(struct usb_phy *phy);
 
-void tegra_ehci_set_pts(struct usb_phy *x, u8 pts_val);
-
-void tegra_ehci_set_phcd(struct usb_phy *x, bool enable);
