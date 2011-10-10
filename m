From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH v2 05/14] ARM: tegra: pcie: don't cast __iomem pointers
Date: Sun,  9 Oct 2011 22:27:55 -0700
Message-ID: <1318224484-2090-6-git-send-email-olof@lixom.net>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
 <1318224484-2090-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318224484-2090-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fixes a lot of:

arch/arm/mach-tegra/pcie.c:678:8: warning: cast removes address space of expression
arch/arm/mach-tegra/pcie.c:678:8: warning: incorrect type in argument 1 (different base types)
arch/arm/mach-tegra/pcie.c:678:8:    expected void const volatile [noderef] <asn:2>*<noident>
arch/arm/mach-tegra/pcie.c:678:8:    got unsigned int
arch/arm/mach-tegra/pcie.c:678:8: warning: cast removes address space of expression

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/pcie.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
index f1f699d..6b0c235 100644
--- a/arch/arm/mach-tegra/pcie.c
+++ b/arch/arm/mach-tegra/pcie.c
@@ -150,9 +150,9 @@
 static void __iomem *reg_pmc_base = IO_ADDRESS(TEGRA_PMC_BASE);
 
 #define pmc_writel(value, reg) \
-	__raw_writel(value, (u32)reg_pmc_base + (reg))
+	__raw_writel(value, reg_pmc_base + (reg))
 #define pmc_readl(reg) \
-	__raw_readl((u32)reg_pmc_base + (reg))
+	__raw_readl(reg_pmc_base + (reg))
 
 /*
  * Tegra2 defines 1GB in the AXI address map for PCIe.
-- 
1.7.4.1
