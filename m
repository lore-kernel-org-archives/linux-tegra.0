From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 4/9] clk: tegra: Fix the misnaming of nvenc from msenc
Date: Fri, 8 Jan 2016 13:45:09 -0500
Message-ID: <1452278714-10751-5-git-send-email-rklein@nvidia.com>
References: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When adding the nvenc clock, it was partially named msenc in
the code. Since the msenc clk isn't present in T210 where the nvenc
clk is, its misleading to see it present. Therefore, properly
rename it.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 105405ca85ab..1860df1862dd 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -773,7 +773,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	XUSB("xusb_dev_src", mux_clkm_pllp_pllc_pllre, CLK_SOURCE_XUSB_DEV_SRC, 95, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_dev_src),
 	XUSB("xusb_dev_src", mux_clkm_pllp_pllre, CLK_SOURCE_XUSB_DEV_SRC, 95, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_dev_src_8),
 	MUX8("dbgapb", mux_pllp_clkm_2, CLK_SOURCE_DBGAPB, 185, TEGRA_PERIPH_NO_RESET, tegra_clk_dbgapb),
-	MUX8("msenc", mux_pllc2_c_c3_pllp_plla1_clkm, CLK_SOURCE_NVENC, 219, 0, tegra_clk_nvenc),
+	MUX8("nvenc", mux_pllc2_c_c3_pllp_plla1_clkm, CLK_SOURCE_NVENC, 219, 0, tegra_clk_nvenc),
 	MUX8("nvdec", mux_pllc2_c_c3_pllp_plla1_clkm, CLK_SOURCE_NVDEC, 194, 0, tegra_clk_nvdec),
 	MUX8("nvjpg", mux_pllc2_c_c3_pllp_plla1_clkm, CLK_SOURCE_NVJPG, 195, 0, tegra_clk_nvjpg),
 	MUX8("ape", mux_plla_pllc4_out0_pllc_pllc4_out1_pllp_pllc4_out2_clkm, CLK_SOURCE_APE, 198, TEGRA_PERIPH_ON_APB, tegra_clk_ape),
-- 
1.9.1
