From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 01/12] drm: Add a new mode flag: DRM_MODE_FLAG_PREFER_ONE_SHOT
Date: Mon, 11 May 2015 09:38:20 +0800
Message-ID: <1431308311-4470-2-git-send-email-markz@nvidia.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431308311-4470-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Normally this flag is set by panel driver so that crtc can enable
the "one-shot" mode(not scan frames continuously).

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/uapi/drm/drm_mode.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index dbeba949462a..5447a338e893 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -72,6 +72,7 @@
 #define  DRM_MODE_FLAG_3D_L_DEPTH_GFX_GFX_DEPTH	(6<<14)
 #define  DRM_MODE_FLAG_3D_TOP_AND_BOTTOM	(7<<14)
 #define  DRM_MODE_FLAG_3D_SIDE_BY_SIDE_HALF	(8<<14)
+#define DRM_MODE_FLAG_PREFER_ONE_SHOT		(1<<19)
 
 
 /* DPMS flags */
-- 
2.1.4
