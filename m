From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 04/12] drm: panel: Add DRM panel private mode flag: TE polarity
Date: Wed, 1 Jul 2015 16:21:47 +0800
Message-ID: <1435738915-31973-5-git-send-email-markz@nvidia.com>
References: <1435738915-31973-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435738915-31973-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add 2 DRM panel private mode flag: TE polarity high/low.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/drm/drm_panel.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 4d51cb380c75..e53f48aa070f 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -27,6 +27,8 @@
 #include <linux/list.h>
 
 #define DRM_PANEL_FLAG_PREFER_ONE_SHOT		(1 << 0)
+#define DRM_PANEL_FLAG_TE_POLARITY_HIGH		(1 << 1)
+#define DRM_PANEL_FLAG_TE_POLARITY_LOW		(1 << 2)
 
 struct drm_connector;
 struct drm_device;
-- 
1.7.9.5
