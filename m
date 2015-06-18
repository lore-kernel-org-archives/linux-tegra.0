From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v6 25/25] clk: tegra: Add interface to enable hardware control of SATA/XUSB PLLs
Date: Thu, 18 Jun 2015 17:28:40 -0400
Message-ID: <1434662920-21469-26-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Andrew Bresticker <abrestic@chromium.org>

On Tegra210, hardware control of the SATA and XUSB pad PLLs must be
done during the UPHY enable sequence rather than the PLLE enable
sequence.  Export functions to do this so that hardware control can
be enabled from the XUSB padctl driver.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c |   58 ++++++++++++++++++++++++++++++++++++++
 include/linux/clk/tegra.h        |    5 ++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 3990b5624d3a..be9843f6140d 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -175,6 +175,19 @@
 #define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN BIT(14)
 #define UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN BIT(12)
 
+#define SATA_PLL_CFG0				0x490
+#define SATA_PLL_CFG0_PADPLL_RESET_SWCTL	BIT(0)
+#define SATA_PLL_CFG0_PADPLL_USE_LOCKDET	BIT(2)
+#define SATA_PLL_CFG0_PADPLL_SLEEP_IDDQ		BIT(13)
+#define SATA_PLL_CFG0_SEQ_ENABLE		BIT(24)
+
+#define XUSBIO_PLL_CFG0				0x51c
+#define XUSBIO_PLL_CFG0_PADPLL_RESET_SWCTL	BIT(0)
+#define XUSBIO_PLL_CFG0_CLK_ENABLE_SWCTL	BIT(2)
+#define XUSBIO_PLL_CFG0_PADPLL_USE_LOCKDET	BIT(6)
+#define XUSBIO_PLL_CFG0_PADPLL_SLEEP_IDDQ	BIT(13)
+#define XUSBIO_PLL_CFG0_SEQ_ENABLE		BIT(24)
+
 #define UTMIPLL_HW_PWRDN_CFG0			0x52c
 #define UTMIPLL_HW_PWRDN_CFG0_UTMIPLL_LOCK	BIT(31)
 #define UTMIPLL_HW_PWRDN_CFG0_SEQ_START_STATE	BIT(25)
@@ -415,6 +428,51 @@ static const char *mux_pllmcp_clkm[] = {
 #define PLLU_MISC0_WRITE_MASK		0xbfffffff
 #define PLLU_MISC1_WRITE_MASK		0x00000007
 
+void tegra210_xusb_pll_hw_control_enable(void)
+{
+	u32 val;
+
+	val = readl_relaxed(clk_base + XUSBIO_PLL_CFG0);
+	val &= ~(XUSBIO_PLL_CFG0_CLK_ENABLE_SWCTL |
+		 XUSBIO_PLL_CFG0_PADPLL_RESET_SWCTL);
+	val |= XUSBIO_PLL_CFG0_PADPLL_USE_LOCKDET |
+	       XUSBIO_PLL_CFG0_PADPLL_SLEEP_IDDQ;
+	writel_relaxed(val, clk_base + XUSBIO_PLL_CFG0);
+}
+EXPORT_SYMBOL_GPL(tegra210_xusb_pll_hw_control_enable);
+
+void tegra210_xusb_pll_hw_sequence_start(void)
+{
+	u32 val;
+
+	val = readl_relaxed(clk_base + XUSBIO_PLL_CFG0);
+	val |= XUSBIO_PLL_CFG0_SEQ_ENABLE;
+	writel_relaxed(val, clk_base + XUSBIO_PLL_CFG0);
+}
+EXPORT_SYMBOL_GPL(tegra210_xusb_pll_hw_sequence_start);
+
+void tegra210_sata_pll_hw_control_enable(void)
+{
+	u32 val;
+
+	val = readl_relaxed(clk_base + SATA_PLL_CFG0);
+	val &= ~SATA_PLL_CFG0_PADPLL_RESET_SWCTL;
+	val |= SATA_PLL_CFG0_PADPLL_USE_LOCKDET |
+	       SATA_PLL_CFG0_PADPLL_SLEEP_IDDQ;
+	writel_relaxed(val, clk_base + SATA_PLL_CFG0);
+}
+EXPORT_SYMBOL_GPL(tegra210_sata_pll_hw_control_enable);
+
+void tegra210_sata_pll_hw_sequence_start(void)
+{
+	u32 val;
+
+	val = readl_relaxed(clk_base + SATA_PLL_CFG0);
+	val |= SATA_PLL_CFG0_SEQ_ENABLE;
+	writel_relaxed(val, clk_base + SATA_PLL_CFG0);
+}
+EXPORT_SYMBOL_GPL(tegra210_sata_pll_hw_sequence_start);
+
 static inline void _pll_misc_chk_default(void __iomem *base,
 					struct tegra_clk_pll_params *params,
 					u8 misc_num, u32 default_val, u32 mask)
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 19c4208f4752..26b2041cac61 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -120,4 +120,9 @@ static inline void tegra_cpu_clock_resume(void)
 }
 #endif
 
+extern void tegra210_xusb_pll_hw_control_enable(void);
+extern void tegra210_xusb_pll_hw_sequence_start(void);
+extern void tegra210_sata_pll_hw_control_enable(void);
+extern void tegra210_sata_pll_hw_sequence_start(void);
+
 #endif /* __LINUX_CLK_TEGRA_H_ */
-- 
1.7.9.5
