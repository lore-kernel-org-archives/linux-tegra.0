From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/5] ARM: Tegra: Rename clk_dev1/2 to cdev1/2
Date: Wed, 23 Feb 2011 11:58:50 -0700
Message-ID: <1298487532-5000-4-git-send-email-swarren@nvidia.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298487532-5000-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The ASoC machine driver was written assuming my previous patch to add
complete support for these clocks, which named them cdev1/2. Rename
the clocks to match that, to avoid churn in the ASoC driver.

This rename also makes the clocks more consistent with other Tegra
clocks irrespective of any of that.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
NOTE: This patch should apply right now.

 arch/arm/mach-tegra/tegra2_clocks.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index ee3f9d7..6d7c4ee 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -1823,8 +1823,8 @@ static struct clk tegra_clk_d = {
 };
 
 /* dap_mclk1, belongs to the cdev1 pingroup. */
-static struct clk tegra_dev1_clk = {
-	.name      = "clk_dev1",
+static struct clk tegra_clk_cdev1 = {
+	.name      = "cdev1",
 	.ops       = &tegra_cdev_clk_ops,
 	.rate      = 26000000,
 	.max_rate  = 26000000,
@@ -1834,8 +1834,8 @@ static struct clk tegra_dev1_clk = {
 };
 
 /* dap_mclk2, belongs to the cdev2 pingroup. */
-static struct clk tegra_dev2_clk = {
-	.name      = "clk_dev2",
+static struct clk tegra_clk_cdev2 = {
+	.name      = "cdev2",
 	.ops       = &tegra_cdev_clk_ops,
 	.rate      = 26000000,
 	.max_rate  = 26000000,
@@ -2276,8 +2276,8 @@ struct clk *tegra_ptr_clks[] = {
 	&tegra_clk_hclk,
 	&tegra_clk_pclk,
 	&tegra_clk_d,
-	&tegra_dev1_clk,
-	&tegra_dev2_clk,
+	&tegra_clk_cdev1,
+	&tegra_clk_cdev2,
 	&tegra_clk_virtual_cpu,
 	&tegra_clk_blink,
 	&tegra_clk_cop,
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
