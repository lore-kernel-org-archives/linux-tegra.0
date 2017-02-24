From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/5] clk: tegra: define Tegra210 DMIC clocks
Date: Fri, 24 Feb 2017 15:19:28 +0200
Message-ID: <1487942376-19631-4-git-send-email-pdeschrijver@nvidia.com>
References: <1487942376-19631-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487942376-19631-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 has 3 inputs for Digital Microphones (DMICs). Provide the required
clocks for them.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-id.h           |  5 ++++-
 drivers/clk/tegra/clk-tegra-periph.c | 21 +++++++++++++++++++++
 drivers/clk/tegra/clk-tegra210.c     |  3 +++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index b40293c..d3a79a8 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -307,8 +307,11 @@ enum clk_id {
 	tegra_clk_xusb_ssp_src,
 	tegra_clk_sclk_mux,
 	tegra_clk_sor_safe,
-	tegra_clk_ispa,
 	tegra_clk_cec,
+	tegra_clk_ispa,
+	tegra_clk_dmic1,
+	tegra_clk_dmic2,
+	tegra_clk_dmic3,
 	tegra_clk_dmic1_sync_clk,
 	tegra_clk_dmic2_sync_clk,
 	tegra_clk_dmic3_sync_clk,
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index a2aed27..9e6ac11 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -138,6 +138,9 @@
 #define CLK_SOURCE_TSECB 0x6d8
 #define CLK_SOURCE_MAUD 0x6d4
 #define CLK_SOURCE_USB2_HSIC_TRK 0x6cc
+#define CLK_SOURCE_DMIC1 0x64c
+#define CLK_SOURCE_DMIC2 0x650
+#define CLK_SOURCE_DMIC3 0x6bc
 
 #define MASK(x) (BIT(x) - 1)
 
@@ -625,6 +628,21 @@
 };
 #define mux_clkm_plldp_sor0lvds_idx NULL
 
+static const char * const mux_dmic1[] = {
+	"pll_a_out0", "dmic1_sync_clk", "pll_p", "clk_m"
+};
+#define mux_dmic1_idx NULL
+
+static const char * const mux_dmic2[] = {
+	"pll_a_out0", "dmic2_sync_clk", "pll_p", "clk_m"
+};
+#define mux_dmic2_idx NULL
+
+static const char * const mux_dmic3[] = {
+	"pll_a_out0", "dmic3_sync_clk", "pll_p", "clk_m"
+};
+#define mux_dmic3_idx NULL
+
 static struct tegra_periph_init_data periph_clks[] = {
 	AUDIO("d_audio", CLK_SOURCE_D_AUDIO, 106, TEGRA_PERIPH_ON_APB, tegra_clk_d_audio),
 	AUDIO("dam0", CLK_SOURCE_DAM0, 108, TEGRA_PERIPH_ON_APB, tegra_clk_dam0),
@@ -794,6 +812,9 @@
 	MUX("uartape", mux_pllp_pllc_clkm, CLK_SOURCE_UARTAPE, 212, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_uartape),
 	MUX8("tsecb", mux_pllp_pllc2_c_c3_clkm, CLK_SOURCE_TSECB, 206, 0, tegra_clk_tsecb),
 	MUX8("maud", mux_pllp_pllp_out3_clkm_clk32k_plla, CLK_SOURCE_MAUD, 202, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_maud),
+	MUX8("dmic1", mux_dmic1, CLK_SOURCE_DMIC1, 161, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_dmic1),
+	MUX8("dmic2", mux_dmic2, CLK_SOURCE_DMIC2, 162, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_dmic2),
+	MUX8("dmic3", mux_dmic3, CLK_SOURCE_DMIC3, 197, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_dmic3),
 };
 
 static struct tegra_periph_init_data gate_clks[] = {
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index ca63901..cfe7078 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2223,6 +2223,9 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 	[tegra_clk_pll_a1] = { .dt_id = TEGRA210_CLK_PLL_A1, .present = true },
 	[tegra_clk_ispa] = { .dt_id = TEGRA210_CLK_ISPA, .present = true },
 	[tegra_clk_cec] = { .dt_id = TEGRA210_CLK_CEC, .present = true },
+	[tegra_clk_dmic1] = { .dt_id = TEGRA210_CLK_DMIC1, .present = true },
+	[tegra_clk_dmic2] = { .dt_id = TEGRA210_CLK_DMIC2, .present = true },
+	[tegra_clk_dmic3] = { .dt_id = TEGRA210_CLK_DMIC3, .present = true },
 	[tegra_clk_dmic1_sync_clk] = { .dt_id = TEGRA210_CLK_DMIC1_SYNC_CLK, .present = true },
 	[tegra_clk_dmic2_sync_clk] = { .dt_id = TEGRA210_CLK_DMIC2_SYNC_CLK, .present = true },
 	[tegra_clk_dmic3_sync_clk] = { .dt_id = TEGRA210_CLK_DMIC3_SYNC_CLK, .present = true },
-- 
1.9.1
