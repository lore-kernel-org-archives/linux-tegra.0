From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 54/97] ARM: l2c: tegra: remove associativity and way size from
 aux_ctrl
Date: Mon, 28 Apr 2014 20:30:47 +0100
Message-ID: <E1WerGJ-0001XP-TI@rmk-PC.arm.linux.org.uk>
References: <20140428192419.GV26756@n2100.arm.linux.org.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140428192419.GV26756-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-0qwDCntBQCZpWr+L1FloEB2eb7JE58TQ@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/mach-tegra/tegra.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index ecbb5411a104..fb802e24b647 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -73,25 +73,9 @@ u32 tegra_uart_config[3] = {
 static void __init tegra_init_cache(void)
 {
 #ifdef CONFIG_CACHE_L2X0
-	static const struct of_device_id pl310_ids[] __initconst = {
-		{ .compatible = "arm,pl310-cache",  },
-		{}
-	};
-
-	struct device_node *np;
 	int ret;
-	void __iomem *p = IO_ADDRESS(TEGRA_ARM_PERIF_BASE) + 0x3000;
-	u32 aux_ctrl, cache_type;
-
-	np = of_find_matching_node(NULL, pl310_ids);
-	if (!np)
-		return;
-
-	cache_type = readl(p + L2X0_CACHE_TYPE);
-	aux_ctrl = (cache_type & 0x700) << (17-8);
-	aux_ctrl |= 0x3c400001;
 
-	ret = l2x0_of_init(aux_ctrl, 0xc200c3fe);
+	ret = l2x0_of_init(0x3c400001, 0xc20fc3fe);
 	if (!ret)
 		l2x0_saved_regs_addr = virt_to_phys(&l2x0_saved_regs);
 #endif
-- 
1.8.3.1
