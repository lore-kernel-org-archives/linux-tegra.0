From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 02/12] drm: panel: Add one-shot flag to Sharp lq101r1sx01 driver
Date: Mon, 11 May 2015 09:38:21 +0800
Message-ID: <1431308311-4470-3-git-send-email-markz@nvidia.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431308311-4470-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Sharp lq101r1sx01 has internal framebuffer so it doesn't
require crtc sending frames to it continuously.
So set the one-shot flag in the driver.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 3cce3ca19601..19a67d2598c0 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -283,6 +283,7 @@ static const struct drm_display_mode default_mode = {
 	.vsync_start = 1600 + 4,
 	.vsync_end = 1600 + 4 + 8,
 	.vtotal = 1600 + 4 + 8 + 32,
+	.flags = DRM_MODE_FLAG_PREFER_ONE_SHOT,
 	.vrefresh = 60,
 };
 
-- 
2.1.4
