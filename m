From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH] clk: tegra: mark TEGRA210_CLK_DBGAPB as always on
Date: Tue, 28 Feb 2017 17:19:50 +0200
Message-ID: <1488295191-24038-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This is needed to make the JTAG debugging interface work.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 9a2512a..708f5f1 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2680,6 +2680,7 @@ static void tegra210_cpu_clock_resume(void)
 	{ TEGRA210_CLK_EMC, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_MSELECT, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_CSITE, TEGRA210_CLK_CLK_MAX, 0, 1 },
+	{ TEGRA210_CLK_DBGAPB, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_TSENSOR, TEGRA210_CLK_CLK_M, 400000, 0 },
 	{ TEGRA210_CLK_I2C1, TEGRA210_CLK_PLL_P, 0, 0 },
 	{ TEGRA210_CLK_I2C2, TEGRA210_CLK_PLL_P, 0, 0 },
-- 
1.9.1
