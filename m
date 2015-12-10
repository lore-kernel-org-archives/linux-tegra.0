From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 3/9] clk: tegra210: Fix naming of MISC registers
Date: Thu, 10 Dec 2015 17:08:22 -0500
Message-ID: <1449785308-19546-4-git-send-email-rklein@nvidia.com>
References: <1449785308-19546-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449785308-19546-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Some register for PLLM and PLLMB were named MISC0 but according to the
TRM, they have different names. Sync up the names to make it easier to
understand which register they are really referring to.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index f45c9adf7fb2..2a7faa357130 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -59,7 +59,7 @@
 #define PLLC3_MISC3 0x50c
 
 #define PLLM_BASE 0x90
-#define PLLM_MISC0 0x9c
+#define PLLM_MISC2 0x9c
 #define PLLM_MISC1 0x98
 #define PLLP_BASE 0xa0
 #define PLLP_MISC0 0xac
@@ -99,7 +99,7 @@
 #define PLLC4_MISC0 0x5a8
 #define PLLC4_OUT 0x5e4
 #define PLLMB_BASE 0x5e8
-#define PLLMB_MISC0 0x5ec
+#define PLLMB_MISC1 0x5ec
 #define PLLA1_BASE 0x6a4
 #define PLLA1_MISC0 0x6a8
 #define PLLA1_MISC1 0x6ac
@@ -367,12 +367,12 @@ static const char *mux_pllmcp_clkm[] = {
 /* PLLMB */
 #define PLLMB_BASE_LOCK			(1 << 27)
 
-#define PLLMB_MISC0_LOCK_OVERRIDE	(1 << 18)
-#define PLLMB_MISC0_IDDQ		(1 << 17)
-#define PLLMB_MISC0_LOCK_ENABLE		(1 << 16)
+#define PLLMB_MISC1_LOCK_OVERRIDE	(1 << 18)
+#define PLLMB_MISC1_IDDQ		(1 << 17)
+#define PLLMB_MISC1_LOCK_ENABLE		(1 << 16)
 
-#define PLLMB_MISC0_DEFAULT_VALUE	0x00030000
-#define PLLMB_MISC0_WRITE_MASK		0x0007ffff
+#define PLLMB_MISC1_DEFAULT_VALUE	0x00030000
+#define PLLMB_MISC1_WRITE_MASK		0x0007ffff
 
 /* PLLP */
 #define PLLP_BASE_OVERRIDE		(1 << 28)
@@ -914,15 +914,15 @@ void tegra210_pllmb_set_defaults(struct tegra_clk_pll *pllmb)
 		 * PLL is ON: check if defaults already set, then set those
 		 * that can be updated in flight.
 		 */
-		val = PLLMB_MISC0_DEFAULT_VALUE & (~PLLMB_MISC0_IDDQ);
-		mask = PLLMB_MISC0_LOCK_ENABLE | PLLMB_MISC0_LOCK_OVERRIDE;
+		val = PLLMB_MISC1_DEFAULT_VALUE & (~PLLMB_MISC1_IDDQ);
+		mask = PLLMB_MISC1_LOCK_ENABLE | PLLMB_MISC1_LOCK_OVERRIDE;
 		_pll_misc_chk_default(clk_base, pllmb->params, 0, val,
-				~mask & PLLMB_MISC0_WRITE_MASK);
+				~mask & PLLMB_MISC1_WRITE_MASK);
 
 		/* Enable lock detect */
 		val = readl_relaxed(clk_base + pllmb->params->ext_misc_reg[0]);
 		val &= ~mask;
-		val |= PLLMB_MISC0_DEFAULT_VALUE & mask;
+		val |= PLLMB_MISC1_DEFAULT_VALUE & mask;
 		writel_relaxed(val, clk_base + pllmb->params->ext_misc_reg[0]);
 		udelay(1);
 
@@ -930,7 +930,7 @@ void tegra210_pllmb_set_defaults(struct tegra_clk_pll *pllmb)
 	}
 
 	/* set IDDQ, enable lock detect */
-	writel_relaxed(PLLMB_MISC0_DEFAULT_VALUE,
+	writel_relaxed(PLLMB_MISC1_DEFAULT_VALUE,
 			clk_base + pllmb->params->ext_misc_reg[0]);
 	udelay(1);
 }
@@ -1557,14 +1557,14 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.vco_min = 800000000,
 	.vco_max = 1866000000,
 	.base_reg = PLLM_BASE,
-	.misc_reg = PLLM_MISC0,
+	.misc_reg = PLLM_MISC2,
 	.lock_mask = PLL_BASE_LOCK,
 	.lock_enable_bit_idx = PLLM_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
-	.iddq_reg = PLLM_MISC0,
+	.iddq_reg = PLLM_MISC2,
 	.iddq_bit_idx = PLLM_IDDQ_BIT,
 	.max_p = PLL_QLIN_PDIV_MAX,
-	.ext_misc_reg[0] = PLLM_MISC0,
+	.ext_misc_reg[0] = PLLM_MISC2,
 	.ext_misc_reg[0] = PLLM_MISC1,
 	.round_p_to_pdiv = pll_qlin_p_to_pdiv,
 	.pdiv_tohw = pll_qlin_pdiv_to_hw,
@@ -1584,13 +1584,13 @@ static struct tegra_clk_pll_params pll_mb_params = {
 	.vco_min = 800000000,
 	.vco_max = 1866000000,
 	.base_reg = PLLMB_BASE,
-	.misc_reg = PLLMB_MISC0,
+	.misc_reg = PLLMB_MISC1,
 	.lock_mask = PLL_BASE_LOCK,
 	.lock_delay = 300,
-	.iddq_reg = PLLMB_MISC0,
+	.iddq_reg = PLLMB_MISC1,
 	.iddq_bit_idx = PLLMB_IDDQ_BIT,
 	.max_p = PLL_QLIN_PDIV_MAX,
-	.ext_misc_reg[0] = PLLMB_MISC0,
+	.ext_misc_reg[0] = PLLMB_MISC1,
 	.round_p_to_pdiv = pll_qlin_p_to_pdiv,
 	.pdiv_tohw = pll_qlin_pdiv_to_hw,
 	.div_nmp = &pllm_nmp,
-- 
1.9.1
