From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 01/12] drm: panel: Add a new private mode flag: DRM_PANEL_FLAG_PREFER_ONE_SHOT
Date: Wed, 1 Jul 2015 16:21:44 +0800
Message-ID: <1435738915-31973-2-git-send-email-markz@nvidia.com>
References: <1435738915-31973-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435738915-31973-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Normally this flag is set by panel driver so that crtc can enable
the "one-shot" mode(not scan frames continuously).

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/drm/drm_panel.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 13ff44b28893..4d51cb380c75 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -26,6 +26,8 @@
 
 #include <linux/list.h>
 
+#define DRM_PANEL_FLAG_PREFER_ONE_SHOT		(1 << 0)
+
 struct drm_connector;
 struct drm_device;
 struct drm_panel;
-- 
1.7.9.5
