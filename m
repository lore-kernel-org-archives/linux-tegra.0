From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] ARM: tegra: Remove unneeded include
Date: Thu, 26 Jul 2012 19:28:27 +0200
Message-ID: <1343323707-27221-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The linux/notifier.h include is no longer required. This removal was
most likely forgotten in the move to the new pinctrl driver in commit
f30d12b ("ARM: tegra: Switch to new pinctrl driver").

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 arch/arm/mach-tegra/board-pinmux.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-tegra/board-pinmux.c b/arch/arm/mach-tegra/board-pinmux.c
index a5574c7..1482b2d 100644
--- a/arch/arm/mach-tegra/board-pinmux.c
+++ b/arch/arm/mach-tegra/board-pinmux.c
@@ -14,7 +14,6 @@
 
 #include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/notifier.h>
 #include <linux/string.h>
 
 #include "board-pinmux.h"
-- 
1.7.11.2
