From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] usb: phy: tegra: Add support for device tree-based vbus regulator control
Date: Wed, 26 Jun 2013 12:59:38 +0300
Message-ID: <1372240781-1017-2-git-send-email-mperttunen@nvidia.com>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372240781-1017-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

After this patch, usb vbus regulators for tegra usb phy devices can be specified
with the device tree attribute vbus-supply = <&x> where x is a regulator defined
in the device tree.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-tegra-usb.c   | 24 ++++++++++++++++++++++++
 include/linux/usb/tegra_usb_phy.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index d7d6bd7..6122590 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -34,6 +34,7 @@
 #include <asm/mach-types.h>
 #include <linux/usb/ehci_def.h>
 #include <linux/usb/tegra_usb_phy.h>
+#include <linux/regulator/consumer.h>
 
 #define ULPI_VIEWPORT		0x170
 
@@ -250,12 +251,24 @@ static int utmip_pad_open(struct tegra_usb_phy *phy)
 		return PTR_ERR(phy->pad_clk);
 	}
 
+	phy->vbus = devm_regulator_get(phy->dev, "vbus");
+	/* On some boards, the VBUS regulator doesn't need to be controlled */
+	if (IS_ERR(phy->vbus)) {
+		if (PTR_ERR(phy->vbus) == -ENODEV) {
+			dev_notice(phy->dev, "no vbus regulator");
+			phy->vbus = NULL;
+		} else {
+			return PTR_ERR(phy->vbus);
+		}
+	}
+
 	return 0;
 }
 
 static void utmip_pad_power_on(struct tegra_usb_phy *phy)
 {
 	unsigned long val, flags;
+	int err;
 	void __iomem *base = phy->pad_regs;
 
 	clk_prepare_enable(phy->pad_clk);
@@ -280,6 +293,14 @@ static void utmip_pad_power_on(struct tegra_usb_phy *phy)
 	spin_unlock_irqrestore(&utmip_pad_lock, flags);
 
 	clk_disable_unprepare(phy->pad_clk);
+
+	if (phy->vbus) {
+		err = regulator_enable(phy->vbus);
+		if (err)
+			dev_err(phy->dev,
+				"failed to enable usb vbus regulator: %d\n",
+				err);
+	}
 }
 
 static int utmip_pad_power_off(struct tegra_usb_phy *phy)
@@ -306,6 +327,9 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 
 	clk_disable_unprepare(phy->pad_clk);
 
+	if (phy->vbus)
+		regulator_disable(phy->vbus);
+
 	return 0;
 }
 
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index d2ca919..2b5fa94 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -55,6 +55,7 @@ struct tegra_usb_phy {
 	struct clk *clk;
 	struct clk *pll_u;
 	struct clk *pad_clk;
+	struct regulator *vbus;
 	enum tegra_usb_phy_mode mode;
 	void *config;
 	struct usb_phy *ulpi;
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
