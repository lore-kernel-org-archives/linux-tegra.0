From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 04/12] drm: Add DRM mode flag TE polarity
Date: Mon, 11 May 2015 09:38:23 +0800
Message-ID: <1431308311-4470-5-git-send-email-markz@nvidia.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431308311-4470-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add 2 DRM mode flag: TE polarity high/low.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/uapi/drm/drm_mode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 5447a338e893..b577cdfb76df 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -73,6 +73,8 @@
 #define  DRM_MODE_FLAG_3D_TOP_AND_BOTTOM	(7<<14)
 #define  DRM_MODE_FLAG_3D_SIDE_BY_SIDE_HALF	(8<<14)
 #define DRM_MODE_FLAG_PREFER_ONE_SHOT		(1<<19)
+#define DRM_MODE_FLAG_TE_POLARITY_HIGH		(1<<20)
+#define DRM_MODE_FLAG_TE_POLARITY_LOW		(1<<21)
 
 
 /* DPMS flags */
-- 
2.1.4
