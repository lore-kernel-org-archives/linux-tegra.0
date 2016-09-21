From: Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] clocksource: tegra20_timer: Unmap region obtained by of_iomap
Date: Wed, 21 Sep 2016 21:23:35 +0530
Message-ID: <1474473215-8553-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Free memory mapping, if tegra20_init_timer is not successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clocksource/tegra20_timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index f960891..adcd7f4 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -180,6 +180,7 @@ static int __init tegra20_init_timer(struct device_node *np)
 	tegra_timer_irq.irq = irq_of_parse_and_map(np, 2);
 	if (tegra_timer_irq.irq <= 0) {
 		pr_err("Failed to map timer IRQ\n");
+		iounmap(timer_reg_base);
 		return -EINVAL;
 	}
 
@@ -216,6 +217,7 @@ static int __init tegra20_init_timer(struct device_node *np)
 				    clocksource_mmio_readl_up);
 	if (ret) {
 		pr_err("Failed to register clocksource\n");
+		iounmap(timer_reg_base);
 		return ret;
 	}
 
@@ -227,6 +229,7 @@ static int __init tegra20_init_timer(struct device_node *np)
 	ret = setup_irq(tegra_timer_irq.irq, &tegra_timer_irq);
 	if (ret) {
 		pr_err("Failed to register timer IRQ: %d\n", ret);
+		iounmap(timer_reg_base);
 		return ret;
 	}
 
-- 
2.7.4
