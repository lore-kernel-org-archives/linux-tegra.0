From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] ARM: Tegra: dt: Fix machine desc to match other boards.
Date: Sat, 23 Apr 2011 22:30:03 -0600
Message-ID: <1303619404-27604-3-git-send-email-swarren@nvidia.com>
References: <1303619404-27604-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303619404-27604-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The content of the machine descriptions has be re-organized. Without fixing
the board-dt.c copy, the system will fail to boot (BUG_ON during timer
initialization, which happens before printk is operational, leading to a
silent hang early during kernel boot). Solve this basiclaly by copying the
existing Harmony version over the copy in board-dt.c

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index 899311b..7b9d469 100644
--- a/arch/arm/mach-tegra/board-dt.c
+++ b/arch/arm/mach-tegra/board-dt.c
@@ -175,10 +175,11 @@ static const char * tegra_dt_board_compat[] = {
 };
 
 DT_MACHINE_START(TEGRA_DT, "nVidia Tegra (Flattened Device Tree)")
-	.fixup		= tegra_dt_fixup,
-	.init_irq	= tegra_init_irq,
-	.init_machine	= tegra_dt_init,
-	.map_io		= tegra_map_common_io,
-	.timer		= &tegra_timer,
+	.boot_params    = 0x00000100,
+	.map_io         = tegra_map_common_io,
+	.init_early     = tegra_init_early,
+	.init_irq       = tegra_init_irq,
+	.timer          = &tegra_timer,
+	.init_machine   = tegra_dt_init,
 	.dt_compat	= tegra_dt_board_compat,
 MACHINE_END
-- 
1.7.1
