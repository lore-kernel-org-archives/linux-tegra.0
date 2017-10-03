From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 2/4] clk: tegra: Correct parent of the APBDMA clock
Date: Wed,  4 Oct 2017 02:02:39 +0300
Message-ID: <da467b22849ad62417d9a26a8166eef6d7f71a59.1507070638.git.digetx@gmail.com>
References: <cover.1507070638.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507070638.git.digetx@gmail.com>
In-Reply-To: <cover.1507070638.git.digetx@gmail.com>
References: <cover.1507070638.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

APBDMA represents a clock gate to the APB DMA controller, the actual
clock source for the controller is PCLK.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 0bce2bc55f0d..870776e4a82b 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -824,7 +824,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("isp", "clk_m", 23, 0, tegra_clk_isp, 0),
 	GATE("vcp", "clk_m", 29, 0, tegra_clk_vcp, 0),
 	GATE("ahbdma", "hclk", 33, 0, tegra_clk_ahbdma, 0),
-	GATE("apbdma", "clk_m", 34, 0, tegra_clk_apbdma, 0),
+	GATE("apbdma", "pclk", 34, 0, tegra_clk_apbdma, 0),
 	GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_kbc, 0),
 	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, 0),
 	GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse_burn, 0),
-- 
2.14.1
