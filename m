From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V6 09/21] clk: tegra: clk-super: Fix to enable PLLP branches to CPU
Date: Sun, 21 Jul 2019 12:40:48 -0700
Message-ID: <1563738060-30213-10-git-send-email-skomatineni@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch has a fix to enable PLLP branches to CPU before changing
the CPU clusters clock source to PLLP for Gen5 Super clock.

During system suspend entry and exit, CPU source will be switched
to PLLP and this needs PLLP branches to be enabled to CPU prior to
the switch.

On system resume, warmboot code enables PLLP branches to CPU and
powers up the CPU with PLLP clock source.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-super.c            | 11 +++++++++++
 drivers/clk/tegra/clk-tegra-super-gen4.c |  4 ++--
 drivers/clk/tegra/clk.h                  |  4 ++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 39ef31b46df5..d73c587e4853 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -28,6 +28,9 @@
 #define super_state_to_src_shift(m, s) ((m->width * s))
 #define super_state_to_src_mask(m) (((1 << m->width) - 1))
 
+#define CCLK_SRC_PLLP_OUT0 4
+#define CCLK_SRC_PLLP_OUT4 5
+
 static u8 clk_super_get_parent(struct clk_hw *hw)
 {
 	struct tegra_clk_super_mux *mux = to_clk_super_mux(hw);
@@ -97,6 +100,14 @@ static int clk_super_set_parent(struct clk_hw *hw, u8 index)
 		if (index == mux->div2_index)
 			index = mux->pllx_index;
 	}
+
+	/*
+	 * Enable PLLP branches to CPU before selecting PLLP source
+	 */
+	if ((mux->flags & TEGRA_CPU_CLK) &&
+	    ((index == CCLK_SRC_PLLP_OUT0) || (index == CCLK_SRC_PLLP_OUT4)))
+		tegra_clk_set_pllp_out_cpu(true);
+
 	val &= ~((super_state_to_src_mask(mux)) << shift);
 	val |= (index & (super_state_to_src_mask(mux))) << shift;
 
diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
index cdfe7c9697e1..cd208d0eca2a 100644
--- a/drivers/clk/tegra/clk-tegra-super-gen4.c
+++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
@@ -180,7 +180,7 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
 					gen_info->num_cclk_g_parents,
 					CLK_SET_RATE_PARENT,
 					clk_base + CCLKG_BURST_POLICY,
-					0, 4, 8, 0, NULL);
+					TEGRA_CPU_CLK, 4, 8, 0, NULL);
 		} else {
 			clk = tegra_clk_register_super_mux("cclk_g",
 					gen_info->cclk_g_parents,
@@ -201,7 +201,7 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
 					gen_info->num_cclk_lp_parents,
 					CLK_SET_RATE_PARENT,
 					clk_base + CCLKLP_BURST_POLICY,
-					0, 4, 8, 0, NULL);
+					TEGRA_CPU_CLK, 4, 8, 0, NULL);
 		} else {
 			clk = tegra_clk_register_super_mux("cclk_lp",
 					gen_info->cclk_lp_parents,
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index ac6de3a0b91f..c357b49e49b0 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -694,6 +694,9 @@ struct clk *tegra_clk_register_periph_data(void __iomem *clk_base,
  * Flags:
  * TEGRA_DIVIDER_2 - LP cluster has additional divider. This flag indicates
  *     that this is LP cluster clock.
+ * TEGRA_CPU_CLK - This flag indicates this is CPU cluster clock. To use PLLP
+ * for CPU clock source, need to enable PLLP branches to CPU by setting the
+ * additional bit PLLP_OUT_CPU for gen5 super clock.
  */
 struct tegra_clk_super_mux {
 	struct clk_hw	hw;
@@ -710,6 +713,7 @@ struct tegra_clk_super_mux {
 #define to_clk_super_mux(_hw) container_of(_hw, struct tegra_clk_super_mux, hw)
 
 #define TEGRA_DIVIDER_2 BIT(0)
+#define TEGRA_CPU_CLK	BIT(1)
 
 extern const struct clk_ops tegra_clk_super_ops;
 struct clk *tegra_clk_register_super_mux(const char *name,
-- 
2.7.4
