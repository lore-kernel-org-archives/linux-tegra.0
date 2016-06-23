From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 05/12] drm/tegra: Prepare DPAUX for supporting generic PM domains
Date: Thu, 23 Jun 2016 16:58:58 +0100
Message-ID: <1466697545-11868-6-git-send-email-jonathanh@nvidia.com>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

To utilise the DPAUX on Tegra, the SOR power partition must be enabled.
Now that Tegra supports the generic PM domain framework we manage the
SOR power partition via this framework for DPAUX. However, the sequence
for gating/ungating the SOR power partition requires that the DPAUX
reset is asserted/de-asserted at the time the SOR power partition is
gated/ungated, respectively. Now that the reset control core assumes
that resets are exclusive, the Tegra generic PM domain code and the
DPAUX driver cannot request the same reset unless we mark the resets as
shared. Sharing resets we will not work in this case because we cannot
guarantee that the reset is asserted/de-asserted at the appropriate
time. Therefore, given that the Tegra generic PM domain code will handle
the DPAUX reset, do not request the reset in the DPAUX driver if the
DPAUX device has a PM domain associated.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 4014ec57ed31..61821f457209 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -339,11 +339,14 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	dpaux->rst = devm_reset_control_get(&pdev->dev, "dpaux");
-	if (IS_ERR(dpaux->rst)) {
-		dev_err(&pdev->dev, "failed to get reset control: %ld\n",
-			PTR_ERR(dpaux->rst));
-		return PTR_ERR(dpaux->rst);
+	if (!pdev->dev.pm_domain) {
+		dpaux->rst = devm_reset_control_get(&pdev->dev, "dpaux");
+		if (IS_ERR(dpaux->rst)) {
+			dev_err(&pdev->dev,
+				"failed to get reset control: %ld\n",
+				PTR_ERR(dpaux->rst));
+			return PTR_ERR(dpaux->rst);
+		}
 	}
 
 	dpaux->clk = devm_clk_get(&pdev->dev, NULL);
@@ -360,7 +363,8 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	reset_control_deassert(dpaux->rst);
+	if (dpaux->rst)
+		reset_control_deassert(dpaux->rst);
 
 	dpaux->clk_parent = devm_clk_get(&pdev->dev, "parent");
 	if (IS_ERR(dpaux->clk_parent)) {
@@ -438,7 +442,8 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 disable_parent_clk:
 	clk_disable_unprepare(dpaux->clk_parent);
 assert_reset:
-	reset_control_assert(dpaux->rst);
+	if (dpaux->rst)
+		reset_control_assert(dpaux->rst);
 	clk_disable_unprepare(dpaux->clk);
 
 	return err;
@@ -460,7 +465,8 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
 	cancel_work_sync(&dpaux->work);
 
 	clk_disable_unprepare(dpaux->clk_parent);
-	reset_control_assert(dpaux->rst);
+	if (dpaux->rst)
+		reset_control_assert(dpaux->rst);
 	clk_disable_unprepare(dpaux->clk);
 
 	return 0;
-- 
2.1.4
