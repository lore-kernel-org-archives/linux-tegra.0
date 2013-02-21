From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v4 6/9] drm/tegra: Implement page-flipping support
Date: Thu, 21 Feb 2013 15:35:58 +0100
Message-ID: <1361457361-13838-7-git-send-email-thierry.reding@avionic-design.de>
References: <1361457361-13838-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361457361-13838-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

All the necessary support bits like .mode_set_base() and VBLANK are now
available, so page-flipping case easily be implemented on top.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changes in v3:
- use drm_send_vblank_event()
- set crtc->fb field

Changes in v4:
- fix a potential race by checking that a framebuffer base has been
  latched when completing a page-flip

 drivers/gpu/drm/tegra/dc.c  | 66 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.h  |  2 ++
 drivers/gpu/drm/tegra/drm.c |  9 +++++++
 drivers/gpu/drm/tegra/drm.h |  5 ++++
 4 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 5f55a25..c5d825f 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -183,7 +183,72 @@ void tegra_dc_disable_vblank(struct tegra_dc *dc)
 	spin_unlock_irqrestore(&dc->lock, flags);
 }
 
+static void tegra_dc_finish_page_flip(struct tegra_dc *dc)
+{
+	struct drm_device *drm = dc->base.dev;
+	struct drm_crtc *crtc = &dc->base;
+	struct drm_gem_cma_object *gem;
+	unsigned long flags, base;
+
+	if (!dc->event)
+		return;
+
+	gem = drm_fb_cma_get_gem_obj(crtc->fb, 0);
+
+	/* check if new start address has been latched */
+	tegra_dc_writel(dc, READ_MUX, DC_CMD_STATE_ACCESS);
+	base = tegra_dc_readl(dc, DC_WINBUF_START_ADDR);
+	tegra_dc_writel(dc, 0, DC_CMD_STATE_ACCESS);
+
+	if (base == gem->paddr + crtc->fb->offsets[0]) {
+		spin_lock_irqsave(&drm->event_lock, flags);
+		drm_send_vblank_event(drm, dc->pipe, dc->event);
+		drm_vblank_put(drm, dc->pipe);
+		dc->event = NULL;
+		spin_unlock_irqrestore(&drm->event_lock, flags);
+	}
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
+	struct tegra_dc *dc = to_tegra_dc(crtc);
+	struct drm_device *drm = crtc->dev;
+
+	if (dc->event)
+		return -EBUSY;
+
+	if (event) {
+		event->pipe = dc->pipe;
+		dc->event = event;
+		drm_vblank_get(drm, dc->pipe);
+	}
+
+	tegra_dc_set_base(dc, 0, 0, fb);
+	crtc->fb = fb;
+
+	return 0;
+}
+
 static const struct drm_crtc_funcs tegra_crtc_funcs = {
+	.page_flip = tegra_dc_page_flip,
 	.set_config = drm_crtc_helper_set_config,
 	.destroy = drm_crtc_cleanup,
 };
@@ -665,6 +730,7 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		dev_dbg(dc->dev, "%s(): vertical blank\n", __func__);
 		*/
 		drm_handle_vblank(dc->base.dev, dc->pipe);
+		tegra_dc_finish_page_flip(dc);
 	}
 
 	if (status & (WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT)) {
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index e2fa328..79eaec9 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -58,6 +58,8 @@
 #define DC_CMD_SIGNAL_RAISE3			0x03e
 
 #define DC_CMD_STATE_ACCESS			0x040
+#define READ_MUX  (1 << 0)
+#define WRITE_MUX (1 << 2)
 
 #define DC_CMD_STATE_CONTROL			0x041
 #define GENERAL_ACT_REQ (1 <<  0)
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4e31dac..97485af 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -135,11 +135,20 @@ static void tegra_drm_disable_vblank(struct drm_device *drm, int pipe)
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
 
 	.get_vblank_counter = tegra_drm_get_vblank_counter,
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 01f0aee..6dd75a2 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -84,6 +84,9 @@ struct tegra_dc {
 	struct drm_info_list *debugfs_files;
 	struct drm_minor *minor;
 	struct dentry *debugfs;
+
+	/* page-flip handling */
+	struct drm_pending_vblank_event *event;
 };
 
 static inline struct tegra_dc *host1x_client_to_dc(struct host1x_client *client)
@@ -133,6 +136,8 @@ extern int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 				 const struct tegra_dc_window *window);
 extern void tegra_dc_enable_vblank(struct tegra_dc *dc);
 extern void tegra_dc_disable_vblank(struct tegra_dc *dc);
+extern void tegra_dc_cancel_page_flip(struct drm_crtc *crtc,
+				      struct drm_file *file);
 
 struct tegra_output_ops {
 	int (*enable)(struct tegra_output *output);
-- 
1.8.1.2
