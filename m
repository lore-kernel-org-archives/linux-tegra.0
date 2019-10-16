From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/5] clk: tegra: Rename sor0_lvds to sor0_out
Date: Wed, 16 Oct 2019 14:59:17 +0200
Message-ID: <20191016125919.1773898-4-thierry.reding@gmail.com>
References: <20191016125919.1773898-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191016125919.1773898-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This makes Tegra124 and Tegra210 consistent with subsequent Tegra
generations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-id.h                      |  2 +-
 drivers/clk/tegra/clk-tegra124.c                | 12 ++++++------
 drivers/clk/tegra/clk-tegra210.c                |  2 +-
 include/dt-bindings/clock/tegra124-car-common.h |  2 +-
 include/dt-bindings/clock/tegra210-car.h        |  2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index ae02885c9475..c4faebd32760 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -236,7 +236,7 @@ enum clk_id {
 	tegra_clk_soc_therm,
 	tegra_clk_soc_therm_8,
 	tegra_clk_sor0,
-	tegra_clk_sor0_lvds,
+	tegra_clk_sor0_out,
 	tegra_clk_sor1,
 	tegra_clk_sor1_out,
 	tegra_clk_spdif,
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 2e41141af7b5..7d231529c3a5 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -847,7 +847,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_adx1] = { .dt_id = TEGRA124_CLK_ADX1, .present = true },
 	[tegra_clk_dpaux] = { .dt_id = TEGRA124_CLK_DPAUX, .present = true },
 	[tegra_clk_sor0] = { .dt_id = TEGRA124_CLK_SOR0, .present = true },
-	[tegra_clk_sor0_lvds] = { .dt_id = TEGRA124_CLK_SOR0_LVDS, .present = true },
+	[tegra_clk_sor0_out] = { .dt_id = TEGRA124_CLK_SOR0_OUT, .present = true },
 	[tegra_clk_gpu] = { .dt_id = TEGRA124_CLK_GPU, .present = true },
 	[tegra_clk_amx1] = { .dt_id = TEGRA124_CLK_AMX1, .present = true },
 	[tegra_clk_uartb] = { .dt_id = TEGRA124_CLK_UARTB, .present = true },
@@ -1011,14 +1011,14 @@ static const char *mux_pllp_pllm_plld_plla_pllc_plld2_clkm[] = {
 };
 #define mux_pllp_pllm_plld_plla_pllc_plld2_clkm_idx NULL
 
-static const char *mux_clkm_plldp_sor0lvds[] = {
-	"clk_m", "pll_dp", "sor0_lvds",
+static const char *mux_clkm_plldp_sor0out[] = {
+	"clk_m", "pll_dp", "sor0_out",
 };
-#define mux_clkm_plldp_sor0lvds_idx NULL
+#define mux_clkm_plldp_sor0out_idx NULL
 
 static struct tegra_periph_init_data tegra124_periph[] = {
-	MUX8_NOGATE_LOCK("sor0_lvds", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_SOR0, tegra_clk_sor0_lvds, &sor0_lock),
-	NODIV("sor0", mux_clkm_plldp_sor0lvds, CLK_SOURCE_SOR0, 14, 3, 182, 0, tegra_clk_sor0, &sor0_lock),
+	MUX8_NOGATE_LOCK("sor0_out", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_SOR0, tegra_clk_sor0_out, &sor0_lock),
+	NODIV("sor0", mux_clkm_plldp_sor0out, CLK_SOURCE_SOR0, 14, 3, 182, 0, tegra_clk_sor0, &sor0_lock),
 };
 
 static struct clk **clks;
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 019287df6c12..0f0f14781b43 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2351,7 +2351,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_dpaux] = { .dt_id = TEGRA210_CLK_DPAUX, .present = true },
 	[tegra_clk_dpaux1] = { .dt_id = TEGRA210_CLK_DPAUX1, .present = true },
 	[tegra_clk_sor0] = { .dt_id = TEGRA210_CLK_SOR0, .present = true },
-	[tegra_clk_sor0_lvds] = { .dt_id = TEGRA210_CLK_SOR0_LVDS, .present = true },
+	[tegra_clk_sor0_out] = { .dt_id = TEGRA210_CLK_SOR0_OUT, .present = true },
 	[tegra_clk_sor1] = { .dt_id = TEGRA210_CLK_SOR1, .present = true },
 	[tegra_clk_sor1_out] = { .dt_id = TEGRA210_CLK_SOR1_OUT, .present = true },
 	[tegra_clk_gpu] = { .dt_id = TEGRA210_CLK_GPU, .present = true },
diff --git a/include/dt-bindings/clock/tegra124-car-common.h b/include/dt-bindings/clock/tegra124-car-common.h
index 4331f1df6ebe..210ef790d0ae 100644
--- a/include/dt-bindings/clock/tegra124-car-common.h
+++ b/include/dt-bindings/clock/tegra124-car-common.h
@@ -337,7 +337,7 @@
 #define TEGRA124_CLK_CLK_OUT_3_MUX 308
 /* 309 */
 /* 310 */
-#define TEGRA124_CLK_SOR0_LVDS 311
+#define TEGRA124_CLK_SOR0_OUT 311
 #define TEGRA124_CLK_XUSB_SS_DIV2 312
 
 #define TEGRA124_CLK_PLL_M_UD 313
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index b43b9e84e62e..70308a568c6c 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -390,7 +390,7 @@
 #define TEGRA210_CLK_CLK_OUT_3_MUX 358
 #define TEGRA210_CLK_DSIA_MUX 359
 #define TEGRA210_CLK_DSIB_MUX 360
-#define TEGRA210_CLK_SOR0_LVDS 361
+#define TEGRA210_CLK_SOR0_OUT 361
 #define TEGRA210_CLK_XUSB_SS_DIV2 362
 
 #define TEGRA210_CLK_PLL_M_UD 363
-- 
2.23.0
