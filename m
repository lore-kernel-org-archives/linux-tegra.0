From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 4/5] ARM: tegra: set CPU reset handler with firmware op
Date: Sun, 15 Sep 2013 18:40:27 +0900
Message-ID: <1379238028-7960-5-git-send-email-acourbot@nvidia.com>
References: <1379238028-7960-1-git-send-email-acourbot@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379238028-7960-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use a firmware operation to set the CPU reset handler and only resort to
doing it ourselves if there is none defined.

This supports the booting of secondary CPUs on devices using a TrustZone
secure monitor.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/reset.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
index 6964117..fc9cf03 100644
--- a/arch/arm/mach-tegra/reset.c
+++ b/arch/arm/mach-tegra/reset.c
@@ -21,6 +21,7 @@
 
 #include <asm/cacheflush.h>
 #include <asm/hardware/cache-l2x0.h>
+#include <asm/firmware.h>
 
 #include "iomap.h"
 #include "irammap.h"
@@ -65,6 +66,7 @@ static void __init tegra_cpu_reset_handler_enable(void)
 	void __iomem *iram_base = IO_ADDRESS(TEGRA_IRAM_RESET_BASE);
 	const u32 reset_address = TEGRA_IRAM_RESET_BASE +
 						tegra_cpu_reset_handler_offset;
+	int err;
 
 	BUG_ON(is_enabled);
 	BUG_ON(tegra_cpu_reset_handler_size > TEGRA_IRAM_RESET_HANDLER_SIZE);
@@ -72,9 +74,18 @@ static void __init tegra_cpu_reset_handler_enable(void)
 	memcpy(iram_base, (void *)__tegra_cpu_reset_handler_start,
 			tegra_cpu_reset_handler_size);
 
-	tegra_cpu_reset_handler_set(reset_address);
-
-	is_enabled = true;
+	err = call_firmware_op(set_cpu_boot_addr, 0, reset_address);
+	switch (err) {
+	case -ENOSYS:
+		tegra_cpu_reset_handler_set(reset_address);
+		/* pass-through */
+	case 0:
+		is_enabled = true;
+		break;
+	default:
+		pr_crit("Cannot set CPU reset handler: %d\n", err);
+		BUG();
+	}
 }
 
 void __init tegra_cpu_reset_handler_init(void)
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
