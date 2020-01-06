From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 03/20] usb: phy: tegra: Clean up ulpi_phy_power_off
Date: Mon,  6 Jan 2020 04:33:59 +0300
Message-ID: <20200106013416.9604-4-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Firstly, the PHY's clock needs to unprepared to keep prepare count
balanced. Secondly, downstream code suggests that reset is synchronous
and thus it should be asserted before disabling clock.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index ea7ef1dc0b42..99acfde4ab8d 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -757,8 +757,19 @@ static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
 
 static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
 {
-	clk_disable(phy->clk);
-	return gpio_direction_output(phy->reset_gpio, 0);
+	int err;
+
+	err = gpio_direction_output(phy->reset_gpio, 0);
+	if (err) {
+		dev_err(phy->u_phy.dev, "reset GPIO not asserted: %d\n", err);
+		return err;
+	}
+
+	usleep_range(5000, 6000);
+
+	clk_disable_unprepare(phy->clk);
+
+	return 0;
 }
 
 static void tegra_usb_phy_close(struct tegra_usb_phy *phy)
-- 
2.24.0
