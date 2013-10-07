From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 27/27] drm/tegra: Add Tegra114 gr2d support
Date: Mon,  7 Oct 2013 10:34:44 +0200
Message-ID: <1381134884-5816-28-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The gr2d hardware in Tegra114 is compatible with that of Tegra20 and
Tegra30. No functionaly changes are required.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c  | 1 +
 drivers/gpu/drm/tegra/gr2d.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index d95be81..b9e0977 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -492,6 +492,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra114-dc", },
 	{ .compatible = "nvidia,tegra114-dsi", },
 	{ .compatible = "nvidia,tegra114-hdmi", },
+	{ .compatible = "nvidia,tegra114-gr2d", },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 9588072..f4e478b 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -232,6 +232,7 @@ static const struct tegra_drm_client_ops gr2d_ops = {
 };
 
 static const struct of_device_id gr2d_match[] = {
+	{ .compatible = "nvidia,tegra114-gr2d" },
 	{ .compatible = "nvidia,tegra30-gr2d" },
 	{ .compatible = "nvidia,tegra20-gr2d" },
 	{ },
-- 
1.8.4
