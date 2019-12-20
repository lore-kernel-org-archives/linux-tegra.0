From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/3] memory: tegra30-emc: Firm up suspend/resume sequence
Date: Fri, 20 Dec 2019 05:08:47 +0300
Message-ID: <20191220020849.11175-2-digetx@gmail.com>
References: <20191220020849.11175-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191220020849.11175-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The current code doesn't prevent race conditions of suspend/resume vs CCF.
Let's take exclusive control over the EMC clock during suspend in a way
that is free from race conditions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 38 ++++++++++++++++--------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 0b6a5e451ea3..770808da957d 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -345,7 +345,6 @@ struct tegra_emc {
 	bool vref_cal_toggle : 1;
 	bool zcal_long : 1;
 	bool dll_on : 1;
-	bool prepared : 1;
 	bool bad_state : 1;
 };
 
@@ -751,9 +750,6 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 	/* interrupt can be re-enabled now */
 	enable_irq(emc->irq);
 
-	emc->bad_state = false;
-	emc->prepared = true;
-
 	return 0;
 }
 
@@ -762,13 +758,12 @@ static int emc_complete_timing_change(struct tegra_emc *emc,
 {
 	struct emc_timing *timing = emc_find_timing(emc, rate);
 	unsigned long timeout;
-	int ret;
+	int err;
 
 	timeout = wait_for_completion_timeout(&emc->clk_handshake_complete,
 					      msecs_to_jiffies(100));
 	if (timeout == 0) {
 		dev_err(emc->dev, "emc-car handshake failed\n");
-		emc->bad_state = true;
 		return -EIO;
 	}
 
@@ -790,22 +785,23 @@ static int emc_complete_timing_change(struct tegra_emc *emc,
 
 	udelay(2);
 	/* update restored timing */
-	ret = emc_seq_update_timing(emc);
-	if (ret)
-		emc->bad_state = true;
+	err = emc_seq_update_timing(emc);
 
 	/* restore early ACK */
 	mc_writel(emc->mc, emc->mc_override, MC_EMEM_ARB_OVERRIDE);
 
-	emc->prepared = false;
+	if (err)
+		return err;
+
+	emc->bad_state = false;
 
-	return ret;
+	return 0;
 }
 
 static int emc_unprepare_timing_change(struct tegra_emc *emc,
 				       unsigned long rate)
 {
-	if (emc->prepared && !emc->bad_state) {
+	if (!emc->bad_state) {
 		/* shouldn't ever happen in practice */
 		dev_err(emc->dev, "timing configuration can't be reverted\n");
 		emc->bad_state = true;
@@ -1181,13 +1177,17 @@ static int tegra_emc_probe(struct platform_device *pdev)
 static int tegra_emc_suspend(struct device *dev)
 {
 	struct tegra_emc *emc = dev_get_drvdata(dev);
+	int err;
+
+	/* take exclusive control over the clock's rate */
+	err = clk_rate_exclusive_get(emc->clk);
+	if (err) {
+		dev_err(emc->dev, "failed to acquire clk: %d\n", err);
+		return err;
+	}
 
-	/*
-	 * Suspending in a bad state will hang machine. The "prepared" var
-	 * shall be always false here unless it's a kernel bug that caused
-	 * suspending in a wrong order.
-	 */
-	if (WARN_ON(emc->prepared) || emc->bad_state)
+	/* suspending in a bad state will hang machine */
+	if (WARN(emc->bad_state, "hardware in a bad state\n"))
 		return -EINVAL;
 
 	emc->bad_state = true;
@@ -1202,6 +1202,8 @@ static int tegra_emc_resume(struct device *dev)
 	emc_setup_hw(emc);
 	emc->bad_state = false;
 
+	clk_rate_exclusive_put(emc->clk);
+
 	return 0;
 }
 
-- 
2.24.0
