From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: Fix data type for io address
Date: Fri, 7 Sep 2012 11:10:55 +0530
Message-ID: <1346996455-31697-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Warnings were generated because following commit changed data type for
address pointer

195bbca ARM: 7500/1: io: avoid writeback addressing modes for __raw_ accessors

arch/arm/mach-tegra/tegra30_clocks.c: In function 'clk_measure_input_freq':
arch/arm/mach-tegra/tegra30_clocks.c:418:2: warning: passing argument 2 of '__raw_writel' makes pointer from integer without a cast
.../arch/arm/include/asm/io.h:88:20: note: expected 'volatile void *' but argument is of type 'unsigned int

Signed-off-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra30_clocks.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra30_clocks.c b/arch/arm/mach-tegra/tegra30_clocks.c
index 7dad44d..5cd502c 100644
--- a/arch/arm/mach-tegra/tegra30_clocks.c
+++ b/arch/arm/mach-tegra/tegra30_clocks.c
@@ -376,19 +376,19 @@ static void __iomem *misc_gp_hidrev_base = IO_ADDRESS(TEGRA_APB_MISC_BASE);
 static int tegra_periph_clk_enable_refcount[CLK_OUT_ENB_NUM * 32];
 
 #define clk_writel(value, reg) \
-	__raw_writel(value, (u32)reg_clk_base + (reg))
+	__raw_writel(value, reg_clk_base + (reg))
 #define clk_readl(reg) \
-	__raw_readl((u32)reg_clk_base + (reg))
+	__raw_readl(reg_clk_base + (reg))
 #define pmc_writel(value, reg) \
-	__raw_writel(value, (u32)reg_pmc_base + (reg))
+	__raw_writel(value, reg_pmc_base + (reg))
 #define pmc_readl(reg) \
-	__raw_readl((u32)reg_pmc_base + (reg))
+	__raw_readl(reg_pmc_base + (reg))
 #define chipid_readl() \
-	__raw_readl((u32)misc_gp_hidrev_base + MISC_GP_HIDREV)
+	__raw_readl(misc_gp_hidrev_base + MISC_GP_HIDREV)
 
 #define clk_writel_delay(value, reg)					\
 	do {								\
-		__raw_writel((value), (u32)reg_clk_base + (reg));	\
+		__raw_writel((value), reg_clk_base + (reg));	\
 		udelay(2);						\
 	} while (0)
 
-- 
1.7.4.1
