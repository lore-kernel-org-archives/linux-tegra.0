From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 12/20] PM / devfreq: tegra30: Move clk-notifier's registration to governor's start
Date: Tue, 30 Jul 2019 19:22:28 +0300
Message-ID: <20190730162236.6063-13-digetx@gmail.com>
References: <20190730162236.6063-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730162236.6063-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no point in receiving of the notifications while governor is
stopped, let's keep them disabled like we do for the CPU freq-change
notifications. This also fixes a potential use-after-free bug if
notification happens after device's removal.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 33 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 17de24d2ae32..762e17323095 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -724,6 +724,19 @@ static int tegra_actmon_start(struct tegra_devfreq *tegra)
 	actmon_writel(tegra, ACTMON_SAMPLING_PERIOD - 1,
 		      ACTMON_GLB_PERIOD_CTRL);
 
+	/*
+	 * CLK notifications are needed in order to reconfigure the upper
+	 * consecutive watermark in accordance to the actual clock rate
+	 * to avoid unnecessary upper interrupts.
+	 */
+	err = clk_notifier_register(tegra->emc_clock,
+				    &tegra->clk_rate_change_nb);
+	if (err) {
+		dev_err(tegra->devfreq->dev.parent,
+			"Failed to register rate change notifier\n");
+		return err;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++)
 		tegra_actmon_configure_device(tegra, &tegra->devices[i]);
 
@@ -750,6 +763,8 @@ static int tegra_actmon_start(struct tegra_devfreq *tegra)
 	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++)
 		tegra_actmon_stop_device(&tegra->devices[i]);
 
+	clk_notifier_unregister(tegra->emc_clock, &tegra->clk_rate_change_nb);
+
 	return err;
 }
 
@@ -766,6 +781,8 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
 
 	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++)
 		tegra_actmon_stop_device(&tegra->devices[i]);
+
+	clk_notifier_unregister(tegra->emc_clock, &tegra->clk_rate_change_nb);
 }
 
 static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
@@ -1010,24 +1027,16 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, tegra);
 
+	tegra->clk_rate_change_nb.notifier_call = tegra_actmon_clk_notify_cb;
 	tegra->cpu_rate_change_nb.notifier_call = tegra_actmon_cpu_notify_cb;
 
 	INIT_DELAYED_WORK(&tegra->cpufreq_update_work,
 			  tegra_actmon_delayed_update);
 
-	tegra->clk_rate_change_nb.notifier_call = tegra_actmon_clk_notify_cb;
-	err = clk_notifier_register(tegra->emc_clock,
-				    &tegra->clk_rate_change_nb);
-	if (err) {
-		dev_err(&pdev->dev,
-			"Failed to register rate change notifier\n");
-		goto remove_opps;
-	}
-
 	err = devfreq_add_governor(&tegra_devfreq_governor);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to add governor: %d\n", err);
-		goto unreg_notifier;
+		goto remove_opps;
 	}
 
 	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
@@ -1045,9 +1054,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 remove_governor:
 	devfreq_remove_governor(&tegra_devfreq_governor);
 
-unreg_notifier:
-	clk_notifier_unregister(tegra->emc_clock, &tegra->clk_rate_change_nb);
-
 remove_opps:
 	dev_pm_opp_remove_all_dynamic(&pdev->dev);
 
@@ -1064,7 +1070,6 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
 	devfreq_remove_device(tegra->devfreq);
 	devfreq_remove_governor(&tegra_devfreq_governor);
 
-	clk_notifier_unregister(tegra->emc_clock, &tegra->clk_rate_change_nb);
 	dev_pm_opp_remove_all_dynamic(&pdev->dev);
 
 	reset_control_reset(tegra->reset);
-- 
2.22.0
