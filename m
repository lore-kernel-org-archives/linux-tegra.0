From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v1 04/18] i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
Date: Tue, 9 Jun 2020 23:02:26 -0700
Message-ID: <1591768960-31648-5-git-send-email-skomatineni@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

tegra_i2c_runtime_resume does not disable prior enabled clocks
properly.

This patch fixes it.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3be1018..dba38a5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -668,7 +668,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 		ret = clk_enable(i2c_dev->slow_clk);
 		if (ret < 0) {
 			dev_err(dev, "failed to enable slow clock: %d\n", ret);
-			return ret;
+			goto disable_fast_clk;
 		}
 	}
 
@@ -676,11 +676,18 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	if (ret < 0) {
 		dev_err(i2c_dev->dev,
 			"Enabling div clk failed, err %d\n", ret);
-		clk_disable(i2c_dev->fast_clk);
-		return ret;
+		goto disable_slow_clk;
 	}
 
 	return 0;
+
+disable_slow_clk:
+	if (i2c_dev->slow_clk)
+		clk_disable(i2c_dev->slow_clk);
+disable_fast_clk:
+	if (!i2c_dev->hw->has_single_clk_source)
+		clk_disable(i2c_dev->fast_clk);
+	return ret;
 }
 
 static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
-- 
2.7.4
