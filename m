From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/4] ARM: tegra: make tegra_resume can work with current and later chips
Date: Tue, 8 Oct 2013 16:23:06 +0800
Message-ID: <1381220587-29697-4-git-send-email-josephl@nvidia.com>
References: <1381220587-29697-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381220587-29697-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Because the CPU0 was the first up and the last down core when cluster
power up/down or platform suspend. So only CPU0 needs the rest of the
functions to reset flow controller and re-enable SCU and L2. We also
move the L2 init function for Cortex-A15 to there. The secondery CPU
can just call cpu_resume.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/reset-handler.S | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S
index f527b2c..b63e69c 100644
--- a/arch/arm/mach-tegra/reset-handler.S
+++ b/arch/arm/mach-tegra/reset-handler.S
@@ -45,17 +45,11 @@
 ENTRY(tegra_resume)
 	check_cpu_part_num 0xc09, r8, r9
 	bleq	v7_invalidate_l1
-	blne	tegra_init_l2_for_a15
 
 	cpu_id	r0
-	tegra_get_soc_id TEGRA_APB_MISC_BASE, r6
-	cmp	r6, #TEGRA114
-	beq	no_cpu0_chk
-
 	cmp	r0, #0				@ CPU0?
  THUMB(	it	ne )
 	bne	cpu_resume			@ no
-no_cpu0_chk:
 
 	/* Are we on Tegra20? */
 	cmp	r6, #TEGRA20
@@ -87,6 +81,9 @@ no_cpu0_chk:
 	/* L2 cache resume & re-enable */
 	l2_cache_resume r0, r1, r2, l2x0_saved_regs_addr
 not_ca9:
+	mov32	r9, 0xc0f
+	cmp	r8, r9
+	bleq	tegra_init_l2_for_a15
 
 	b	cpu_resume
 ENDPROC(tegra_resume)
-- 
1.8.4
