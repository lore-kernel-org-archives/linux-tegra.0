From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v3 04/18] i2c: tegra: Remove NULL pointer check before clk_enable/disable/prepare/unprepare
Date: Tue, 14 Jul 2020 21:20:41 -0700
Message-ID: <1594786855-26506-5-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

clk_enable, clk_disable, clk_prepare, and clk_unprepare APIs have
implementation for checking clk pointer not NULL and clock consumers
can safely call these APIs without NULL pointer check.

So, this patch cleans up Tegra i2c driver to remove explicit checks
before these APIs.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
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
