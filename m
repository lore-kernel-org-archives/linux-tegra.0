From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 11/16] usb: phy: tegra: Disable VBUS regulator on tegra_usb_phy_init failure
Date: Sat, 28 Dec 2019 23:33:53 +0300
Message-ID: <20191228203358.23490-12-digetx@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228203358.23490-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

VBUS regulator should be turned off in a case of error.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index cc6cca4dcecb..f7e7df812f83 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -851,14 +851,14 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
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
 
 	if (phy->is_ulpi_phy)
@@ -866,7 +866,7 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 	else
 		err = utmip_pad_open(phy);
 	if (err)
-		goto fail;
+		goto disable_vbus;
 
 	err = tegra_usb_phy_power_on(phy);
 	if (err)
@@ -879,7 +879,11 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 		ulpi_close(phy);
 	else
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
