From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 10/14] ARM: tegra: tegra_init_cache should be static
Date: Thu,  6 Oct 2011 19:54:20 -0700
Message-ID: <1317956064-17650-11-git-send-email-olof@lixom.net>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317956064-17650-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Not exported and not used externally.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/common.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
index d5e3f89..690b888 100644
--- a/arch/arm/mach-tegra/common.c
+++ b/arch/arm/mach-tegra/common.c
@@ -61,7 +61,7 @@ static __initdata struct tegra_clk_init_table common_clk_init_table[] = {
 	{ NULL,		NULL,		0,		0},
 };
 
-void __init tegra_init_cache(void)
+static void __init tegra_init_cache(void)
 {
 #ifdef CONFIG_CACHE_L2X0
 	void __iomem *p = IO_ADDRESS(TEGRA_ARM_PERIF_BASE) + 0x3000;
-- 
1.7.4.1
