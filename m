From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] soc/tegra: pmc: Add Tegra132 support
Date: Fri,  9 Jan 2015 11:15:33 +0100
Message-ID: <1420798533-4036-1-git-send-email-thierry.reding@gmail.com>
References: <1420701657-32543-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420701657-32543-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra132 uses the same GPU as Tegra124 and therefore requires the same
method to remove clamps. However Tegra132 has a separate chip ID, so in
order to avoid having to extend the list of chip IDs for the special
case, add a feature flag to the SoC data.

Reviewed-by: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- reword the commit message to be less misleading (Paul Walmsley)

 drivers/soc/tegra/pmc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 4bdc654bd747..0f096e76574a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -88,6 +88,8 @@ struct tegra_pmc_soc {
 	const char *const *powergates;
 	unsigned int num_cpu_powergates;
 	const u8 *cpu_powergates;
+
+	bool has_gpu_clamps;
 };
 
 /**
@@ -225,11 +227,11 @@ int tegra_powergate_remove_clamping(int id)
 		return -EINVAL;
 
 	/*
-	 * The Tegra124 GPU has a separate register (with different semantics)
-	 * to remove clamps.
+	 * On Tegra124 and later, the clamps for the GPU are controlled by a
+	 * separate register (with different semantics).
 	 */
-	if (tegra_get_chip_id() == TEGRA124) {
-		if (id == TEGRA_POWERGATE_3D) {
+	if (id == TEGRA_POWERGATE_3D) {
+		if (pmc->soc->has_gpu_clamps) {
 			tegra_pmc_writel(0, GPU_RG_CNTRL);
 			return 0;
 		}
@@ -773,6 +775,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.powergates = tegra20_powergates,
 	.num_cpu_powergates = 0,
 	.cpu_powergates = NULL,
+	.has_gpu_clamps = false,
 };
 
 static const char * const tegra30_powergates[] = {
@@ -804,6 +807,7 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 	.powergates = tegra30_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra30_cpu_powergates),
 	.cpu_powergates = tegra30_cpu_powergates,
+	.has_gpu_clamps = false,
 };
 
 static const char * const tegra114_powergates[] = {
@@ -839,6 +843,7 @@ static const struct tegra_pmc_soc tegra114_pmc_soc = {
 	.powergates = tegra114_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra114_cpu_powergates),
 	.cpu_powergates = tegra114_cpu_powergates,
+	.has_gpu_clamps = false,
 };
 
 static const char * const tegra124_powergates[] = {
@@ -880,6 +885,7 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.powergates = tegra124_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra124_cpu_powergates),
 	.cpu_powergates = tegra124_cpu_powergates,
+	.has_gpu_clamps = true,
 };
 
 static const struct of_device_id tegra_pmc_match[] = {
-- 
2.1.3
