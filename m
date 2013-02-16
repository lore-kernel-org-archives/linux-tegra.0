From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/6] ASoC: tegra: assume CONFIG_OF in tegra_asoc_utils_init
Date: Fri, 15 Feb 2013 17:07:30 -0700
Message-ID: <1360973255-344-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra only supports, and always enables, device tree. Remove all runtime
checks for DT support from the driver.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_asoc_utils.c |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index ba419f8..49861c6 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -176,11 +176,7 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA20;
 	else if (of_machine_is_compatible("nvidia,tegra30"))
 		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA30;
-	else if (!dev->of_node)
-		/* non-DT is always Tegra20 */
-		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA20;
 	else
-		/* DT boot, but unknown SoC */
 		return -EINVAL;
 
 	data->clk_pll_a = clk_get_sys(NULL, "pll_a");
-- 
1.7.10.4
