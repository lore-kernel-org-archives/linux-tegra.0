From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: make tegra_cpu_reset_handler_enable() __init
Date: Mon, 18 Jun 2012 15:01:50 -0600
Message-ID: <1340053310-20855-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arndb-r2nGTMty4D4@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This solves a section mismatch warning. I hadn't noticed this before,
because my compiler was inlining tegra_cpu_reset_handler_enable() inside
tegra_cpu_reset_handler_init(), which is already __init, but I switched
compilers and it stopped doing that.

Cc: <stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> # v3.4
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Arnd, Olof, do you want me to put this in a pull request, or can you apply
it directly for 3.5?

 arch/arm/mach-tegra/reset.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
index 4d6a2ee..5beb7eb 100644
--- a/arch/arm/mach-tegra/reset.c
+++ b/arch/arm/mach-tegra/reset.c
@@ -33,7 +33,7 @@
 
 static bool is_enabled;
 
-static void tegra_cpu_reset_handler_enable(void)
+static void __init tegra_cpu_reset_handler_enable(void)
 {
 	void __iomem *iram_base = IO_ADDRESS(TEGRA_IRAM_RESET_BASE);
 	void __iomem *evp_cpu_reset =
-- 
1.7.0.4
