From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v1 2/3] clk: tegra: ignore unused vfir clock shared with uartb
Date: Thu,  1 Nov 2018 02:52:29 +0100
Message-ID: <20181101015230.27310-3-marcel@ziswiler.com>
References: <20181101015230.27310-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101015230.27310-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

As UARTB and VFIR share their clock enable bit it is rather unwise for
the kernel to turn off the VFIR one should that be unused (and
potentially vice versa but so far there anyway is no VFIR driver).

Without this patch trying to use UARTB with the regular 8250 driver
will freeze as soon as ttyS1 is accessed after boot. Luckily, using the
high-speed Tegra serial driver won't exhibit the issue as clocks are
dynamically enabled/disabled on every access.

This has been reproduced both on Apalis T30 as well as Apalis TK1 but
may be an issue on all Tegra UARTB's which share the clock enable with
VFIR.

Reported-by: Kory Swain <kory.swain@trapezegroup.com>
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index cc5275ec2c01..116c74340fb7 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -668,7 +668,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX("hda", mux_pllp_pllc_clkm, CLK_SOURCE_HDA, 125, TEGRA_PERIPH_ON_APB, tegra_clk_hda_8),
 	MUX("hda2codec_2x", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_HDA2CODEC_2X, 111, TEGRA_PERIPH_ON_APB, tegra_clk_hda2codec_2x),
 	MUX8("hda2codec_2x", mux_pllp_pllc_plla_clkm, CLK_SOURCE_HDA2CODEC_2X, 111, TEGRA_PERIPH_ON_APB, tegra_clk_hda2codec_2x_8),
-	MUX("vfir", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_VFIR, 7, TEGRA_PERIPH_ON_APB, tegra_clk_vfir),
+	MUX_FLAGS("vfir", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_VFIR, 7, TEGRA_PERIPH_ON_APB, tegra_clk_vfir, CLK_IGNORE_UNUSED),
 	MUX("sdmmc1", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC1, 14, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc1),
 	MUX("sdmmc2", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC2, 9, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc2),
 	MUX("sdmmc3", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC3, 69, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc3),
-- 
2.14.5
