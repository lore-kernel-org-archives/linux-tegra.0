From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 14/20] usb: phy: tegra: Disable VBUS regulator on tegra_usb_phy_init failure
Date: Mon,  6 Jan 2020 04:34:10 +0300
Message-ID: <20200106013416.9604-15-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

VBUS regulator should be turned off in a case of error.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index c431968d0433..90b42e963a1e 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -864,20 +864,20 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 		dev_err(phy->u_phy.dev, "Invalid pll_u parent rate %ld\n",
 			parent_rate);
 		err = -EINVAL;
-		goto fail;
+		goto disable_clk;
 	}
 
 	err = regulator_enable(phy->vbus);
 	if (err) {
 		dev_err(phy->u_phy.dev,
 			"Failed to enable USB VBUS regulator: %d\n", err);
-		goto fail;
+		goto disable_clk;
 	}
 
 	if (!phy->is_ulpi_phy) {
 		err = utmip_pad_open(phy);
 		if (err)
-			goto fail;
+			goto disable_vbus;
 	}
 
 	err = tegra_usb_phy_power_on(phy);
@@ -889,7 +889,11 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 close_phy:
 	if (!phy->is_ulpi_phy)
 		utmip_pad_close(phy);
-fail:
+
+disable_vbus:
+	regulator_disable(phy->vbus);
+
+disable_clk:
 	clk_disable_unprepare(phy->pll_u);
 
 	phy->freq = NULL;
-- 
2.24.0
