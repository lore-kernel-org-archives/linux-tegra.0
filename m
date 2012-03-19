From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: Include assembler.h in sleep.S to fix build break
Date: Mon, 19 Mar 2012 11:07:43 -0600
Message-ID: <1332176863-12537-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 6f6f6a7 "ARM: create a common IOMEM definition" moved macro
IOMEM(), and requires users to include <asm/assembler.h>. Fix Tegra's
sleep.S to do so.

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
v2: Fix linux/ vs. asm/ include ordering. Remove include of io.h too.

 arch/arm/mach-tegra/sleep.S |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/sleep.S b/arch/arm/mach-tegra/sleep.S
index 8f9fde1..5b20197 100644
--- a/arch/arm/mach-tegra/sleep.S
+++ b/arch/arm/mach-tegra/sleep.S
@@ -23,7 +23,9 @@
  */
 
 #include <linux/linkage.h>
-#include <mach/io.h>
+
+#include <asm/assembler.h>
+
 #include <mach/iomap.h>
 
 #include "flowctrl.h"
-- 
1.7.0.4
