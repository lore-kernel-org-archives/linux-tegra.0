From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] cloclsource: tegra: cosmetic: Fix error message
Date: Mon, 17 Dec 2012 08:33:24 +0200
Message-ID: <1355726004-16137-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add missing \n.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Based on Stephen's arm_timer_rework tree
---
 drivers/clocksource/tegra20_timer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index 3b2f947..5bc1429 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -179,7 +179,7 @@ static void __init tegra20_init_timer(void)
 
 	timer_reg_base = of_iomap(np, 0);
 	if (!timer_reg_base) {
-		pr_err("Can't map timer registers");
+		pr_err("Can't map timer registers\n");
 		BUG();
 	}
 
-- 
1.7.9.5
