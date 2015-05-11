From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 08/12] drm/panel: Add panel func: idle/busy
Date: Mon, 11 May 2015 09:38:27 +0800
Message-ID: <1431308311-4470-9-git-send-email-markz@nvidia.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431308311-4470-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The "idle" function of a drm panel is used to tell panel
there are no more frames coming in and it should remain the
last frame it gets.
Normally this only makes sense for smart panels which has
internal framebuffer.

The "busy" function is opposite to "idle".

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/drm/drm_panel.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 13ff44b28893..0025cd020c40 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -66,6 +66,8 @@ struct display_timing;
  * the panel. This is the job of the .unprepare() function.
  */
 struct drm_panel_funcs {
+	int (*idle)(struct drm_panel *panel);
+	int (*busy)(struct drm_panel *panel);
 	int (*disable)(struct drm_panel *panel);
 	int (*unprepare)(struct drm_panel *panel);
 	int (*prepare)(struct drm_panel *panel);
@@ -85,6 +87,22 @@ struct drm_panel {
 	struct list_head list;
 };
 
+static inline int drm_panel_idle(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->idle)
+		return panel->funcs->idle(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+
+static inline int drm_panel_busy(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->busy)
+		return panel->funcs->busy(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+
 static inline int drm_panel_unprepare(struct drm_panel *panel)
 {
 	if (panel && panel->funcs && panel->funcs->unprepare)
-- 
2.1.4
