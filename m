From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v3 05/18] i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
Date: Tue, 14 Jul 2020 21:20:42 -0700
Message-ID: <1594786855-26506-6-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

tegra_i2c_runtime_resume does not disable prior enabled clocks
properly.

This patch fixes it.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c91307b9..7b93c45 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -665,18 +665,23 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	ret = clk_enable(i2c_dev->slow_clk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable slow clock: %d\n", ret);
-		return ret;
+		goto disable_fast_clk;
 	}
 
 	ret = clk_enable(i2c_dev->div_clk);
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
+	clk_disable(i2c_dev->slow_clk);
+disable_fast_clk:
+	clk_disable(i2c_dev->fast_clk);
+	return ret;
 }
 
 static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
-- 
2.7.4
