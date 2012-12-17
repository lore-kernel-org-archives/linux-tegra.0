From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v2 1/1] clocksource: tegra: cosmetic: Fix error message
Date: Mon, 17 Dec 2012 13:35:23 +0200
Message-ID: <1355744123-27666-1-git-send-email-hdoyu@nvidia.com>
References: <20121217093230.GE19258@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121217093230.GE19258-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add missing \n.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Update: Fix misspelling in the subject line
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
