From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 5/5] clk: tegra: add aclk
Date: Thu, 23 Feb 2017 14:39:39 +0200
Message-ID: <1487853585-17934-6-git-send-email-pdeschrijver@nvidia.com>
References: <1487853585-17934-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487853585-17934-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This clock clocks the ADSP cortex-A9.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c         | 10 ++++++++++
 include/dt-bindings/clock/tegra210-car.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index cfe7078..9a2512a 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2308,6 +2308,11 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 
 static struct clk **clks;
 
+static const char * const aclk_parents[] = {
+	"pll_a1", "pll_c", "pll_p", "pll_a_out0", "pll_c2", "pll_c3",
+	"clk_m"
+};
+
 static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
@@ -2369,6 +2374,11 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 	clk_register_clkdev(clk, "cml1", NULL);
 	clks[TEGRA210_CLK_CML1] = clk;
 
+	clk = tegra_clk_register_super_clk("aclk", aclk_parents,
+				ARRAY_SIZE(aclk_parents), 0, clk_base + 0x6e0,
+				0, NULL);
+	clks[TEGRA210_CLK_ACLK] = clk;
+
 	tegra_periph_clk_init(clk_base, pmc_base, tegra210_clks, &pll_p_params);
 }
 
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 5aa1027..8744b19 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -396,6 +396,8 @@
 #define TEGRA210_CLK_PLL_C_UD 364
 #define TEGRA210_CLK_SCLK_MUX 365
 
+#define TEGRA210_CLK_ACLK 370
+
 #define TEGRA210_CLK_DMIC1_SYNC_CLK 388
 #define TEGRA210_CLK_DMIC1_SYNC_CLK_MUX 389
 #define TEGRA210_CLK_DMIC2_SYNC_CLK 390
-- 
1.9.1
