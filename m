From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v8 11/21] clk: tegra: clk-dfll: Add suspend and resume support
Date: Thu, 8 Aug 2019 16:46:50 -0700
Message-ID: <1565308020-31952-12-git-send-email-skomatineni@nvidia.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch implements DFLL suspend and resume operation.

During system suspend entry, CPU clock will switch CPU to safe
clock source of PLLP and disables DFLL clock output.

DFLL driver suspend confirms DFLL disable state and errors out on
being active.

DFLL is re-initialized during the DFLL driver resume as it goes
through complete reset during suspend entry.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-dfll.c               | 56 ++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-dfll.h               |  2 ++
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c |  1 +
 3 files changed, 59 insertions(+)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index f8688c2ddf1a..eb298a5d7be9 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1487,6 +1487,7 @@ static int dfll_init(struct tegra_dfll *td)
 	td->last_unrounded_rate = 0;
 
 	pm_runtime_enable(td->dev);
+	pm_runtime_irq_safe(td->dev);
 	pm_runtime_get_sync(td->dev);
 
 	dfll_set_mode(td, DFLL_DISABLED);
@@ -1513,6 +1514,61 @@ static int dfll_init(struct tegra_dfll *td)
 	return ret;
 }
 
+/**
+ * tegra_dfll_suspend - check DFLL is disabled
+ * @dev: DFLL device *
+ *
+ * DFLL clock should be disabled by the CPUFreq driver. So, make
+ * sure it is disabled and disable all clocks needed by the DFLL.
+ */
+int tegra_dfll_suspend(struct device *dev)
+{
+	struct tegra_dfll *td = dev_get_drvdata(dev);
+
+	if (dfll_is_running(td)) {
+		dev_err(td->dev, "dfll is enabled while shouldn't be\n");
+		return -EBUSY;
+	}
+
+	reset_control_assert(td->dvco_rst);
+
+	return 0;
+}
+EXPORT_SYMBOL(tegra_dfll_suspend);
+
+/**
+ * tegra_dfll_resume - reinitialize DFLL on resume
+ * @dev: DFLL instance
+ *
+ * DFLL is disabled and reset during suspend and resume.
+ * So, reinitialize the DFLL IP block back for use.
+ * DFLL clock is enabled later in closed loop mode by CPUFreq
+ * driver before switching its clock source to DFLL output.
+ */
+int tegra_dfll_resume(struct device *dev)
+{
+	struct tegra_dfll *td = dev_get_drvdata(dev);
+
+	reset_control_deassert(td->dvco_rst);
+
+	pm_runtime_get_sync(td->dev);
+
+	dfll_set_mode(td, DFLL_DISABLED);
+	dfll_set_default_params(td);
+
+	if (td->soc->init_clock_trimmers)
+		td->soc->init_clock_trimmers();
+
+	dfll_set_open_loop_config(td);
+
+	dfll_init_out_if(td);
+
+	pm_runtime_put_sync(td->dev);
+
+	return 0;
+}
+EXPORT_SYMBOL(tegra_dfll_resume);
+
 /*
  * DT data fetch
  */
diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
index 1b14ebe7268b..fb209eb5f365 100644
--- a/drivers/clk/tegra/clk-dfll.h
+++ b/drivers/clk/tegra/clk-dfll.h
@@ -42,5 +42,7 @@ int tegra_dfll_register(struct platform_device *pdev,
 struct tegra_dfll_soc_data *tegra_dfll_unregister(struct platform_device *pdev);
 int tegra_dfll_runtime_suspend(struct device *dev);
 int tegra_dfll_runtime_resume(struct device *dev);
+int tegra_dfll_suspend(struct device *dev);
+int tegra_dfll_resume(struct device *dev);
 
 #endif /* __DRIVERS_CLK_TEGRA_CLK_DFLL_H */
diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index e84b6d52cbbd..2ac2679d696d 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -631,6 +631,7 @@ static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
 static const struct dev_pm_ops tegra124_dfll_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_dfll_runtime_suspend,
 			   tegra_dfll_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_dfll_suspend, tegra_dfll_resume)
 };
 
 static struct platform_driver tegra124_dfll_fcpu_driver = {
-- 
2.7.4
