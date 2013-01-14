From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Mon, 14 Jan 2013 17:06:00 +0100
Message-ID: <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358179560-26799-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

All the necessary support bits like .mode_set_base() and VBLANK are now
available, so page-flipping case easily be implemented on top.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c  | 72 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/drm.c |  9 ++++++
 drivers/gpu/drm/tegra/drm.h |  5 ++++
 3 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 3aa7ccc..ce4e14a 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -161,7 +161,78 @@ void tegra_dc_disable_vblank(struct tegra_dc *dc)
 	spin_unlock_irqrestore(&dc->lock, flags);
 }
 
+static void tegra_dc_finish_page_flip(struct tegra_dc *dc)
+{
+	struct drm_pending_vblank_event *event;
+	struct drm_device *drm = dc->base.dev;
+	unsigned long flags;
+	struct timeval now;
+
+	spin_lock_irqsave(&drm->event_lock, flags);
+	event = dc->event;
+	dc->event = NULL;
+	spin_unlock_irqrestore(&drm->event_lock, flags);
+
+	if (!event)
+		return;
+
+	event->event.sequence = drm_vblank_count_and_time(drm, dc->pipe, &now);
+	event->event.tv_sec = now.tv_sec;
+	event->event.tv_usec = now.tv_usec;
+
+	spin_lock_irqsave(&drm->event_lock, flags);
+	list_add_tail(&event->base.link, &event->base.file_priv->event_list);
+	wake_up_interruptible(&event->base.file_priv->event_wait);
+	spin_unlock_irqrestore(&drm->event_lock, flags);
+
+	drm_vblank_put(drm, dc->pipe);
+}
+
+void tegra_dc_cancel_page_flip(struct drm_crtc *crtc, struct drm_file *file)
+{
+	struct tegra_dc *dc = to_tegra_dc(crtc);
+	struct drm_device *drm = crtc->dev;
+	unsigned long flags;
+
+	spin_lock_irqsave(&drm->event_lock, flags);
+
+	if (dc->event && dc->event->base.file_priv == file) {
+		dc->event->base.destroy(&dc->event->base);
+		drm_vblank_put(drm, dc->pipe);
+		dc->event = NULL;
+	}
+
+	spin_unlock_irqrestore(&drm->event_lock, flags);
+}
+
+static int tegra_dc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
+			      struct drm_pending_vblank_event *event)
+{
+	struct tegra_framebuffer *newfb = to_tegra_fb(fb);
+	struct tegra_dc *dc = to_tegra_dc(crtc);
+	struct drm_device *drm = crtc->dev;
+	unsigned long flags;
+
+	if (dc->event)
+		return -EBUSY;
+
+	tegra_dc_set_base(dc, 0, 0, newfb);
+
+	if (event) {
+		event->pipe = dc->pipe;
+
+		spin_lock_irqsave(&drm->event_lock, flags);
+		dc->event = event;
+		spin_unlock_irqrestore(&drm->event_lock, flags);
+
+		drm_vblank_get(drm, dc->pipe);
+	}
+
+	return 0;
+}
+
 static const struct drm_crtc_funcs tegra_crtc_funcs = {
+	.page_flip = tegra_dc_page_flip,
 	.set_config = drm_crtc_helper_set_config,
 	.destroy = drm_crtc_cleanup,
 };
@@ -556,6 +627,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		dev_dbg(dc->dev, "%s(): vertical blank\n", __func__);
 		*/
 		drm_handle_vblank(dc->base.dev, dc->pipe);
+		tegra_dc_finish_page_flip(dc);
 	}
 
 	if (status & (WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT)) {
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 62f8121..7bab784 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -129,11 +129,20 @@ static void tegra_drm_disable_vblank(struct drm_device *drm, int pipe)
 		tegra_dc_disable_vblank(dc);
 }
 
+static void tegra_drm_preclose(struct drm_device *drm, struct drm_file *file)
+{
+	struct drm_crtc *crtc;
+
+	list_for_each_entry(crtc, &drm->mode_config.crtc_list, head)
+		tegra_dc_cancel_page_flip(crtc, file);
+}
+
 struct drm_driver tegra_drm_driver = {
 	.driver_features = DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GEM,
 	.load = tegra_drm_load,
 	.unload = tegra_drm_unload,
 	.open = tegra_drm_open,
+	.preclose = tegra_drm_preclose,
 	.lastclose = tegra_drm_lastclose,
 
 	.get_vblank_counter = drm_vblank_count,
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index ca742b2..1f1cb37 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -100,6 +100,9 @@ struct tegra_dc {
 	struct drm_info_list *debugfs_files;
 	struct drm_minor *minor;
 	struct dentry *debugfs;
+
+	/* page-flip handling */
+	struct drm_pending_vblank_event *event;
 };
 
 static inline struct tegra_dc *host1x_client_to_dc(struct host1x_client *client)
@@ -149,6 +152,8 @@ extern int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 				 const struct tegra_dc_window *window);
 extern void tegra_dc_enable_vblank(struct tegra_dc *dc);
 extern void tegra_dc_disable_vblank(struct tegra_dc *dc);
+extern void tegra_dc_cancel_page_flip(struct drm_crtc *crtc,
+				      struct drm_file *file);
 
 struct tegra_output_ops {
 	int (*enable)(struct tegra_output *output);
-- 
1.8.1
