From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] drm/tegra: Fix possible CRTC mask for RGB outputs
Date: Mon, 13 Jan 2014 15:21:33 +0100
Message-ID: <1389622894-9574-2-git-send-email-treding@nvidia.com>
References: <1389622894-9574-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389622894-9574-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The mask of possible CRTCs that an output (DRM encoder) can be attached
to is relative to the position within the DRM device's list of CRTCs.
Deferred probing can cause this to not match the pipe number associated
with a CRTC. Use the newly introduced drm_crtc_mask() to compute the
mask by looking up the proper index of the given CRTC in the list.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/rgb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 03885bb8dcc0..338f7f6561d7 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -258,7 +258,7 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	 * RGB outputs are an exception, so we make sure they can be attached
 	 * to only their parent display controller.
 	 */
-	rgb->output.encoder.possible_crtcs = 1 << dc->pipe;
+	rgb->output.encoder.possible_crtcs = drm_crtc_mask(&dc->base);
 
 	return 0;
 }
-- 
1.8.4.2
