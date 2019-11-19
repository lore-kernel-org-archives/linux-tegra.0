From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v1 08/17] clk: tegra: Use Tegra PMC helper function for PLLE IDDQ
Date: Mon, 18 Nov 2019 22:50:25 -0800
Message-ID: <1574146234-3871-9-git-send-email-skomatineni@nvidia.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra PMC has PLLE IDDQ programming to bring the PLLE pads out of
DPD idle state through software by overriding the hardware control.

Currently Tegra clock driver programs Tegra PMC registers directly
for enabling software override and to bring PLLE pads out of DPD
idle state. With this, when Tegra PMC is in secure mode, any direct
PMC register access from non-secure world will not go through.

This patch updates Tegra clock driver to use Tegra PMC helper function
to clear PLLE IDDQ through software control that does PMC programming
using tegra_pmc_writel and tegra_pmc_readl which supports both secure
mode and non-secure mode PMC access.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index f3c0a637174f..4ae9e282e7be 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -143,10 +143,6 @@
 #define PLLCX_MISC2_DEFAULT 0x30211200
 #define PLLCX_MISC3_DEFAULT 0x200
 
-#define PMC_SATA_PWRGT 0x1ac
-#define PMC_SATA_PWRGT_PLLE_IDDQ_VALUE BIT(5)
-#define PMC_SATA_PWRGT_PLLE_IDDQ_SWCTL BIT(4)
-
 #define PLLSS_MISC_KCP		0
 #define PLLSS_MISC_KVCO		0
 #define PLLSS_MISC_SETUP	0
@@ -863,24 +859,11 @@ static int clk_plle_training(struct tegra_clk_pll *pll)
 	u32 val;
 	unsigned long timeout;
 
-	if (!pll->pmc)
-		return -ENOSYS;
-
 	/*
 	 * PLLE is already disabled, and setup cleared;
 	 * create falling edge on PLLE IDDQ input.
 	 */
-	val = readl(pll->pmc + PMC_SATA_PWRGT);
-	val |= PMC_SATA_PWRGT_PLLE_IDDQ_VALUE;
-	writel(val, pll->pmc + PMC_SATA_PWRGT);
-
-	val = readl(pll->pmc + PMC_SATA_PWRGT);
-	val |= PMC_SATA_PWRGT_PLLE_IDDQ_SWCTL;
-	writel(val, pll->pmc + PMC_SATA_PWRGT);
-
-	val = readl(pll->pmc + PMC_SATA_PWRGT);
-	val &= ~PMC_SATA_PWRGT_PLLE_IDDQ_VALUE;
-	writel(val, pll->pmc + PMC_SATA_PWRGT);
+	tegra_pmc_clear_plle_iddq();
 
 	val = pll_readl_misc(pll);
 
-- 
2.7.4
