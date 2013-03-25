From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: use CS_LAR_KEY definition instead of 0xC5ACCE55
Date: Mon, 25 Mar 2013 18:19:12 +0000
Message-ID: <1364235552-17851-2-git-send-email-will.deacon@arm.com>
References: <1364235552-17851-1-git-send-email-will.deacon@arm.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364235552-17851-1-git-send-email-will.deacon-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dietmar Eggemann <dietmar.eggemann-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When enabling coresight on secondary cores for tegra, make use of our
fancy new definition for the magic lock code.

Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Signed-off-by: Dietmar Eggemann <dietmar.eggemann-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/mach-tegra/headsmp.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/headsmp.S b/arch/arm/mach-tegra/headsmp.S
index fd473f2..d2747fe 100644
--- a/arch/arm/mach-tegra/headsmp.S
+++ b/arch/arm/mach-tegra/headsmp.S
@@ -1,6 +1,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 
+#include <asm/hardware/coresight.h>
 #include "sleep.h"
 
         .section ".text.head", "ax"
@@ -8,7 +9,7 @@
 ENTRY(tegra_secondary_startup)
         bl      v7_invalidate_l1
 	/* Enable coresight */
-	mov32	r0, 0xC5ACCE55
+	mov32	r0, CS_LAR_KEY
 	mcr	p14, 0, r0, c7, c12, 6
         b       secondary_startup
 ENDPROC(tegra_secondary_startup)
-- 
1.8.0
