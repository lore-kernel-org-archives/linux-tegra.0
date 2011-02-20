From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 7/7] ARM: tegra: fix hang on reboot
Date: Sat, 19 Feb 2011 23:44:44 -0600
Message-ID: <1298180684-6261-8-git-send-email-olof@lixom.net>
References: <1298180684-6261-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298180684-6261-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

We cannot use writel() here since the resulting wmb() calls l2x0_cache_sync()
which uses a spinlock and L1 cache may be off at this point.

Signed-off-by: Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/common.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
index 34559d1..b1ecf60 100644
--- a/arch/arm/mach-tegra/common.c
+++ b/arch/arm/mach-tegra/common.c
@@ -41,7 +41,7 @@ void tegra_assert_system_reset(char mode, const char *cmd)
 
 	reg = readl(reset);
 	reg |= 0x04;
-	writel(reg, reset);
+	writel_relaxed(reg, reset);
 }
 
 static __initdata struct tegra_clk_init_table common_clk_init_table[] = {
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
