From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/5] clk: tegra: dfll: Update kerneldoc
Date: Fri,  8 Apr 2016 15:31:33 +0200
Message-ID: <1460122297-14420-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The kerneldoc for struct tegra_dfll_soc_data is stale. Update it to
match the current structure definition.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-dfll.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
index 2e4c0772a5dc..7e66c07c4d2b 100644
--- a/drivers/clk/tegra/clk-dfll.h
+++ b/drivers/clk/tegra/clk-dfll.h
@@ -24,15 +24,14 @@
 
 /**
  * struct tegra_dfll_soc_data - SoC-specific hooks/integration for the DFLL driver
- * @opp_dev: struct device * that holds the OPP table for the DFLL
+ * @dev: struct device * that holds the OPP table for the DFLL
  * @min_millivolts: minimum voltage (in mV) that the DFLL can operate
  * @tune0_low: DFLL tuning register 0 (low voltage range)
  * @tune0_high: DFLL tuning register 0 (high voltage range)
  * @tune1: DFLL tuning register 1
- * @assert_dvco_reset: fn ptr to place the DVCO in reset
- * @deassert_dvco_reset: fn ptr to release the DVCO reset
- * @set_clock_trimmers_high: fn ptr to tune clock trimmers for high voltage
- * @set_clock_trimmers_low: fn ptr to tune clock trimmers for low voltage
+ * @init_clock_trimmers: callback to initialize clock trimmers
+ * @set_clock_trimmers_high: callback to tune clock trimmers for high voltage
+ * @set_clock_trimmers_low: callback to tune clock trimmers for low voltage
  */
 struct tegra_dfll_soc_data {
 	struct device *dev;
@@ -40,6 +39,7 @@ struct tegra_dfll_soc_data {
 	u32 tune0_low;
 	u32 tune0_high;
 	u32 tune1;
+
 	void (*init_clock_trimmers)(void);
 	void (*set_clock_trimmers_high)(void);
 	void (*set_clock_trimmers_low)(void);
-- 
2.8.0

