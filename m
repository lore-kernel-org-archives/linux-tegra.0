From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: use setup_mm_for_reboot rather than explicit pgd switch
Date: Mon, 25 Mar 2013 18:19:11 +0000
Message-ID: <1364235552-17851-1-git-send-email-will.deacon@arm.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch changes the Tegra PM code to use the setup_mm_for_reboot
helper rather than call cpu_switch_mm directly. This keeps things like
TLB invalidation in one place.

Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Signed-off-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/mach-tegra/pm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index 523604d..a77ed48 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -183,12 +183,7 @@ bool tegra_set_cpu_in_lp2(int phy_cpu_id)
 
 static int tegra_sleep_cpu(unsigned long v2p)
 {
-	/* Switch to the identity mapping. */
-	cpu_switch_mm(idmap_pgd, &init_mm);
-
-	/* Flush the TLB. */
-	local_flush_tlb_all();
-
+	setup_mm_for_reboot();
 	tegra_sleep_cpu_finish(v2p);
 
 	/* should never here */
-- 
1.8.0
