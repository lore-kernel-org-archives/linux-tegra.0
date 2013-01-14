From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 4/5] drm/tegra: Implement VBLANK support
Date: Mon, 14 Jan 2013 16:55:31 +0100
Message-ID: <1358178932-25505-5-git-send-email-thierry.reding@avionic-design.de>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358178932-25505-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Implement support for the VBLANK IOCTL. Note that Tegra is somewhat
special in this case because it doesn't use the generic IRQ support
provided by the DRM core (DRIVER_HAVE_IRQ) but rather registers one
interrupt handler for each display controller.

While at it, clean up the way that interrupts are enabled to ensure
that the VBLANK interrupt only gets enabled when required.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c  | 55 +++++++++++++++++++++++++++++++--------------
 drivers/gpu/drm/tegra/drm.c | 44 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/drm.h |  3 +++
 3 files changed, 85 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 8dd7d8a..3aa7ccc 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -135,6 +135,32 @@ static int tegra_dc_set_base(struct tegra_dc *dc, int x, int y,
 	return 0;
 }
 
+void tegra_dc_enable_vblank(struct tegra_dc *dc)
+{
+	unsigned long value, flags;
+
+	spin_lock_irqsave(&dc->lock, flags);
+
+	value = tegra_dc_readl(dc, DC_CMD_INT_MASK);
+	value |= VBLANK_INT;
+	tegra_dc_writel(dc, value, DC_CMD_INT_MASK);
+
+	spin_unlock_irqrestore(&dc->lock, flags);
+}
+
+void tegra_dc_disable_vblank(struct tegra_dc *dc)
+{
+	unsigned long value, flags;
+
+	spin_lock_irqsave(&dc->lock, flags);
+
+	value = tegra_dc_readl(dc, DC_CMD_INT_MASK);
+	value &= ~VBLANK_INT;
+	tegra_dc_writel(dc, value, DC_CMD_INT_MASK);
+
+	spin_unlock_irqrestore(&dc->lock, flags);
+}
+
 static const struct drm_crtc_funcs tegra_crtc_funcs = {
 	.set_config = drm_crtc_helper_set_config,
 	.destroy = drm_crtc_cleanup,
@@ -375,6 +401,8 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
 	unsigned long div, value;
 	int err;
 
+	drm_vblank_pre_modeset(crtc->dev, dc->pipe);
+
 	err = tegra_crtc_setup_clk(crtc, mode, &div);
 	if (err) {
 		dev_err(dc->dev, "failed to setup clock for CRTC: %d\n", err);
@@ -476,31 +504,23 @@ static void tegra_crtc_prepare(struct drm_crtc *crtc)
 	tegra_dc_writel(dc, value, DC_DISP_DISP_MEM_HIGH_PRIORITY_TIMER);
 
 	value = VBLANK_INT | WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT;
-	tegra_dc_writel(dc, value, DC_CMD_INT_MASK);
-
-	value = VBLANK_INT | WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT;
 	tegra_dc_writel(dc, value, DC_CMD_INT_ENABLE);
+
+	value = WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT;
+	tegra_dc_writel(dc, value, DC_CMD_INT_MASK);
 }
 
 static void tegra_crtc_commit(struct drm_crtc *crtc)
 {
 	struct tegra_dc *dc = to_tegra_dc(crtc);
-	unsigned long update_mask;
 	unsigned long value;
 
-	update_mask = GENERAL_ACT_REQ | WIN_A_ACT_REQ;
-
-	tegra_dc_writel(dc, update_mask << 8, DC_CMD_STATE_CONTROL);
-
-	value = tegra_dc_readl(dc, DC_CMD_INT_ENABLE);
-	value |= FRAME_END_INT;
-	tegra_dc_writel(dc, value, DC_CMD_INT_ENABLE);
+	value = GENERAL_ACT_REQ | WIN_A_ACT_REQ |
+		GENERAL_UPDATE | WIN_A_UPDATE;
 
-	value = tegra_dc_readl(dc, DC_CMD_INT_MASK);
-	value |= FRAME_END_INT;
-	tegra_dc_writel(dc, value, DC_CMD_INT_MASK);
+	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
 
-	tegra_dc_writel(dc, update_mask, DC_CMD_STATE_CONTROL);
+	drm_vblank_post_modeset(crtc->dev, dc->pipe);
 }
 
 static void tegra_crtc_load_lut(struct drm_crtc *crtc)
@@ -517,7 +537,7 @@ static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
 	.load_lut = tegra_crtc_load_lut,
 };
 
-static irqreturn_t tegra_drm_irq(int irq, void *data)
+static irqreturn_t tegra_dc_irq(int irq, void *data)
 {
 	struct tegra_dc *dc = data;
 	unsigned long status;
@@ -862,7 +882,7 @@ static int tegra_dc_drm_init(struct host1x_client *client,
 			dev_err(dc->dev, "debugfs setup failed: %d\n", err);
 	}
 
-	err = devm_request_irq(dc->dev, dc->irq, tegra_drm_irq, 0,
+	err = devm_request_irq(dc->dev, dc->irq, tegra_dc_irq, 0,
 			       dev_name(dc->dev), dc);
 	if (err < 0) {
 		dev_err(dc->dev, "failed to request IRQ#%u: %d\n", dc->irq,
@@ -911,6 +931,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	if (!dc)
 		return -ENOMEM;
 
+	spin_lock_init(&dc->lock);
 	INIT_LIST_HEAD(&dc->list);
 	dc->dev = &pdev->dev;
 
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 3a503c9..62f8121 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -40,6 +40,10 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 	if (err < 0)
 		return err;
 
+	err = drm_vblank_init(drm, drm->mode_config.num_crtc);
+	if (err < 0)
+		return err;
+
 	err = tegra_drm_fb_init(drm);
 	if (err < 0)
 		return err;
@@ -89,6 +93,42 @@ static const struct file_operations tegra_drm_fops = {
 	.llseek = noop_llseek,
 };
 
+static struct drm_crtc *tegra_crtc_from_pipe(struct drm_device *drm, int pipe)
+{
+	struct drm_crtc *crtc;
+
+	list_for_each_entry(crtc, &drm->mode_config.crtc_list, head) {
+		struct tegra_dc *dc = to_tegra_dc(crtc);
+
+		if (dc->pipe == pipe)
+			return crtc;
+	}
+
+	return NULL;
+}
+
+static int tegra_drm_enable_vblank(struct drm_device *drm, int pipe)
+{
+	struct drm_crtc *crtc = tegra_crtc_from_pipe(drm, pipe);
+	struct tegra_dc *dc = to_tegra_dc(crtc);
+
+	if (!crtc)
+		return -ENODEV;
+
+	tegra_dc_enable_vblank(dc);
+
+	return 0;
+}
+
+static void tegra_drm_disable_vblank(struct drm_device *drm, int pipe)
+{
+	struct drm_crtc *crtc = tegra_crtc_from_pipe(drm, pipe);
+	struct tegra_dc *dc = to_tegra_dc(crtc);
+
+	if (crtc)
+		tegra_dc_disable_vblank(dc);
+}
+
 struct drm_driver tegra_drm_driver = {
 	.driver_features = DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GEM,
 	.load = tegra_drm_load,
@@ -96,6 +136,10 @@ struct drm_driver tegra_drm_driver = {
 	.open = tegra_drm_open,
 	.lastclose = tegra_drm_lastclose,
 
+	.get_vblank_counter = drm_vblank_count,
+	.enable_vblank = tegra_drm_enable_vblank,
+	.disable_vblank = tegra_drm_disable_vblank,
+
 	.gem_free_object = drm_gem_cma_free_object,
 	.gem_vm_ops = &drm_gem_cma_vm_ops,
 	.dumb_create = drm_gem_cma_dumb_create,
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index d7ab6bc..bb5e9d3 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -83,6 +83,7 @@ struct tegra_output;
 
 struct tegra_dc {
 	struct host1x_client client;
+	spinlock_t lock;
 
 	struct host1x *host1x;
 	struct device *dev;
@@ -149,6 +150,8 @@ struct tegra_dc_window {
 extern unsigned int tegra_dc_format(uint32_t format);
 extern int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 				 const struct tegra_dc_window *window);
+extern void tegra_dc_enable_vblank(struct tegra_dc *dc);
+extern void tegra_dc_disable_vblank(struct tegra_dc *dc);
 
 struct display {
 	unsigned int width;
-- 
1.8.1
