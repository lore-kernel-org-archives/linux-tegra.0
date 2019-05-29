From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] clk: tegra210: Fix default rates for HDA clocks
Date: Wed, 29 May 2019 10:18:21 +0100
Message-ID: <1559121501-8566-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Currently the default clock rates for the HDA and HDA2CODEC_2X clocks
are both 19.2MHz. However, the default rates for these clocks should
actually be 51MHz and 48MHz, respectively. Correct the default clock
rates for these clocks by specifying them in the clock init table for
Tegra210.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index ed3c7df75d1e..8b3b3d771813 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3377,6 +3377,8 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_I2S3_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
 	{ TEGRA210_CLK_I2S4_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
 	{ TEGRA210_CLK_VIMCLK_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
+	{ TEGRA210_CLK_HDA, TEGRA210_CLK_PLL_P, 51000000, 0 },
+	{ TEGRA210_CLK_HDA2CODEC_2X, TEGRA210_CLK_PLL_P, 48000000, 0 },
 	/* This MUST be the last entry. */
 	{ TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
 };
-- 
2.7.4
