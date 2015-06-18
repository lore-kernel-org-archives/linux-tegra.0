From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v6 01/25] clk: tegra: Update struct tegra_clk_pll_params kerneldoc
Date: Thu, 18 Jun 2015 17:28:16 -0400
Message-ID: <1434662920-21469-2-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Benson Leung pointed out that the kerneldoc for this structure has
become stale. Update the field descriptions to match the structure
content.

Reported-by: Benson Leung <bleung@chromium.org>
Acked-by: Rhyland Klein <rklein@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk.h |   18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 29799e7f567a..bdc661cb81f0 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -157,7 +157,7 @@ struct div_nmp {
 };
 
 /**
- * struct clk_pll_params - PLL parameters
+ * struct tegra_clk_pll_params - PLL parameters
  *
  * @input_min:			Minimum input frequency
  * @input_max:			Maximum input frequency
@@ -168,12 +168,24 @@ struct div_nmp {
  * @base_reg:			PLL base reg offset
  * @misc_reg:			PLL misc reg offset
  * @lock_reg:			PLL lock reg offset
- * @lock_bit_idx:		Bit index for PLL lock status
+ * @lock_mask:			Bitmask for PLL lock status
  * @lock_enable_bit_idx:	Bit index to enable PLL lock
+ * @iddq_reg:			PLL IDDQ register offset
+ * @iddq_bit_idx:		Bit index to enable PLL IDDQ
+ * @aux_reg:			AUX register offset
+ * @dyn_ramp_reg:		Dynamic ramp control register offset
+ * @ext_misc_reg:		Miscellaneous control register offsets
+ * @pmc_divnm_reg:		n, m divider PMC override register offset (PLLM)
+ * @pmc_divp_reg:		p divider PMC override register offset (PLLM)
+ * @flags:			PLL flags
+ * @stepa_shift:		Dynamic ramp step A field shift
+ * @stepb_shift:		Dynamic ramp step B field shift
  * @lock_delay:			Delay in us if PLL lock is not used
+ * @max_p:			maximum value for the p divider
+ * @pdiv_tohw:			mapping of p divider to register values
+ * @div_nmp:			offsets and widths on n, m and p fields
  * @freq_table:			array of frequencies supported by PLL
  * @fixed_rate:			PLL rate if it is fixed
- * @flags:			PLL flags
  *
  * Flags:
  * TEGRA_PLL_USE_LOCK - This flag indicated to use lock bits for
-- 
1.7.9.5
