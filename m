From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 2/8] clk: tegra: host1x has fractional divider
Date: Fri, 20 Jul 2018 14:45:26 +0100
Message-ID: <20180720134532.13148-3-ben.dooks@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.co, thierry.reding@gmail.com, linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

The host1x clock according to both tegra2 and tegra3 manuals is
an 8bit divider with lsb being fractional. This is running into
an issue where the host1x is being set on a tegra20a system to
266.4MHz but ends up at 222MHz instead.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 2acba2986bc6..8fa1cecf18a0 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -644,7 +644,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	INT("vde", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_VDE, 61, 0, tegra_clk_vde),
 	INT("vi", mux_pllm_pllc_pllp_plla, CLK_SOURCE_VI, 20, 0, tegra_clk_vi),
 	INT("epp", mux_pllm_pllc_pllp_plla, CLK_SOURCE_EPP, 19, 0, tegra_clk_epp),
-	INT("host1x", mux_pllm_pllc_pllp_plla, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x),
+	MUX("host1x", mux_pllm_pllc_pllp_plla, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x),
 	INT("mpe", mux_pllm_pllc_pllp_plla, CLK_SOURCE_MPE, 60, 0, tegra_clk_mpe),
 	INT("2d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_2D, 21, 0, tegra_clk_gr2d),
 	INT("3d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_3D, 24, 0, tegra_clk_gr3d),
-- 
2.18.0
