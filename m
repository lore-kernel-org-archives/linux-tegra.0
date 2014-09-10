From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 1/4] clk: tegra: Move mipi-cal initialization into clk-tegra1[12]4.c
Date: Wed, 10 Sep 2014 10:52:02 -0400
Message-ID: <1410360725-4286-2-git-send-email-seanpaul@chromium.org>
References: <1410360725-4286-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410360725-4286-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch moves the mipi-cal gate registration down into the SoC
specific files to reflect the different in parent between them.

Without this change, MIPI calibration will fail on K1 devices if
the 72MHz clock is off.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
	- Added this patch in favor of the patch that did this in the mipi driver

 drivers/clk/tegra/clk-tegra-periph.c | 1 -
 drivers/clk/tegra/clk-tegra114.c     | 5 +++++
 drivers/clk/tegra/clk-tegra124.c     | 5 +++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 37f32c4..97c0eb4 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -524,7 +524,6 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("hda2hdmi", "clk_m", 128, TEGRA_PERIPH_ON_APB, tegra_clk_hda2hdmi, 0),
 	GATE("bsea", "clk_m", 62, 0, tegra_clk_bsea, 0),
 	GATE("bsev", "clk_m", 63, 0, tegra_clk_bsev, 0),
-	GATE("mipi-cal", "clk_m", 56, 0, tegra_clk_mipi_cal, 0),
 	GATE("usbd", "clk_m", 22, 0, tegra_clk_usbd, 0),
 	GATE("usb2", "clk_m", 58, 0, tegra_clk_usb2, 0),
 	GATE("usb3", "clk_m", 59, 0, tegra_clk_usb3, 0),
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index f760f31..5a1fa41 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1238,6 +1238,11 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 		clks[data->clk_id] = clk;
 	}
 
+	clk = tegra_clk_register_periph_gate("mipi-cal", "clk_m", 0, clk_base,
+				0, TEGRA114_CLK_MIPI_CAL,
+				periph_clk_enb_refcnt);
+	clks[TEGRA114_CLK_MIPI_CAL] = clk;
+
 	tegra_periph_clk_init(clk_base, pmc_base, tegra114_clks,
 				&pll_p_params);
 }
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 9525c68..0c3c892 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1141,6 +1141,11 @@ static __init void tegra124_periph_clk_init(void __iomem *clk_base,
 	clk_register_clkdev(clk, "cml1", NULL);
 	clks[TEGRA124_CLK_CML1] = clk;
 
+	clk = tegra_clk_register_periph_gate("mipi-cal", "clk72mhz", 0,
+				clk_base, 0, TEGRA124_CLK_MIPI_CAL,
+				periph_clk_enb_refcnt);
+	clks[TEGRA124_CLK_MIPI_CAL] = clk;
+
 	tegra_periph_clk_init(clk_base, pmc_base, tegra124_clks, &pll_p_params);
 }
 
-- 
2.0.0
