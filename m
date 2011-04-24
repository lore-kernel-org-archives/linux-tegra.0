From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ARM: Tegra: dt: Compile fix; tegra_common_init removed
Date: Sat, 23 Apr 2011 22:30:02 -0600
Message-ID: <1303619404-27604-2-git-send-email-swarren@nvidia.com>
References: <1303619404-27604-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303619404-27604-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

tegra_common_init was removed by:
  0cf6230af909a86f81907455eca2a5c9b8f68fe6
  ARM: tegra: Move tegra_common_init to tegra_init_early

Fix the Tegra devicetree support to match.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index bc9777e..899311b 100644
--- a/arch/arm/mach-tegra/board-dt.c
+++ b/arch/arm/mach-tegra/board-dt.c
@@ -156,8 +156,6 @@ static void __init tegra_dt_init(void)
 	 */
 	of_platform_prepare(NULL, tegra_dt_match_table);
 
-	tegra_common_init();
-
 	tegra_clk_init_from_table(tegra_dt_clk_init_table);
 
 	harmony_pinmux_init();
-- 
1.7.1
