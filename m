From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/3] clk: tegra: Enable sor1 and sor1_src on Tegra210
Date: Tue, 14 Jun 2016 14:00:44 +0200
Message-ID: <20160614120044.30734-3-thierry.reding@gmail.com>
References: <20160614120044.30734-1-thierry.reding@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160614120044.30734-1-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, Rhyland Klein <rklein@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Make the sor1 and sor1_src clocks available on Tegra210. They will be
used by the display driver to support HDMI and DP.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c         | 2 ++
 include/dt-bindings/clock/tegra210-car.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index cd141a364c9d..8e37eda37449 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2093,6 +2093,8 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_dpaux1] = { .dt_id = TEGRA210_CLK_DPAUX1, .present = true },
 	[tegra_clk_sor0] = { .dt_id = TEGRA210_CLK_SOR0, .present = true },
 	[tegra_clk_sor0_lvds] = { .dt_id = TEGRA210_CLK_SOR0_LVDS, .present = true },
+	[tegra_clk_sor1] = { .dt_id = TEGRA210_CLK_SOR1, .present = true },
+	[tegra_clk_sor1_src] = { .dt_id = TEGRA210_CLK_SOR1_SRC, .present = true },
 	[tegra_clk_gpu] = { .dt_id = TEGRA210_CLK_GPU, .present = true },
 	[tegra_clk_pll_g_ref] = { .dt_id = TEGRA210_CLK_PLL_G_REF, .present = true, },
 	[tegra_clk_uartb_8] = { .dt_id = TEGRA210_CLK_UARTB, .present = true },
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index bd3530e56d46..35288b20f2c9 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -308,7 +308,7 @@
 #define TEGRA210_CLK_CLK_OUT_3 279
 #define TEGRA210_CLK_BLINK 280
 /* 281 */
-/* 282 */
+#define TEGRA210_CLK_SOR1_SRC 282
 /* 283 */
 #define TEGRA210_CLK_XUSB_HOST_SRC 284
 #define TEGRA210_CLK_XUSB_FALCON_SRC 285
-- 
2.8.3

