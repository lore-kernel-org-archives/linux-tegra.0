From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 04/14] clk: tegra210: remove non-existing VFIR clock
Date: Tue, 25 Jul 2017 13:34:05 +0300
Message-ID: <1500978856-5981-5-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index facd6ee..dc4a813 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2204,7 +2204,6 @@ struct utmi_clk_param {
 	[tegra_clk_gpu] = { .dt_id = TEGRA210_CLK_GPU, .present = true },
 	[tegra_clk_pll_g_ref] = { .dt_id = TEGRA210_CLK_PLL_G_REF, .present = true, },
 	[tegra_clk_uartb_8] = { .dt_id = TEGRA210_CLK_UARTB, .present = true },
-	[tegra_clk_vfir] = { .dt_id = TEGRA210_CLK_VFIR, .present = true },
 	[tegra_clk_spdif_in_8] = { .dt_id = TEGRA210_CLK_SPDIF_IN, .present = true },
 	[tegra_clk_spdif_out] = { .dt_id = TEGRA210_CLK_SPDIF_OUT, .present = true },
 	[tegra_clk_vi_10] = { .dt_id = TEGRA210_CLK_VI, .present = true },
-- 
1.9.1
