From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] arm/tegra: Compile tegra_dt_init_irq only when CONFIG_OF
Date: Mon, 19 Dec 2011 12:24:05 -0700
Message-ID: <1324322645-30653-3-git-send-email-swarren@nvidia.com>
References: <1324322645-30653-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324322645-30653-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This fixes a build break attempting to build a Tegra20-only kernel
without device tree enabled.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/common.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
index 864dc97..a2eb901 100644
--- a/arch/arm/mach-tegra/common.c
+++ b/arch/arm/mach-tegra/common.c
@@ -33,6 +33,7 @@
 #include "clock.h"
 #include "fuse.h"
 
+#ifdef CONFIG_OF
 static const struct of_device_id tegra_dt_irq_match[] __initconst = {
 	{ .compatible = "arm,cortex-a9-gic", .data = gic_of_init },
 	{ }
@@ -43,6 +44,7 @@ void __init tegra_dt_init_irq(void)
 	tegra_init_irq();
 	of_irq_init(tegra_dt_irq_match);
 }
+#endif
 
 void tegra_assert_system_reset(char mode, const char *cmd)
 {
-- 
1.7.0.4
