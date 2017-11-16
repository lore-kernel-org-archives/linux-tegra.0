From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/4] clk: tegra: Add la clock for Tegra210
Date: Thu, 16 Nov 2017 16:28:59 +0200
Message-ID: <1510842542-16451-2-git-send-email-pdeschrijver@nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510842542-16451-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This clock is needed by the memory built-in self test work around.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra210.c         | 12 ++++++++++++
 include/dt-bindings/clock/tegra210-car.h |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 6d7a613..55a5b7f 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -40,6 +40,7 @@
 
 #define CLK_SOURCE_CSITE 0x1d4
 #define CLK_SOURCE_EMC 0x19c
+#define CLK_SOURCE_LA 0x1f8
 
 #define PLLC_BASE 0x80
 #define PLLC_OUT 0x84
@@ -2628,6 +2629,13 @@ static int tegra210_init_pllu(void)
 	return 0;
 }
 
+static const char * const la_parents[] = {
+	"pll_p", "pll_c2", "pll_c", "pll_c3", "pll_re_out1", "pll_a1", "clk_m", "pll_c4_out0"
+};
+
+static struct tegra_clk_periph tegra210_la =
+	TEGRA_CLK_PERIPH(29, 7, 9, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP, 76, 0, NULL, 0);
+
 static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
@@ -2667,6 +2675,10 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					     periph_clk_enb_refcnt);
 	clks[TEGRA210_CLK_DSIB] = clk;
 
+	/* la */
+	clk = tegra_clk_register_periph("la", la_parents,
+			ARRAY_SIZE(la_parents), &tegra210_la, clk_base,
+			CLK_SOURCE_LA, 0);
 	/* emc mux */
 	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
 			       ARRAY_SIZE(mux_pllmcp_clkm), 0,
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index a9dc145..5df857a 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -95,7 +95,7 @@
 #define TEGRA210_CLK_CSITE 73
 /* 74 */
 /* 75 */
-/* 76 */
+#define TEGRA210_CLK_LA 76
 /* 77 */
 #define TEGRA210_CLK_SOC_THERM 78
 #define TEGRA210_CLK_DTV 79
-- 
1.9.1
