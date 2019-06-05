From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2] clk: tegra210: Fix default rates for HDA clocks
Date: Wed, 5 Jun 2019 15:01:39 +0100
Message-ID: <1559743299-11576-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Currently the default clock rates for the HDA and HDA2CODEC_2X clocks
are both 19.2MHz. However, the default rates for these clocks should
actually be 51MHz and 48MHz, respectively. The current clock settings
results in a distorted output during audio playback. Correct the default
clock rates for these clocks by specifying them in the clock init table
for Tegra210.

Cc: stable@vger.kernel.org
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
Changes since V1:
- Updated the changelog and cc'ed stable.

Please note that I have not added a fixes tag because this has always
been broken for Tegra210.

 drivers/clk/tegra/clk-tegra210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index e1ba62d2b1a0..ac1d27a8c650 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3366,6 +3366,8 @@ static struct tegra_clk_init_table init_table[] __initdata = {
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
