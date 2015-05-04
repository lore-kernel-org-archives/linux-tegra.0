From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/8] soc/tegra: pmc: Restrict legacy code to 32-bit ARM
Date: Mon,  4 May 2015 13:46:39 +0200
Message-ID: <1430740006-29539-2-git-send-email-thierry.reding@gmail.com>
References: <1430740006-29539-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430740006-29539-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

For backwards-compatibility with old device trees, if no PMC node exists
this driver hard-codes the I/O memory region. All 64-bit ARM device tree
files are recent enough that they can be required to have this node, and
therefore the legacy code path is not required on 64-bit ARM.

Based on work done by Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 56 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index c956395cf46f..500339985dbe 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -17,6 +17,8 @@
  *
  */
 
+#define pr_fmt(fmt) "tegra-pmc: " fmt
+
 #include <linux/kernel.h>
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
@@ -992,6 +994,7 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 };
 
 static const struct of_device_id tegra_pmc_match[] = {
+	{ .compatible = "nvidia,tegra132-pmc", .data = &tegra124_pmc_soc },
 	{ .compatible = "nvidia,tegra124-pmc", .data = &tegra124_pmc_soc },
 	{ .compatible = "nvidia,tegra114-pmc", .data = &tegra114_pmc_soc },
 	{ .compatible = "nvidia,tegra30-pmc", .data = &tegra30_pmc_soc },
@@ -1024,25 +1027,44 @@ static int __init tegra_pmc_early_init(void)
 	bool invert;
 	u32 value;
 
-	if (!soc_is_tegra())
-		return 0;
-
 	np = of_find_matching_node_and_match(NULL, tegra_pmc_match, &match);
 	if (!np) {
-		pr_warn("PMC device node not found, disabling powergating\n");
-
-		regs.start = 0x7000e400;
-		regs.end = 0x7000e7ff;
-		regs.flags = IORESOURCE_MEM;
-
-		pr_warn("Using memory region %pR\n", &regs);
+		/*
+		 * Fall back to legacy initialization for 32-bit ARM only. All
+		 * 64-bit ARM device tree files for Tegra are required to have
+		 * a PMC node.
+		 *
+		 * This is for backwards-compatibility with old device trees
+		 * that didn't contain a PMC node. Note that in this case the
+		 * SoC data can't be matched and therefore powergating is
+		 * disabled.
+		 */
+		if (IS_ENABLED(CONFIG_ARM) && soc_is_tegra()) {
+			pr_warn("DT node not found, powergating disabled\n");
+
+			regs.start = 0x7000e400;
+			regs.end = 0x7000e7ff;
+			regs.flags = IORESOURCE_MEM;
+
+			pr_warn("Using memory region %pR\n", &regs);
+		} else {
+			/*
+			 * At this point we're not running on Tegra, so play
+			 * nice with multi-platform kernels.
+			 */
+			return 0;
+		}
 	} else {
-		pmc->soc = match->data;
-	}
+		/*
+		 * Extract information from the device tree if we've found a
+		 * matching node.
+		 */
+		if (of_address_to_resource(np, 0, &regs) < 0) {
+			pr_err("failed to get PMC registers\n");
+			return -ENXIO;
+		}
 
-	if (of_address_to_resource(np, 0, &regs) < 0) {
-		pr_err("failed to get PMC registers\n");
-		return -ENXIO;
+		pmc->soc = match->data;
 	}
 
 	pmc->base = ioremap_nocache(regs.start, resource_size(&regs));
@@ -1053,6 +1075,10 @@ static int __init tegra_pmc_early_init(void)
 
 	mutex_init(&pmc->powergates_lock);
 
+	/*
+	 * Invert the interrupt polarity if a PMC device tree node exists and
+	 * contains the nvidia,invert-interrupt property.
+	 */
 	invert = of_property_read_bool(np, "nvidia,invert-interrupt");
 
 	value = tegra_pmc_readl(PMC_CNTRL);
-- 
2.3.5
