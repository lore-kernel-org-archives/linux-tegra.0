From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 02/12] drm/tegra: Clean-up if probing DPAUX fails
Date: Thu, 23 Jun 2016 16:58:55 +0100
Message-ID: <1466697545-11868-3-git-send-email-jonathanh@nvidia.com>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If the probing of the DPAUX fails, then clocks are left enabled and the
DPAUX reset de-asserted. Add code to perform the necessary clean-up on
probe failure by disabling clocks and asserting the reset.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index b24a0f14821a..0874a7e5b37b 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -321,28 +321,30 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	if (IS_ERR(dpaux->clk_parent)) {
 		dev_err(&pdev->dev, "failed to get parent clock: %ld\n",
 			PTR_ERR(dpaux->clk_parent));
-		return PTR_ERR(dpaux->clk_parent);
+		err = PTR_ERR(dpaux->clk_parent);
+		goto assert_reset;
 	}
 
 	err = clk_prepare_enable(dpaux->clk_parent);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable parent clock: %d\n",
 			err);
-		return err;
+		goto assert_reset;
 	}
 
 	err = clk_set_rate(dpaux->clk_parent, 270000000);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to set clock to 270 MHz: %d\n",
 			err);
-		return err;
+		goto disable_parent_clk;
 	}
 
 	dpaux->vdd = devm_regulator_get(&pdev->dev, "vdd");
 	if (IS_ERR(dpaux->vdd)) {
 		dev_err(&pdev->dev, "failed to get VDD supply: %ld\n",
 			PTR_ERR(dpaux->vdd));
-		return PTR_ERR(dpaux->vdd);
+		err = PTR_ERR(dpaux->vdd);
+		goto disable_parent_clk;
 	}
 
 	err = devm_request_irq(dpaux->dev, dpaux->irq, tegra_dpaux_irq, 0,
@@ -350,7 +352,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	if (err < 0) {
 		dev_err(dpaux->dev, "failed to request IRQ#%u: %d\n",
 			dpaux->irq, err);
-		return err;
+		goto disable_parent_clk;
 	}
 
 	disable_irq(dpaux->irq);
@@ -360,7 +362,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 
 	err = drm_dp_aux_register(&dpaux->aux);
 	if (err < 0)
-		return err;
+		goto disable_parent_clk;
 
 	/*
 	 * Assume that by default the DPAUX/I2C pads will be used for HDMI,
@@ -393,6 +395,14 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dpaux);
 
 	return 0;
+
+disable_parent_clk:
+	clk_disable_unprepare(dpaux->clk_parent);
+assert_reset:
+	reset_control_assert(dpaux->rst);
+	clk_disable_unprepare(dpaux->clk);
+
+	return err;
 }
 
 static int tegra_dpaux_remove(struct platform_device *pdev)
-- 
2.1.4

