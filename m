From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 09/10] clk: tegra: make clk-tegra124-dfll-fcpu explicitly non-modular
Date: Mon, 4 Jul 2016 17:12:19 -0400
Message-ID: <20160704211220.5685-10-paul.gortmaker@windriver.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160704211220.5685-1-paul.gortmaker@windriver.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Aleksandr Frid <afrid@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

arch/arm/mach-tegra/Kconfig:config ARCH_TEGRA_124_SOC
arch/arm/mach-tegra/Kconfig:    bool "Enable support for Tegra124 family"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init translates to device_initcall in the non-modular
case, the init ordering remains unchanged with this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tags etc. since all that information
is already contained at the top of the file in the comments.

Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Aleksandr Frid <afrid@nvidia.com>
Cc: Paul Walmsley <pwalmsley@nvidia.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index c205809ba580..4301569d072a 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -20,7 +20,7 @@
 #include <linux/cpu.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 #include <soc/tegra/fuse.h>
 
@@ -148,7 +148,6 @@ static const struct of_device_id tegra124_dfll_fcpu_of_match[] = {
 	{ .compatible = "nvidia,tegra124-dfll", },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, tegra124_dfll_fcpu_of_match);
 
 static const struct dev_pm_ops tegra124_dfll_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_dfll_runtime_suspend,
@@ -169,15 +168,4 @@ static int __init tegra124_dfll_fcpu_init(void)
 {
 	return platform_driver_register(&tegra124_dfll_fcpu_driver);
 }
-module_init(tegra124_dfll_fcpu_init);
-
-static void __exit tegra124_dfll_fcpu_exit(void)
-{
-	platform_driver_unregister(&tegra124_dfll_fcpu_driver);
-}
-module_exit(tegra124_dfll_fcpu_exit);
-
-MODULE_DESCRIPTION("Tegra124 DFLL clock source driver");
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Aleksandr Frid <afrid@nvidia.com>");
-MODULE_AUTHOR("Paul Walmsley <pwalmsley@nvidia.com>");
+device_initcall(tegra124_dfll_fcpu_init);
-- 
2.8.4

