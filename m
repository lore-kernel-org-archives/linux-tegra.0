From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH] clk: tegra: Add sata seq input control
Date: Wed, 15 Mar 2017 17:42:05 +0200
Message-ID: <1489592525-6231-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This will be used by the powergating driver to ensure proper sequencer
state when the SATA domain is powergated.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 25 +++++++++++++++++++++++++
 include/linux/clk/tegra.h        |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index a41733d..34b5520 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -181,6 +181,11 @@
 #define SATA_PLL_CFG0				0x490
 #define SATA_PLL_CFG0_PADPLL_RESET_SWCTL	BIT(0)
 #define SATA_PLL_CFG0_PADPLL_USE_LOCKDET	BIT(2)
+#define SATA_PLL_CFG0_SATA_SEQ_IN_SWCTL		BIT(4)
+#define SATA_PLL_CFG0_SATA_SEQ_RESET_INPUT_VALUE	BIT(5)
+#define SATA_PLL_CFG0_SATA_SEQ_LANE_PD_INPUT_VALUE	BIT(6)
+#define SATA_PLL_CFG0_SATA_SEQ_PADPLL_PD_INPUT_VALUE	BIT(7)
+
 #define SATA_PLL_CFG0_PADPLL_SLEEP_IDDQ		BIT(13)
 #define SATA_PLL_CFG0_SEQ_ENABLE		BIT(24)
 
@@ -483,6 +488,26 @@ void tegra210_sata_pll_hw_sequence_start(void)
 }
 EXPORT_SYMBOL_GPL(tegra210_sata_pll_hw_sequence_start);
 
+void tegra210_set_sata_pll_seq_sw(bool state)
+{
+	u32 val;
+
+	val = readl_relaxed(clk_base + SATA_PLL_CFG0);
+	if (state) {
+		val |= SATA_PLL_CFG0_SATA_SEQ_IN_SWCTL;
+		val |= SATA_PLL_CFG0_SATA_SEQ_RESET_INPUT_VALUE;
+		val |= SATA_PLL_CFG0_SATA_SEQ_LANE_PD_INPUT_VALUE;
+		val |= SATA_PLL_CFG0_SATA_SEQ_PADPLL_PD_INPUT_VALUE;
+	} else {
+		val &= ~SATA_PLL_CFG0_SATA_SEQ_IN_SWCTL;
+		val &= ~SATA_PLL_CFG0_SATA_SEQ_RESET_INPUT_VALUE;
+		val &= ~SATA_PLL_CFG0_SATA_SEQ_LANE_PD_INPUT_VALUE;
+		val &= ~SATA_PLL_CFG0_SATA_SEQ_PADPLL_PD_INPUT_VALUE;
+	}
+	writel_relaxed(val, clk_base + SATA_PLL_CFG0);
+}
+EXPORT_SYMBOL_GPL(tegra210_set_sata_pll_seq_sw);
+
 static inline void _pll_misc_chk_default(void __iomem *base,
 					struct tegra_clk_pll_params *params,
 					u8 misc_num, u32 default_val, u32 mask)
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index e17d328..d23c9cf 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -125,6 +125,7 @@ static inline void tegra_cpu_clock_resume(void)
 extern void tegra210_xusb_pll_hw_sequence_start(void);
 extern void tegra210_sata_pll_hw_control_enable(void);
 extern void tegra210_sata_pll_hw_sequence_start(void);
+extern void tegra210_set_sata_pll_seq_sw(bool state);
 extern void tegra210_put_utmipll_in_iddq(void);
 extern void tegra210_put_utmipll_out_iddq(void);
 
-- 
1.9.1
