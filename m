From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: Export tegra_powergate_sequence_power_up()
Date: Thu, 28 Mar 2013 21:35:03 +0100
Message-ID: <1364502904-5284-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This function can be used by drivers to enable power to the hardware
blocks that they drive. Most of the drivers can be built as a module
and therefore require this function to be exported.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index c6bc8f8..c472bed 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -22,6 +22,7 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/seq_file.h>
@@ -168,6 +169,7 @@ err_clk:
 err_power:
 	return ret;
 }
+EXPORT_SYMBOL(tegra_powergate_sequence_power_up);
 
 int tegra_cpu_powergate_id(int cpuid)
 {
-- 
1.8.1.5
