From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] ARM: tegra: Remove duplicate powergate defines
Date: Wed, 16 Oct 2013 19:19:00 +0200
Message-ID: <1381943942-30375-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Instead of duplicating powergate defines, reuse the ones from the
include/linux/tegra-powergate.h header file.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/pmc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c
index 3744af9..fb79202 100644
--- a/arch/arm/mach-tegra/pmc.c
+++ b/arch/arm/mach-tegra/pmc.c
@@ -20,6 +20,7 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/tegra-powergate.h>
 
 #include "flowctrl.h"
 #include "fuse.h"
@@ -43,12 +44,6 @@
 #define PMC_CPUPWRGOOD_TIMER	0xc8
 #define PMC_CPUPWROFF_TIMER	0xcc
 
-#define TEGRA_POWERGATE_PCIE	3
-#define TEGRA_POWERGATE_VDEC	4
-#define TEGRA_POWERGATE_CPU1	9
-#define TEGRA_POWERGATE_CPU2	10
-#define TEGRA_POWERGATE_CPU3	11
-
 static u8 tegra_cpu_domains[] = {
 	0xFF,			/* not available for CPU0 */
 	TEGRA_POWERGATE_CPU1,
-- 
1.8.4
