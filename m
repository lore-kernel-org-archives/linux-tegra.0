From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: fix section mismatch in tegra_pmc_parse_dt
Date: Fri, 21 Jun 2013 16:39:07 -0600
Message-ID: <1371854347-12091-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

tegra_pmc_parse_dt() references __initconst data. Fix it to be __init.
This matches its only usage; a call from tegra_pmc_init() which is
already __init. This fixes:

WARNING: vmlinux.o(.text.unlikely+0x580): Section mismatch in reference
from the function tegra_pmc_parse_dt() to the (unknown reference)
.init.rodata:(unknown)

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c
index 32360e5..eb3fa4a 100644
--- a/arch/arm/mach-tegra/pmc.c
+++ b/arch/arm/mach-tegra/pmc.c
@@ -234,7 +234,7 @@ static const struct of_device_id matches[] __initconst = {
 	{ }
 };
 
-static void tegra_pmc_parse_dt(void)
+static void __init tegra_pmc_parse_dt(void)
 {
 	struct device_node *np;
 	u32 prop;
-- 
1.8.1.5
