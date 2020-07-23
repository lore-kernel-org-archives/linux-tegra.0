From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v4 02/14] i2c: tegra: Remove NULL pointer check before clk_enable/disable/prepare/unprepare
Date: Thu, 23 Jul 2020 16:51:00 -0700
Message-ID: <1595548272-9809-3-git-send-email-skomatineni@nvidia.com>
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595548272-9809-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

clk_enable, clk_disable, clk_prepare, and clk_unprepare APIs have
implementation for checking clk pointer not NULL and clock consumers
can safely call these APIs without NULL pointer check.

So, this patch cleans up Tegra i2c driver to remove explicit checks
before these APIs.

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c | 64 +++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 41 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3be1018..c91307b9 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -655,21 +655,17 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (!i2c_dev->hw->has_single_clk_source) {
-		ret = clk_enable(i2c_dev->fast_clk);
-		if (ret < 0) {
-			dev_err(i2c_dev->dev,
-				"Enabling fast clk failed, err %d\n", ret);
-			return ret;
-		}
+	ret = clk_enable(i2c_dev->fast_clk);
+	if (ret < 0) {
+		dev_err(i2c_dev->dev,
+			"Enabling fast clk failed, err %d\n", ret);
+		return ret;
 	}
 
-	if (i2c_dev->slow_clk) {
-		ret = clk_enable(i2c_dev->slow_clk);
-		if (ret < 0) {
-			dev_err(dev, "failed to enable slow clock: %d\n", ret);
-			return ret;
-		}
+	ret = clk_enable(i2c_dev->slow_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable slow clock: %d\n", ret);
+		return ret;
 	}
 
 	ret = clk_enable(i2c_dev->div_clk);
@@ -688,12 +684,8 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 
 	clk_disable(i2c_dev->div_clk);
-
-	if (i2c_dev->slow_clk)
-		clk_disable(i2c_dev->slow_clk);
-
-	if (!i2c_dev->hw->has_single_clk_source)
-		clk_disable(i2c_dev->fast_clk);
+	clk_disable(i2c_dev->slow_clk);
+	clk_disable(i2c_dev->fast_clk);
 
 	return pinctrl_pm_select_idle_state(i2c_dev->dev);
 }
@@ -1716,20 +1708,16 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c_dev);
 
-	if (!i2c_dev->hw->has_single_clk_source) {
-		ret = clk_prepare(i2c_dev->fast_clk);
-		if (ret < 0) {
-			dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
-			return ret;
-		}
+	ret = clk_prepare(i2c_dev->fast_clk);
+	if (ret < 0) {
+		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
+		return ret;
 	}
 
-	if (i2c_dev->slow_clk) {
-		ret = clk_prepare(i2c_dev->slow_clk);
-		if (ret < 0) {
-			dev_err(dev, "failed to prepare slow clock: %d\n", ret);
-			goto unprepare_fast_clk;
-		}
+	ret = clk_prepare(i2c_dev->slow_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to prepare slow clock: %d\n", ret);
+		goto unprepare_fast_clk;
 	}
 
 	if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ &&
@@ -1843,12 +1831,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	clk_unprepare(i2c_dev->div_clk);
 
 unprepare_slow_clk:
-	if (i2c_dev->is_vi)
-		clk_unprepare(i2c_dev->slow_clk);
+	clk_unprepare(i2c_dev->slow_clk);
 
 unprepare_fast_clk:
-	if (!i2c_dev->hw->has_single_clk_source)
-		clk_unprepare(i2c_dev->fast_clk);
+	clk_unprepare(i2c_dev->fast_clk);
 
 	return ret;
 }
@@ -1867,12 +1853,8 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 		tegra_i2c_runtime_suspend(&pdev->dev);
 
 	clk_unprepare(i2c_dev->div_clk);
-
-	if (i2c_dev->slow_clk)
-		clk_unprepare(i2c_dev->slow_clk);
-
-	if (!i2c_dev->hw->has_single_clk_source)
-		clk_unprepare(i2c_dev->fast_clk);
+	clk_unprepare(i2c_dev->slow_clk);
+	clk_unprepare(i2c_dev->fast_clk);
 
 	tegra_i2c_release_dma(i2c_dev);
 	return 0;
-- 
2.7.4
