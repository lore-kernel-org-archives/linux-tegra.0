From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH] uphy: handle utmipll iddq
Date: Tue, 28 Feb 2017 17:19:24 +0200
Message-ID: <1488295165-23975-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: BH Hsieh <bhsieh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Export utmipll iddq functions. These will be needed when powergating the
XUSB partition.

Signed-off-by: BH Hsieh <bhsieh@nvidia.com>
Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 26 ++++++++++++++++++++++++++
 include/linux/clk/tegra.h        |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 708f5f1..4554a44 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2313,6 +2313,32 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 	"clk_m"
 };
 
+void tegra210_put_utmipll_in_iddq(void)
+{
+	u32 reg;
+
+	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
+
+	if (reg & UTMIPLL_HW_PWRDN_CFG0_UTMIPLL_LOCK) {
+		pr_err("trying to assert IDDQ while UTMIPLL is locked\n");
+		return;
+	}
+
+	reg |= UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
+	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
+}
+EXPORT_SYMBOL_GPL(tegra210_put_utmipll_in_iddq);
+
+void tegra210_put_utmipll_out_iddq(void)
+{
+	u32 reg;
+
+	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
+	reg &= ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
+	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
+}
+EXPORT_SYMBOL_GPL(tegra210_put_utmipll_out_iddq);
+
 static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 7007a5f..e17d328 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -125,5 +125,7 @@ static inline void tegra_cpu_clock_resume(void)
 extern void tegra210_xusb_pll_hw_sequence_start(void);
 extern void tegra210_sata_pll_hw_control_enable(void);
 extern void tegra210_sata_pll_hw_sequence_start(void);
+extern void tegra210_put_utmipll_in_iddq(void);
+extern void tegra210_put_utmipll_out_iddq(void);
 
 #endif /* __LINUX_CLK_TEGRA_H_ */
-- 
1.9.1
