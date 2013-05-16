From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 6/8] usb: phy: tegra: get ULPI reset GPIO info using DT.
Date: Thu, 16 May 2013 19:43:00 +0530
Message-ID: <1368713582-29038-7-git-send-email-vbyravarasu@nvidia.com>
References: <1368713582-29038-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368713582-29038-1-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

As GPIO information is avail through DT, used it to get Tegra ULPI
reset GPIO number. Added a new member to tegra_usb_phy structure to
store this number.

Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
delta from v1, v2 & v3: no change.

 drivers/usb/phy/phy-tegra-usb.c   |   25 +++++++++++--------------
 include/linux/usb/tegra_usb_phy.h |    1 +
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 0ff1f3e..b8c688a 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -541,11 +541,10 @@ static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
 	int ret;
 	unsigned long val;
 	void __iomem *base = phy->regs;
-	struct tegra_ulpi_config *config = phy->config;
 
-	gpio_direction_output(config->reset_gpio, 0);
+	gpio_direction_output(phy->reset_gpio, 0);
 	msleep(5);
-	gpio_direction_output(config->reset_gpio, 1);
+	gpio_direction_output(phy->reset_gpio, 1);
 
 	clk_prepare_enable(phy->clk);
 	msleep(1);
@@ -603,10 +602,8 @@ static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
 
 static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
 {
-	struct tegra_ulpi_config *config = phy->config;
-
 	clk_disable(phy->clk);
-	return gpio_direction_output(config->reset_gpio, 0);
+	return gpio_direction_output(phy->reset_gpio, 0);
 }
 
 static int	tegra_phy_init(struct usb_phy *x)
@@ -622,18 +619,18 @@ static int	tegra_phy_init(struct usb_phy *x)
 			pr_err("%s: can't get ulpi clock\n", __func__);
 			return PTR_ERR(phy->clk);
 		}
-		if (!gpio_is_valid(ulpi_config->reset_gpio))
-			ulpi_config->reset_gpio =
-				of_get_named_gpio(phy->dev->of_node,
-						  "nvidia,phy-reset-gpio", 0);
-		if (!gpio_is_valid(ulpi_config->reset_gpio)) {
+
+		phy->reset_gpio =
+			of_get_named_gpio(phy->dev->of_node,
+					  "nvidia,phy-reset-gpio", 0);
+		if (!gpio_is_valid(phy->reset_gpio)) {
 			pr_err("%s: invalid reset gpio: %d\n", __func__,
-			       ulpi_config->reset_gpio);
+			       phy->reset_gpio);
 			err = -EINVAL;
 			goto err1;
 		}
-		gpio_request(ulpi_config->reset_gpio, "ulpi_phy_reset_b");
-		gpio_direction_output(ulpi_config->reset_gpio, 0);
+		gpio_request(phy->reset_gpio, "ulpi_phy_reset_b");
+		gpio_direction_output(phy->reset_gpio, 0);
 		phy->ulpi = otg_ulpi_create(&ulpi_viewport_access_ops, 0);
 		phy->ulpi->io_priv = phy->regs + ULPI_VIEWPORT;
 	} else {
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index ff2d959..97d123c 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -62,6 +62,7 @@ struct tegra_usb_phy {
 	struct device *dev;
 	bool is_legacy_phy;
 	bool is_ulpi_phy;
+	int reset_gpio;
 	void (*set_pts)(struct usb_phy *x, u8 pts_val);
 	void (*set_phcd)(struct usb_phy *x, bool enable);
 };
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
