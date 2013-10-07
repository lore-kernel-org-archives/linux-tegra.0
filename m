From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 24/27] drm/tegra: Start connectors with correct DPMS mode
Date: Mon,  7 Oct 2013 10:34:41 +0200
Message-ID: <1381134884-5816-25-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

A connector's DPMS mode isn't initialized by default, therefore using a
default of 0 (DRM_MODE_DPMS_ON). This can cause problems in that the DRM
core won't explicitly turn on a connector because it thinks that it is
already on.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note that it would probably make sense to do this in the core, but after
some discussion on IRC it became clear that other drivers (specifically
i915) use similar workarounds and moving this to the core may cause them
to regress.

 drivers/gpu/drm/tegra/output.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index be6ef34..d911fe8 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -264,6 +264,7 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 	drm_connector_init(drm, &output->connector, &connector_funcs,
 			   connector);
 	drm_connector_helper_add(&output->connector, &connector_helper_funcs);
+	output->connector.dpms = DRM_MODE_DPMS_OFF;
 
 	if (output->panel)
 		drm_panel_attach(output->panel, &output->connector);
-- 
1.8.4
