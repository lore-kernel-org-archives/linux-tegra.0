From: Venu Byravarasu <vbyravarasu@nvidia.com>
Subject: [PATCH v2 5/7] usb: phy: tegra: get ULPI reset GPIO info using DT.
Date: Wed, 3 Apr 2013 14:11:40 +0530
Message-ID: <1364978502-22887-6-git-send-email-vbyravarasu@nvidia.com>
References: <1364978502-22887-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1364978502-22887-1-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@ti.com, stern@rowland.harvard.edu, linux-tegra@vger.kernel.org, swarren@wwwdotorg.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Venu Byravarasu <vbyravarasu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

As GPIO information is avail through DT, used it to get Tegra ULPI
reset GPIO number. Added a new member to tegra_usb_phy structure to
store this number.

Signed-off-by: Venu Byravarasu <vbyravarasu@nvidia.com>
---
delta from v2: no change.

 drivers/usb/phy/phy-tegra-usb.c   |   25 +++++++++++--------------
 include/linux/usb/tegra_usb_phy.h |    1 +
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 16851e2..a2a89a9 100644
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
index a7af923..6cfb8f1 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -62,6 +62,7 @@ struct tegra_usb_phy {
 	struct device *dev;
 	bool is_legacy_phy;
 	bool is_ulpi_phy;
+	int reset_gpio;
 };
 
 struct tegra_usb_phy *tegra_usb_phy_open(struct device *dev, int instance,
-- 
1.7.0.4
