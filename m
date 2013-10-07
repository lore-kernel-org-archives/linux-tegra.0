From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 20/27] drm/tegra: hdmi: Rename tegra{2,3} to tegra{20,30}
Date: Mon,  7 Oct 2013 10:34:37 +0200
Message-ID: <1381134884-5816-21-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Everything related to Tegra uses Tegra20 and Tegra30 instead of Tegra2
and Tegra3, respectively. Rename the TMDS arrays in the HDMI driver for
consistency.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/hdmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 9bd912c..68ab00d 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -145,7 +145,7 @@ struct tmds_config {
 	u32 peak_current;
 };
 
-static const struct tmds_config tegra2_tmds_config[] = {
+static const struct tmds_config tegra20_tmds_config[] = {
 	{ /* slow pixel clock modes */
 		.pclk = 27000000,
 		.pll0 = SOR_PLL_BG_V17_S(3) | SOR_PLL_ICHPMP(1) |
@@ -178,7 +178,7 @@ static const struct tmds_config tegra2_tmds_config[] = {
 	},
 };
 
-static const struct tmds_config tegra3_tmds_config[] = {
+static const struct tmds_config tegra30_tmds_config[] = {
 	{ /* 480p modes */
 		.pclk = 27000000,
 		.pll0 = SOR_PLL_BG_V17_S(3) | SOR_PLL_ICHPMP(1) |
@@ -807,11 +807,11 @@ static int tegra_output_hdmi_enable(struct tegra_output *output)
 		num_tmds = ARRAY_SIZE(tegra114_tmds_config);
 		tmds = tegra114_tmds_config;
 	} else if (of_device_is_compatible(node, "nvidia,tegra30-hdmi")) {
-		num_tmds = ARRAY_SIZE(tegra3_tmds_config);
-		tmds = tegra3_tmds_config;
+		num_tmds = ARRAY_SIZE(tegra30_tmds_config);
+		tmds = tegra30_tmds_config;
 	} else {
-		num_tmds = ARRAY_SIZE(tegra2_tmds_config);
-		tmds = tegra2_tmds_config;
+		num_tmds = ARRAY_SIZE(tegra20_tmds_config);
+		tmds = tegra20_tmds_config;
 	}
 
 	for (i = 0; i < num_tmds; i++) {
-- 
1.8.4
