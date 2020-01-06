From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 04/20] usb: phy: tegra: Keep track of power on-off state
Date: Mon,  6 Jan 2020 04:34:00 +0300
Message-ID: <20200106013416.9604-5-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The PHY driver should keep track of the enable state, otherwise enable
refcount is screwed if USB driver tries to enable PHY when it is already
enabled. This will be the case for ChipIdea and Tegra EHCI drivers once
PHY driver will gain support for the init/shutdown callbacks.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 30 ++++++++++++++++++++++++++----
 include/linux/usb/tegra_usb_phy.h |  1 +
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 99acfde4ab8d..88466c7f13e6 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -785,18 +785,40 @@ static void tegra_usb_phy_close(struct tegra_usb_phy *phy)
 
 static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
 {
+	int err;
+
+	if (phy->powered_on)
+		return 0;
+
 	if (phy->is_ulpi_phy)
-		return ulpi_phy_power_on(phy);
+		err = ulpi_phy_power_on(phy);
 	else
-		return utmi_phy_power_on(phy);
+		err = utmi_phy_power_on(phy);
+	if (err)
+		return err;
+
+	phy->powered_on = true;
+
+	return 0;
 }
 
 static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
 {
+	int err;
+
+	if (!phy->powered_on)
+		return 0;
+
 	if (phy->is_ulpi_phy)
-		return ulpi_phy_power_off(phy);
+		err = ulpi_phy_power_off(phy);
 	else
-		return utmi_phy_power_off(phy);
+		err = utmi_phy_power_off(phy);
+	if (err)
+		return err;
+
+	phy->powered_on = false;
+
+	return 0;
 }
 
 static int	tegra_usb_phy_suspend(struct usb_phy *x, int suspend)
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 0c5c3ea8b2d7..3ae73bdc6245 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -78,6 +78,7 @@ struct tegra_usb_phy {
 	bool is_ulpi_phy;
 	int reset_gpio;
 	struct reset_control *pad_rst;
+	bool powered_on;
 };
 
 void tegra_usb_phy_preresume(struct usb_phy *phy);
-- 
2.24.0
