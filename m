From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 01/13] drm/tegra: Clean-up if probing DPAUX fails
Date: Fri, 17 Jun 2016 13:03:35 +0100
Message-ID: <1466165027-17917-2-git-send-email-jonathanh@nvidia.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466165027-17917-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If the probing of the DPAUX fails, then clocks are left enabled and the
DPAUX reset de-asserted. Add code to perform the necessary clean-up on
probe failure by disabling clocks and asserting the reset.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
