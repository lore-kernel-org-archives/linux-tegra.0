From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: add missing Tegra210 clocks
Date: Wed, 22 Mar 2017 16:23:16 +0200
Message-ID: <1490192598-26862-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

iqc1, iqc2, tegra_clk_pll_a_out_adsp, tegra_clk_pll_a_out0_out_adsp, adsp
and adsp neon were not modelled. dp2 wasn't modelled for Tegra210.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-id.h               |  6 ++++++
 drivers/clk/tegra/clk-tegra-periph.c     |  6 ++++++
 drivers/clk/tegra/clk-tegra210.c         |  7 +++++++
 include/dt-bindings/clock/tegra210-car.h | 16 ++++++++--------
 4 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index d3a79a8..689f344 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -318,6 +318,12 @@ enum clk_id {
 	tegra_clk_dmic1_sync_clk_mux,
 	tegra_clk_dmic2_sync_clk_mux,
 	tegra_clk_dmic3_sync_clk_mux,
+	tegra_clk_iqc1,
+	tegra_clk_iqc2,
+	tegra_clk_pll_a_out_adsp,
+	tegra_clk_pll_a_out0_out_adsp,
+	tegra_clk_adsp,
+	tegra_clk_adsp_neon,
 	tegra_clk_max,
 };
 
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 9e6ac11..294bfe4 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -859,6 +859,12 @@
 	GATE("pll_p_out_adsp", "pll_p", 187, 0, tegra_clk_pll_p_out_adsp, 0),
 	GATE("apb2ape", "clk_m", 107, 0, tegra_clk_apb2ape, 0),
 	GATE("cec", "pclk", 136, 0, tegra_clk_cec, 0),
+	GATE("iqc1", "clk_m", 221, 0, tegra_clk_iqc1, 0),
+	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc1, 0),
+	GATE("pll_a_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out_adsp, 0),
+	GATE("pll_a_out0_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out0_out_adsp, 0),
+	GATE("adsp", "aclk", 199, 0, tegra_clk_adsp, 0),
+	GATE("adsp_neon", "aclk", 218, 0, tegra_clk_adsp_neon, 0),
 };
 
 static struct tegra_periph_init_data div_clks[] = {
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 9897dc5..cdf1101 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2326,6 +2326,13 @@ struct utmi_clk_param {
 	[tegra_clk_dmic1_sync_clk_mux] = { .dt_id = TEGRA210_CLK_DMIC1_SYNC_CLK_MUX, .present = true },
 	[tegra_clk_dmic2_sync_clk_mux] = { .dt_id = TEGRA210_CLK_DMIC2_SYNC_CLK_MUX, .present = true },
 	[tegra_clk_dmic3_sync_clk_mux] = { .dt_id = TEGRA210_CLK_DMIC3_SYNC_CLK_MUX, .present = true },
+	[tegra_clk_dp2] = { .dt_id = TEGRA210_CLK_DP2, .present = true },
+	[tegra_clk_iqc1] = { .dt_id = TEGRA210_CLK_IQC1, .present = true },
+	[tegra_clk_iqc2] = { .dt_id = TEGRA210_CLK_IQC2, .present = true },
+	[tegra_clk_pll_a_out_adsp] = { .dt_id = TEGRA210_CLK_PLL_A_OUT_ADSP, .present = true },
+	[tegra_clk_pll_a_out0_out_adsp] = { .dt_id = TEGRA210_CLK_PLL_A_OUT0_OUT_ADSP, .present = true },
+	[tegra_clk_adsp] = { .dt_id = TEGRA210_CLK_ADSP, .present = true },
+	[tegra_clk_adsp_neon] = { .dt_id = TEGRA210_CLK_ADSP_NEON, .present = true },
 };
 
 static struct tegra_devclk devclks[] __initdata = {
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 8744b19..46689cd 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -173,7 +173,7 @@
 #define TEGRA210_CLK_ENTROPY 149
 /* 150 */
 /* 151 */
-/* 152 */
+#define TEGRA210_CLK_DP2 152
 /* 153 */
 /* 154 */
 /* 155 (bit affects dfll_ref and dfll_soc) */
@@ -210,7 +210,7 @@
 #define TEGRA210_CLK_DBGAPB 185
 /* 186 */
 #define TEGRA210_CLK_PLL_P_OUT_ADSP 187
-/* 188 */
+/* 188 ((bit affects pll_a_out_adsp and pll_a_out0_out_adsp)*/
 #define TEGRA210_CLK_PLL_G_REF 189
 /* 190 */
 /* 191 */
@@ -222,7 +222,7 @@
 /* 196 */
 #define TEGRA210_CLK_DMIC3 197
 #define TEGRA210_CLK_APE 198
-/* 199 */
+#define TEGRA210_CLK_ADSP 199
 /* 200 */
 /* 201 */
 #define TEGRA210_CLK_MAUD 202
@@ -241,10 +241,10 @@
 /* 215 */
 /* 216 */
 /* 217 */
-/* 218 */
+#define TEGRA210_CLK_ADSP_NEON 218
 #define TEGRA210_CLK_NVENC 219
-/* 220 */
-/* 221 */
+#define TEGRA210_CLK_IQC2 220
+#define TEGRA210_CLK_IQC1 221
 #define TEGRA210_CLK_SOR_SAFE 222
 #define TEGRA210_CLK_PLL_P_OUT_CPU 223
 
@@ -350,8 +350,8 @@
 /* 320 */
 /* 321 */
 #define TEGRA210_CLK_ISP 322
-/* 323 */
-/* 324 */
+#define TEGRA210_CLK_PLL_A_OUT_ADSP 323
+#define TEGRA210_CLK_PLL_A_OUT0_OUT_ADSP 324
 /* 325 */
 /* 326 */
 /* 327 */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
