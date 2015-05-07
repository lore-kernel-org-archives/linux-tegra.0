From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] clk: tegra: Update struct tegra_clk_pll_params kerneldoc
Date: Thu,  7 May 2015 17:23:39 +0200
Message-ID: <1431012219-28469-1-git-send-email-thierry.reding@gmail.com>
References: <1430919815-22380-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430919815-22380-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Benson Leung pointed out that the kerneldoc for this structure has
become stale. Update the field descriptions to match the structure
content.

Reported-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- document max_p and pdiv_tohw fields

 drivers/clk/tegra/clk.h | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index f3782dedbdfb..b76b786e15f6 100644
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
2.3.5
