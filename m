From: Todd Poynor <toddpoynor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: Enable PL310 dynamic clock gating
Date: Wed, 23 Feb 2011 15:36:04 -0800
Message-ID: <1298504164-17802-1-git-send-email-toddpoynor@google.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Todd Poynor <toddpoynor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The cache controller will stop its clock when idle after several
clock cycles.

Signed-off-by: Todd Poynor <toddpoynor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
Note Tegra 2 does not also support PL310 standby mode.

 arch/arm/mach-tegra/common.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
index 516e100..d73b41e 100644
--- a/arch/arm/mach-tegra/common.c
+++ b/arch/arm/mach-tegra/common.c
@@ -69,6 +69,7 @@ void __init tegra_init_cache(void)
 
 	writel_relaxed(0x331, p + L2X0_TAG_LATENCY_CTRL);
 	writel_relaxed(0x441, p + L2X0_DATA_LATENCY_CTRL);
+	writel_relaxed(L2X0_DYNAMIC_CLK_GATING_EN, p + L2X0_POWER_CTRL);
 
 	l2x0_init(p, 0x6C080001, 0x8200c3fe);
 #endif
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
