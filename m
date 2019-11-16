From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 050/237] clk: tegra: Fixes for MBIST work around
Date: Sat, 16 Nov 2019 10:38:05 -0500
Message-ID: <20191116154113.7417-50-sashal@kernel.org>
References: <20191116154113.7417-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191116154113.7417-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Joseph Lo <josephl@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Joseph Lo <josephl@nvidia.com>

[ Upstream commit a4dbbceeee3e0ba670875a147237d6566de78840 ]

Fix some incorrect data in LVL2 offset and bit mask.

Fixes: e403d0057343 ("clk: tegra: MBIST work around for Tegra210")
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/tegra/clk-tegra210.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 080bfa24863ee..7264e97310348 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2603,7 +2603,7 @@ static struct tegra210_domain_mbist_war tegra210_pg_mbist_war[] = {
 	[TEGRA_POWERGATE_MPE] = {
 		.handle_lvl2_ovr = tegra210_generic_mbist_war,
 		.lvl2_offset = LVL2_CLK_GATE_OVRE,
-		.lvl2_mask = BIT(2),
+		.lvl2_mask = BIT(29),
 	},
 	[TEGRA_POWERGATE_SOR] = {
 		.handle_lvl2_ovr = tegra210_generic_mbist_war,
@@ -2654,14 +2654,14 @@ static struct tegra210_domain_mbist_war tegra210_pg_mbist_war[] = {
 		.num_clks = ARRAY_SIZE(nvdec_slcg_clkids),
 		.clk_init_data = nvdec_slcg_clkids,
 		.handle_lvl2_ovr = tegra210_generic_mbist_war,
-		.lvl2_offset = LVL2_CLK_GATE_OVRC,
+		.lvl2_offset = LVL2_CLK_GATE_OVRE,
 		.lvl2_mask = BIT(9) | BIT(31),
 	},
 	[TEGRA_POWERGATE_NVJPG] = {
 		.num_clks = ARRAY_SIZE(nvjpg_slcg_clkids),
 		.clk_init_data = nvjpg_slcg_clkids,
 		.handle_lvl2_ovr = tegra210_generic_mbist_war,
-		.lvl2_offset = LVL2_CLK_GATE_OVRC,
+		.lvl2_offset = LVL2_CLK_GATE_OVRE,
 		.lvl2_mask = BIT(9) | BIT(31),
 	},
 	[TEGRA_POWERGATE_AUD] = {
-- 
2.20.1
