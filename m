From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] soc: tegra: pmc: restrict compilation of suspend-related
 support to ARM
Date: Tue, 9 Dec 2014 22:36:50 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1412092224050.31750@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


Tegra SoCs with 64-bit ARM support don't currently support deep CPU
low-power states in mainline Linux.  When this support is added in the
future, it will probably look rather different from the existing
32-bit ARM support, since the ARM64 maintainers' strong preference is
to use PSCI to implement it.

So, for the time being, prevent the CPU suspend-related code and data
in the Tegra PMC driver from compiling on ARM64.

Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Applies on next-20141209.
Intended for v3.20.
Boot-tested on Tegra124 Jetson TK1 on next-20141209.
Also boot-tested on Tegra132 Norrin FFD on next-20141209 + some unrelated 
patches.

 drivers/soc/tegra/pmc.c | 7 +++++--
 include/soc/tegra/pm.h  | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index a2c0ceb95f8f..4bdc654bd747 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -739,7 +739,7 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
+#if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM)
 static int tegra_pmc_suspend(struct device *dev)
 {
 	tegra_pmc_writel(virt_to_phys(tegra_resume), PMC_SCRATCH41);
@@ -753,10 +753,11 @@ static int tegra_pmc_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(tegra_pmc_pm_ops, tegra_pmc_suspend, tegra_pmc_resume);
 
+#endif
+
 static const char * const tegra20_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "cpu",
 	[TEGRA_POWERGATE_3D] = "3d",
@@ -894,7 +895,9 @@ static struct platform_driver tegra_pmc_driver = {
 		.name = "tegra-pmc",
 		.suppress_bind_attrs = true,
 		.of_match_table = tegra_pmc_match,
+#if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM)
 		.pm = &tegra_pmc_pm_ops,
+#endif
 	},
 	.probe = tegra_pmc_probe,
 };
diff --git a/include/soc/tegra/pm.h b/include/soc/tegra/pm.h
index 30fe2078a547..03909101d4e7 100644
--- a/include/soc/tegra/pm.h
+++ b/include/soc/tegra/pm.h
@@ -17,7 +17,7 @@ enum tegra_suspend_mode {
 	TEGRA_MAX_SUSPEND_MODE,
 };
 
-#ifdef CONFIG_PM_SLEEP
+#if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM)
 enum tegra_suspend_mode
 tegra_pm_validate_suspend_mode(enum tegra_suspend_mode mode);
 
-- 
2.1.3
