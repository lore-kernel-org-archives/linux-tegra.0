From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 05/14] ARM: tegra: tegra2_clocks: don't cast __iomem pointers
Date: Thu,  6 Oct 2011 19:54:15 -0700
Message-ID: <1317956064-17650-6-git-send-email-olof@lixom.net>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317956064-17650-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fixes lots of:

arch/arm/mach-tegra/tegra2_clocks.c:180:2: warning: cast removes address space of expression
arch/arm/mach-tegra/tegra2_clocks.c:180:2: warning: incorrect type in argument 1 (different base types)
arch/arm/mach-tegra/tegra2_clocks.c:180:2:    expected void const volatile [noderef] <asn:2>*<noident>
arch/arm/mach-tegra/tegra2_clocks.c:180:2:    got unsigned int
arch/arm/mach-tegra/tegra2_clocks.c:180:2: warning: cast removes address space of expression

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/tegra2_clocks.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 0fe9b3e..3325cd6 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -166,13 +166,13 @@ static DEFINE_SPINLOCK(clock_register_lock);
 static int tegra_periph_clk_enable_refcount[3 * 32];
 
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
 
 unsigned long clk_measure_input_freq(void)
 {
-- 
1.7.4.1
