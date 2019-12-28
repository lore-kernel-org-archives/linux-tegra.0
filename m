From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 05/16] usb: phy: tegra: Use generic stub for a missing VBUS regulator
Date: Sat, 28 Dec 2019 23:33:47 +0300
Message-ID: <20191228203358.23490-6-digetx@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228203358.23490-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Regulator core provides dummy regulator if device-tree doesn't define VBUS
regulator.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 4d6d586c49cc..0a07efc9de06 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -798,9 +798,7 @@ static void tegra_usb_phy_shutdown(struct usb_phy *u_phy)
 	else
 		utmip_pad_close(phy);
 
-	if (!IS_ERR(phy->vbus))
-		regulator_disable(phy->vbus);
-
+	regulator_disable(phy->vbus);
 	clk_disable_unprepare(phy->pll_u);
 
 	phy->freq = NULL;
@@ -878,14 +876,11 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 		goto fail;
 	}
 
-	if (!IS_ERR(phy->vbus)) {
-		err = regulator_enable(phy->vbus);
-		if (err) {
-			dev_err(phy->u_phy.dev,
-				"Failed to enable USB VBUS regulator: %d\n",
-				err);
-			goto fail;
-		}
+	err = regulator_enable(phy->vbus);
+	if (err) {
+		dev_err(phy->u_phy.dev,
+			"Failed to enable USB VBUS regulator: %d\n", err);
+		goto fail;
 	}
 
 	if (phy->is_ulpi_phy)
@@ -1120,14 +1115,9 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	}
 
 	/* On some boards, the VBUS regulator doesn't need to be controlled */
-	if (of_find_property(np, "vbus-supply", NULL)) {
-		tegra_phy->vbus = devm_regulator_get(&pdev->dev, "vbus");
-		if (IS_ERR(tegra_phy->vbus))
-			return PTR_ERR(tegra_phy->vbus);
-	} else {
-		dev_notice(&pdev->dev, "no vbus regulator");
-		tegra_phy->vbus = ERR_PTR(-ENODEV);
-	}
+	tegra_phy->vbus = devm_regulator_get(&pdev->dev, "vbus");
+	if (IS_ERR(tegra_phy->vbus))
+		return PTR_ERR(tegra_phy->vbus);
 
 	tegra_phy->pll_u = devm_clk_get(&pdev->dev, "pll_u");
 	err = PTR_ERR_OR_ZERO(tegra_phy->pll_u);
-- 
2.24.0
