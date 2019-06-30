From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 13/15] clk: tegra20: emc: Add tegra20_clk_emc_on_pllp()
Date: Mon,  1 Jul 2019 00:00:17 +0300
Message-ID: <20190630210019.26914-14-digetx@gmail.com>
References: <20190630210019.26914-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190630210019.26914-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This function will be used by Tegra30 CPUIDLE driver to determine whether
CPU could be power-gated.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20-emc.c | 14 ++++++++++++++
 include/linux/clk/tegra.h           |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20-emc.c b/drivers/clk/tegra/clk-tegra20-emc.c
index 03bf0009a33c..ace7150d5cc1 100644
--- a/drivers/clk/tegra/clk-tegra20-emc.c
+++ b/drivers/clk/tegra/clk-tegra20-emc.c
@@ -291,3 +291,17 @@ int tegra20_clk_prepare_emc_mc_same_freq(struct clk *emc_clk, bool same)
 
 	return 0;
 }
+
+bool tegra20_clk_emc_on_pllp(void)
+{
+	struct clk *clk = __clk_lookup("emc");
+	struct clk_hw *hw;
+
+	if (clk) {
+		hw = __clk_get_hw(clk);
+
+		return emc_get_parent(hw) == EMC_SRC_PLL_P;
+	}
+
+	return true;
+}
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 6a7cbc3cfadc..c862447ffada 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -129,5 +129,6 @@ typedef long (tegra20_clk_emc_round_cb)(unsigned long rate,
 void tegra20_clk_set_emc_round_callback(tegra20_clk_emc_round_cb *round_cb,
 					void *cb_arg);
 int tegra20_clk_prepare_emc_mc_same_freq(struct clk *emc_clk, bool same);
+bool tegra20_clk_emc_on_pllp(void);
 
 #endif /* __LINUX_CLK_TEGRA_H_ */
-- 
2.22.0
