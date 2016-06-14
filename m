From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/3] clk: tegra: Squash sor1 safe/brick/src into a single mux
Date: Tue, 14 Jun 2016 14:00:43 +0200
Message-ID: <20160614120044.30734-2-thierry.reding@gmail.com>
References: <20160614120044.30734-1-thierry.reding@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160614120044.30734-1-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, Rhyland Klein <rklein@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The sor1 clock on Tegra210 is structured in the following way:

    +-------+
    | pllp  |---+
    +-------+   |    +--------------+       +-----------+
                +----|              |       | sor_safe  |
    +-------+        |              |       +-----------+
    | plld  |--------|              |             |
    +-------+        |              |       +-----------+
                     |   sor1_src   |-------|           |
    +-------+        |              |       +-----------+
    | plld2 |--------|              |             |
    +-------+        |              |             |
                +----|              |             |
    +-------+   |    +--------------+             |
    | clkm  |---+                           +-----------+
    +-------+        +--------------+       |           |
                     |  sor1_brick  |-------|   sor1    |
                     +--------------+       |           |
                                            +-----------+

This is impractical to represent in a clock tree, though, because there
is no name for the mux that has sor_safe and sor1_src as parents. It is
also much more cumbersome to deal with the additional mux because users
of these clocks (the display driver) would have to juggle with an extra
mux for no real reason.

To simply things, the above is squashed into two muxes instead, so that
it looks like this:

    +-------+
    | pllp  |---+
    +-------+   |    +--------------+       +-----------+
                +----|              |       | sor_safe  |
    +-------+        |              |       +-----------+
    | plld  |--------|              |             |
    +-------+        |              |       +-----------+
                     |   sor1_src   |-------|   sor1    |
    +-------+        |              |       +-----------+
    | plld2 |--------|              |           |   |
    +-------+        |              |           |   |
                +----|              |           |   |
    +-------+   |    +--------------+           |   |
    | clkm  |---+                               |   |
    +-------+        +--------------+           |   |
                     |  sor1_brick  |-----------+---+
                     +--------------+

This still very accurately represents the hardware. Note that sor1 has
sor1_brick as input twice, that's because bit 1 in the mux selects the
sor1_brick irrespective of bit 0.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-id.h           |  1 -
 drivers/clk/tegra/clk-tegra-periph.c | 23 ++++++++++++-----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index 36c974916d4f..5738635c5274 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -238,7 +238,6 @@ enum clk_id {
 	tegra_clk_sor0,
 	tegra_clk_sor0_lvds,
 	tegra_clk_sor1,
-	tegra_clk_sor1_brick,
 	tegra_clk_sor1_src,
 	tegra_clk_spdif,
 	tegra_clk_spdif_2x,
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 29d04c663abf..af85c8aeaf5a 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -594,15 +594,17 @@ static u32 mux_pllp_plld_plld2_clkm_idx[] = {
 	[0] = 0, [1] = 2, [2] = 5, [3] = 6
 };
 
-static const char *mux_plldp_sor1_src[] = {
-	"pll_dp", "clk_sor1_src"
-};
-#define mux_plldp_sor1_src_idx NULL
-
-static const char *mux_clkm_sor1_brick_sor1_src[] = {
-	"clk_m", "sor1_brick", "sor1_src", "sor1_brick"
-};
-#define mux_clkm_sor1_brick_sor1_src_idx NULL
+static const char *mux_sor_safe_sor1_brick_sor1_src[] = {
+	/*
+	 * Bit 0 of the mux selects sor1_brick, irrespective of bit 1, so the
+	 * sor1_brick parent appears twice in the list below. This is merely
+	 * to support clk_get_parent() if firmware happened to set these bits
+	 * to 0b11. While not an invalid setting, code should always set the
+	 * bits to 0b01 to select sor1_brick.
+	 */
+	"sor_safe", "sor1_brick", "sor1_src", "sor1_brick"
+};
+#define mux_sor_safe_sor1_brick_sor1_src_idx NULL
 
 static const char *mux_pllp_pllre_clkm[] = {
 	"pll_p", "pll_re_out1", "clk_m"
@@ -778,8 +780,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX8("nvjpg", mux_pllc2_c_c3_pllp_plla1_clkm, CLK_SOURCE_NVJPG, 195, 0, tegra_clk_nvjpg),
 	MUX8("ape", mux_plla_pllc4_out0_pllc_pllc4_out1_pllp_pllc4_out2_clkm, CLK_SOURCE_APE, 198, TEGRA_PERIPH_ON_APB, tegra_clk_ape),
 	MUX8_NOGATE_LOCK("sor1_src", mux_pllp_plld_plld2_clkm, CLK_SOURCE_SOR1, tegra_clk_sor1_src, &sor1_lock),
-	NODIV("sor1_brick", mux_plldp_sor1_src, CLK_SOURCE_SOR1, 14, MASK(1), 183, 0, tegra_clk_sor1_brick, &sor1_lock),
-	NODIV("sor1", mux_clkm_sor1_brick_sor1_src, CLK_SOURCE_SOR1, 15, MASK(1), 183, 0, tegra_clk_sor1, &sor1_lock),
+	NODIV("sor1", mux_sor_safe_sor1_brick_sor1_src, CLK_SOURCE_SOR1, 14, MASK(2), 183, 0, tegra_clk_sor1, &sor1_lock),
 	MUX8("sdmmc_legacy", mux_pllp_out3_clkm_pllp_pllc4, CLK_SOURCE_SDMMC_LEGACY, 193, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_sdmmc_legacy),
 	MUX8("qspi", mux_pllp_pllc_pllc_out1_pllc4_out2_pllc4_out1_clkm_pllc4_out0, CLK_SOURCE_QSPI, 211, TEGRA_PERIPH_ON_APB, tegra_clk_qspi),
 	I2C("vii2c", mux_pllp_pllc_clkm, CLK_SOURCE_VI_I2C, 208, tegra_clk_vi_i2c),
-- 
2.8.3

