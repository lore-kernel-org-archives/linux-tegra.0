From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v6 4/9] clk: tegra: Add Tegra210 CSI TPG clock gate
Date: Fri, 3 Apr 2020 18:25:02 -0700
Message-ID: <1585963507-12610-5-git-send-email-skomatineni@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 CSI hardware internally uses PLLD for internal test pattern
generator logic.

PLLD_BASE register in CAR has a bit CSI_CLK_SOURCE to enable PLLD
out to CSI during TPG mode.

This patch adds this CSI TPG clock gate to Tegra210 clock driver
to allow Tegra video driver to ungate CSI TPG clock during TPG mode
and gate during non TPG mode.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index defe3b7..81a879b 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3035,6 +3035,13 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					     periph_clk_enb_refcnt);
 	clks[TEGRA210_CLK_DSIB] = clk;
 
+	/* csi_tpg */
+	clk = clk_register_gate(NULL, "csi_tpg", "pll_d",
+				CLK_SET_RATE_PARENT, clk_base + PLLD_BASE,
+				23, 0, &pll_d_lock);
+	clk_register_clkdev(clk, "csi_tpg", NULL);
+	clks[TEGRA210_CLK_CSI_TPG] = clk;
+
 	/* la */
 	clk = tegra_clk_register_periph("la", la_parents,
 			ARRAY_SIZE(la_parents), &tegra210_la, clk_base,
-- 
2.7.4
