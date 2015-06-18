From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v6 11/25] clk: tegra: pll: Add code to handle if resets are supported by PLL
Date: Thu, 18 Jun 2015 17:28:26 -0400
Message-ID: <1434662920-21469-12-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang@nvidia.com>

If a PLL has a reset_reg specified, properly handle that in the
enable/disable logic paths.

Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Bill Huang <bilhuang@nvidia.com>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v5:
  - Added kerneldoc for new members

v2:
  - Moved reset logic to _clk_pll_enable/disable as well

 drivers/clk/tegra/clk-pll.c |   12 ++++++++++++
 drivers/clk/tegra/clk.h     |    4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 95ad0669291f..54ebab2b85e5 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -311,6 +311,12 @@ static void _clk_pll_enable(struct clk_hw *hw)
 		udelay(2);
 	}
 
+	if (pll->params->reset_reg) {
+		val = pll_readl(pll->params->reset_reg, pll);
+		val &= ~BIT(pll->params->reset_bit_idx);
+		pll_writel(val, pll->params->reset_reg, pll);
+	}
+
 	clk_pll_enable_lock(pll);
 
 	val = pll_readl_base(pll);
@@ -343,6 +349,12 @@ static void _clk_pll_disable(struct clk_hw *hw)
 		writel_relaxed(val, pll->pmc + PMC_PLLP_WB0_OVERRIDE);
 	}
 
+	if (pll->params->reset_reg) {
+		val = pll_readl(pll->params->reset_reg, pll);
+		val |= BIT(pll->params->reset_bit_idx);
+		pll_writel(val, pll->params->reset_reg, pll);
+	}
+
 	if (pll->params->iddq_reg) {
 		val = pll_readl(pll->params->iddq_reg, pll);
 		val |= BIT(pll->params->iddq_bit_idx);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index dfbce9300547..b5131e4e4c75 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -176,6 +176,8 @@ struct div_nmp {
  * @lock_enable_bit_idx:	Bit index to enable PLL lock
  * @iddq_reg:			PLL IDDQ register offset
  * @iddq_bit_idx:		Bit index to enable PLL IDDQ
+ * @reset_reg:			Register offset of where RESET bit is
+ * @reset_bit_idx:		Shift of reset bit in reset_reg
  * @sdm_din_reg:		Register offset where SDM settings are
  * @sdm_din_mask:		Mask of SDM divider bits
  * @sdm_ctrl_reg:		Register offset where SDM enable is
@@ -239,6 +241,8 @@ struct tegra_clk_pll_params {
 	u32		lock_enable_bit_idx;
 	u32		iddq_reg;
 	u32		iddq_bit_idx;
+	u32		reset_reg;
+	u32		reset_bit_idx;
 	u32		sdm_din_reg;
 	u32		sdm_din_mask;
 	u32		sdm_ctrl_reg;
-- 
1.7.9.5
