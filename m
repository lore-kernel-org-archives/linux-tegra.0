From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] gpio: tegra: remove useless includes of <mach/*.h>
Date: Mon, 27 Aug 2012 23:59:56 -0700
Message-ID: <1346137196-7138-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Nothing from these files is needed, so remove the includes. This helps
single zImage work by reducing use of the mach-tegra/include/mach/
directory.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-tegra.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index dc5184d..d982593 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -30,9 +30,6 @@
 
 #include <asm/mach/irq.h>
 
-#include <mach/iomap.h>
-#include <mach/suspend.h>
-
 #define GPIO_BANK(x)		((x) >> 5)
 #define GPIO_PORT(x)		(((x) >> 3) & 0x3)
 #define GPIO_BIT(x)		((x) & 0x7)
-- 
1.7.9.5
