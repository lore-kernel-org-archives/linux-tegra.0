From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/5] clk: tegra: add cec clock
Date: Thu, 23 Feb 2017 14:39:35 +0200
Message-ID: <1487853585-17934-2-git-send-email-pdeschrijver@nvidia.com>
References: <1487853585-17934-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487853585-17934-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This clock is used to clock the HDMI CEC interface.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-id.h                      | 1 +
 drivers/clk/tegra/clk-tegra-periph.c            | 1 +
 drivers/clk/tegra/clk-tegra114.c                | 1 +
 drivers/clk/tegra/clk-tegra124.c                | 1 +
 drivers/clk/tegra/clk-tegra210.c                | 1 +
 drivers/clk/tegra/clk-tegra30.c                 | 1 +
 include/dt-bindings/clock/tegra114-car.h        | 2 +-
 include/dt-bindings/clock/tegra124-car-common.h | 2 +-
 include/dt-bindings/clock/tegra210-car.h        | 2 +-
 include/dt-bindings/clock/tegra30-car.h         | 2 +-
 10 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index 1019eb8..fc978b2 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -308,6 +308,7 @@ enum clk_id {
 	tegra_clk_sclk_mux,
 	tegra_clk_sor_safe,
 	tegra_clk_ispa,
+	tegra_clk_cec,
 	tegra_clk_max,
 };
 
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index c9e795b..a2aed27 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -837,6 +837,7 @@
 	GATE("pll_p_out_cpu", "pll_p", 223, 0, tegra_clk_pll_p_out_cpu, 0),
 	GATE("pll_p_out_adsp", "pll_p", 187, 0, tegra_clk_pll_p_out_adsp, 0),
 	GATE("apb2ape", "clk_m", 107, 0, tegra_clk_apb2ape, 0),
+	GATE("cec", "pclk", 136, 0, tegra_clk_cec, 0),
 };
 
 static struct tegra_periph_init_data div_clks[] = {
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 933b5dd..fd1a99c 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -819,6 +819,7 @@
 	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA114_CLK_CLK_OUT_3_MUX, .present = true },
 	[tegra_clk_dsia_mux] = { .dt_id = TEGRA114_CLK_DSIA_MUX, .present = true },
 	[tegra_clk_dsib_mux] = { .dt_id = TEGRA114_CLK_DSIB_MUX, .present = true },
+	[tegra_clk_cec] = { .dt_id = TEGRA114_CLK_CEC, .present = true },
 };
 
 static struct tegra_devclk devclks[] __initdata = {
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index a112d3d..e81ea5b 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -928,6 +928,7 @@
 	[tegra_clk_clk_out_1_mux] = { .dt_id = TEGRA124_CLK_CLK_OUT_1_MUX, .present = true },
 	[tegra_clk_clk_out_2_mux] = { .dt_id = TEGRA124_CLK_CLK_OUT_2_MUX, .present = true },
 	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA124_CLK_CLK_OUT_3_MUX, .present = true },
+	[tegra_clk_cec] = { .dt_id = TEGRA124_CLK_CEC, .present = true },
 };
 
 static struct tegra_devclk devclks[] __initdata = {
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 58d7f9c..bdb296a 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2222,6 +2222,7 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 	[tegra_clk_apb2ape] = { .dt_id = TEGRA210_CLK_APB2APE, .present = true },
 	[tegra_clk_pll_a1] = { .dt_id = TEGRA210_CLK_PLL_A1, .present = true },
 	[tegra_clk_ispa] = { .dt_id = TEGRA210_CLK_ISPA, .present = true },
+	[tegra_clk_cec] = { .dt_id = TEGRA210_CLK_CEC, .present = true },
 };
 
 static struct tegra_devclk devclks[] __initdata = {
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 8e2db5e..a2d163f 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -817,6 +817,7 @@
 	[tegra_clk_pll_p_out4] = { .dt_id = TEGRA30_CLK_PLL_P_OUT4, .present = true },
 	[tegra_clk_pll_a] = { .dt_id = TEGRA30_CLK_PLL_A, .present = true },
 	[tegra_clk_pll_a_out0] = { .dt_id = TEGRA30_CLK_PLL_A_OUT0, .present = true },
+	[tegra_clk_cec] = { .dt_id = TEGRA30_CLK_CEC, .present = true },
 };
 
 static const char *pll_e_parents[] = { "pll_ref", "pll_p" };
diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index 534c03f..ed5ca21 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -156,7 +156,7 @@
 /* 133 */
 /* 134 */
 /* 135 */
-/* 136 */
+#define TEGRA114_CLK_CEC 136
 /* 137 */
 /* 138 */
 /* 139 */
diff --git a/include/dt-bindings/clock/tegra124-car-common.h b/include/dt-bindings/clock/tegra124-car-common.h
index a215609..9352c7e 100644
--- a/include/dt-bindings/clock/tegra124-car-common.h
+++ b/include/dt-bindings/clock/tegra124-car-common.h
@@ -156,7 +156,7 @@
 /* 133 */
 /* 134 */
 /* 135 */
-/* 136 */
+#define TEGRA124_CLK_CEC 136
 /* 137 */
 /* 138 */
 /* 139 */
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index f5c6563..e7a2578 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -156,7 +156,7 @@
 /* 133 */
 /* 134 */
 /* 135 */
-/* 136 */
+#define TEGRA210_CLK_CEC 136
 /* 137 */
 /* 138 */
 /* 139 */
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index 889e49b..7213354b 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -156,7 +156,7 @@
 /* 133 */
 /* 134 */
 /* 135 */
-/* 136 */
+#define TEGRA30_CLK_CEC 136
 /* 137 */
 /* 138 */
 /* 139 */
-- 
1.9.1
