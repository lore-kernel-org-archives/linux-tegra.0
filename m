From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/6] clk: tegra: make tegra_clocks_apply_init_table arch_initcall
Date: Tue, 15 Jul 2014 18:24:32 +0300
Message-ID: <1405437890-6468-3-git-send-email-pdeschrijver@nvidia.com>
References: <1405437890-6468-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405437890-6468-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

tegra_clocks_apply_init_table needs to be called after the udelay loop has
been calibrated (see 441f199a37cfd66c5dd8dd45490bd3ea6971117d why that is).
On existing Tegra SoCs this was done by calling tegra_clocks_apply_init_table
from tegra_dt_init. To make this also work on ARM64, we need to
change this into an initcall. tegra_dt_init is called from customize_machine
which is an arch_initcall. Therefore this should also work on existing 32bit
Tegra SoCs.

Tested on Tegra20 (ventana), Tegra30 (beaverboard), Tegra124 (jetson TK1) and
Tegra132.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra.c |    3 ---
 drivers/clk/tegra/clk.c     |    7 +++++--
 include/linux/clk/tegra.h   |    2 --
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 15ac9fc..6c5cad5 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -32,7 +32,6 @@
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 #include <linux/usb/tegra_usb_phy.h>
-#include <linux/clk/tegra.h>
 #include <linux/irqchip.h>
 
 #include <asm/hardware/cache-l2x0.h>
@@ -96,8 +95,6 @@ static void __init tegra_dt_init(void)
 
 	tegra_pmc_init();
 
-	tegra_clocks_apply_init_table();
-
 	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
 		goto out;
diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index d081732..65cde4e 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -290,10 +290,13 @@ struct clk ** __init tegra_lookup_dt_id(int clk_id,
 
 tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
 
-void __init tegra_clocks_apply_init_table(void)
+static int __init tegra_clocks_apply_init_table(void)
 {
 	if (!tegra_clk_apply_init_table)
-		return;
+		return 0;
 
 	tegra_clk_apply_init_table();
+
+	return 0;
 }
+arch_initcall(tegra_clocks_apply_init_table);
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 3ca9fca..19c4208 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -120,6 +120,4 @@ static inline void tegra_cpu_clock_resume(void)
 }
 #endif
 
-void tegra_clocks_apply_init_table(void);
-
 #endif /* __LINUX_CLK_TEGRA_H_ */
-- 
1.7.7.rc0.72.g4b5ea.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
