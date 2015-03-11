From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v7 01/18] clk: tegra124: Remove old emc clock
Date: Wed, 11 Mar 2015 11:34:14 +0100
Message-ID: <1426070126-26910-2-git-send-email-tomeu.vizoso@collabora.com>
References: <1426070126-26910-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426070126-26910-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Mikko Perttunen <mikko.perttunen@kapsi.fi>, Mikko Perttunen <mperttunen@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

This clock has never been able to do anything.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

---

v2:	* Don't remove emc_mux as it's being used by the MC clock now
---
 drivers/clk/tegra/clk-tegra124.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 9a893f2..d370134 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -791,7 +791,6 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_i2c2] = { .dt_id = TEGRA124_CLK_I2C2, .present = true },
 	[tegra_clk_uartc] = { .dt_id = TEGRA124_CLK_UARTC, .present = true },
 	[tegra_clk_mipi_cal] = { .dt_id = TEGRA124_CLK_MIPI_CAL, .present = true },
-	[tegra_clk_emc] = { .dt_id = TEGRA124_CLK_EMC, .present = true },
 	[tegra_clk_usb2] = { .dt_id = TEGRA124_CLK_USB2, .present = true },
 	[tegra_clk_usb3] = { .dt_id = TEGRA124_CLK_USB3, .present = true },
 	[tegra_clk_vde_8] = { .dt_id = TEGRA124_CLK_VDE, .present = true },
-- 
2.1.0
