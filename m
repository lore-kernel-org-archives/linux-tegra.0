From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 04/13] drm/tegra: Add sor-safe clock for DPAUX on Tegra210
Date: Fri, 17 Jun 2016 13:03:38 +0100
Message-ID: <1466165027-17917-5-git-send-email-jonathanh@nvidia.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

For Tegra210 the 'sor-safe' clock needs to be enabled when using DPAUX.
Add support to the DPAUX driver for enabling this clock on Tegra210.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index aa3a037fcd3b..d696a7e45935 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -37,6 +37,7 @@ struct tegra_dpaux {
 
 	struct reset_control *rst;
 	struct clk *clk_parent;
+	struct clk *clk_sor;
 	struct clk *clk;
 
 	struct regulator *vdd;
@@ -340,18 +341,37 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 		return PTR_ERR(dpaux->rst);
 	}
 
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "nvidia,tegra210-dpaux")) {
+		dpaux->clk_sor = devm_clk_get(&pdev->dev, "sor-safe");
+		if (IS_ERR(dpaux->clk_sor)) {
+			dev_err(&pdev->dev,
+				"failed to get sor-safe clock: %ld\n",
+				PTR_ERR(dpaux->clk_sor));
+			return PTR_ERR(dpaux->clk_sor);
+		}
+
+		err = clk_prepare_enable(dpaux->clk_sor);
+		if (err < 0) {
+			dev_err(&pdev->dev,
+				"failed to enable sor-safe clock: %d\n", err);
+			return err;
+		}
+	}
+
 	dpaux->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(dpaux->clk)) {
 		dev_err(&pdev->dev, "failed to get module clock: %ld\n",
 			PTR_ERR(dpaux->clk));
-		return PTR_ERR(dpaux->clk);
+		err = PTR_ERR(dpaux->clk);
+		goto disable_sor_clk;
 	}
 
 	err = clk_prepare_enable(dpaux->clk);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable module clock: %d\n",
 			err);
-		return err;
+		goto disable_sor_clk;
 	}
 
 	reset_control_deassert(dpaux->rst);
@@ -434,6 +454,9 @@ disable_parent_clk:
 assert_reset:
 	reset_control_assert(dpaux->rst);
 	clk_disable_unprepare(dpaux->clk);
+disable_sor_clk:
+	if (dpaux->clk_sor)
+		clk_disable_unprepare(dpaux->clk_sor);
 
 	return err;
 }
@@ -456,6 +479,8 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
 	clk_disable_unprepare(dpaux->clk_parent);
 	reset_control_assert(dpaux->rst);
 	clk_disable_unprepare(dpaux->clk);
+	if (dpaux->clk_sor)
+		clk_disable_unprepare(dpaux->clk_sor);
 
 	return 0;
 }
-- 
2.1.4

