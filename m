From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/3] clk: tegra: Add more rates to Tegra30 PLLX frequency table
Date: Thu, 30 Aug 2018 22:20:44 +0300
Message-ID: <20180830192045.11017-3-digetx@gmail.com>
References: <20180830192045.11017-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830192045.11017-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add more predefined rates to the PLLX table, allowing to lower the rate
down to 312MHz. This gives more variations of frequency selection to the
CPUFREQ driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 42 +++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index c4b78316ba8a..0f8797ca39e2 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -342,6 +342,48 @@ static struct tegra_clk_pll_freq_table pll_x_freq_table[] = {
 	{ 16800000, 1000000000,  833, 14, 1, 8 }, /* actual: 999.6 MHz */
 	{ 19200000, 1000000000,  625, 12, 1, 8 },
 	{ 26000000, 1000000000, 1000, 26, 1, 8 },
+	/* 912 MHz */
+	{ 12000000,  912000000,  912, 12, 1, 8 },
+	{ 13000000,  912000000,  912, 13, 1, 8 },
+	{ 16800000,  912000000,  760, 14, 1, 8 },
+	{ 19200000,  912000000,  760, 16, 1, 8 },
+	{ 26000000,  912000000,  912, 26, 1, 8 },
+	/* 816 MHz */
+	{ 12000000,  816000000,  816, 12, 1, 8 },
+	{ 13000000,  816000000,  816, 13, 1, 8 },
+	{ 16800000,  816000000,  680, 14, 1, 8 },
+	{ 19200000,  816000000,  680, 16, 1, 8 },
+	{ 26000000,  816000000,  816, 26, 1, 8 },
+	/* 760 MHz */
+	{ 12000000,  760000000,  760, 12, 1, 8 },
+	{ 13000000,  760000000,  760, 13, 1, 8 },
+	{ 16800000,  760000000,  950, 21, 1, 8 },
+	{ 19200000,  760000000,  950, 24, 1, 8 },
+	{ 26000000,  760000000,  760, 26, 1, 8 },
+	/* 750 MHz */
+	{ 12000000,  750000000,  750, 12, 1, 8 },
+	{ 13000000,  750000000,  750, 13, 1, 8 },
+	{ 16800000,  750000000,  625, 14, 1, 8 },
+	{ 19200000,  750000000,  625, 16, 1, 8 },
+	{ 26000000,  750000000,  750, 26, 1, 8 },
+	/* 608 MHz */
+	{ 12000000,  608000000,  608, 12, 1, 8 },
+	{ 13000000,  608000000,  608, 13, 1, 8 },
+	{ 16800000,  608000000,  760, 21, 1, 8 },
+	{ 19200000,  608000000,  380, 12, 1, 8 },
+	{ 26000000,  608000000,  608, 26, 1, 8 },
+	/* 456 MHz */
+	{ 12000000,  456000000,  456, 12, 1, 8 },
+	{ 13000000,  456000000,  456, 13, 1, 8 },
+	{ 16800000,  456000000,  380, 15, 1, 8 },
+	{ 19200000,  456000000,  380, 14, 1, 8 },
+	{ 26000000,  456000000,  456, 26, 1, 8 },
+	/* 312 MHz */
+	{ 12000000,  312000000,  312, 12, 1, 8 },
+	{ 13000000,  312000000,  312, 13, 1, 8 },
+	{ 16800000,  312000000,  260, 14, 1, 8 },
+	{ 19200000,  312000000,  260, 16, 1, 8 },
+	{ 26000000,  312000000,  312, 26, 1, 8 },
 	{        0,          0,    0,  0, 0, 0 },
 };
 
-- 
2.18.0
