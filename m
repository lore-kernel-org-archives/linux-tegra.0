From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 9/9] clk: tegra210: Initialize PLL_D2 to a sane rate
Date: Fri, 8 Jan 2016 13:45:14 -0500
Message-ID: <1452278714-10751-10-git-send-email-rklein@nvidia.com>
References: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Initialize PLL_D2 to a sane rate at the start of the day.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 5d8fac7052f2..cc560a1f6efb 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2749,6 +2749,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_PLL_DP, TEGRA210_CLK_CLK_MAX, 270000000, 0 },
 	{ TEGRA210_CLK_SOC_THERM, TEGRA210_CLK_PLL_P, 51000000, 0 },
 	{ TEGRA210_CLK_CCLK_G, TEGRA210_CLK_CLK_MAX, 0, 1 },
+	{ TEGRA210_CLK_PLL_D2, TEGRA210_CLK_CLK_MAX, 594000000, 0 },
 	/* This MUST be the last entry. */
 	{ TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
 };
-- 
1.9.1
