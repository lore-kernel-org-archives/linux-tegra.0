From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v3 7/7] drm/tegra: Add list of framebuffers to debugfs
Date: Wed, 13 Feb 2013 17:05:06 +0100
Message-ID: <1360771506-17849-8-git-send-email-thierry.reding@avionic-design.de>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360771506-17849-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This list is most useful to inspect whether framebuffer reference
counting works as expected. The code is loosely based on the i915
implementation.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index edaf9c0..9d452df 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -142,6 +142,45 @@ static void tegra_drm_preclose(struct drm_device *drm, struct drm_file *file)
 		tegra_dc_cancel_page_flip(crtc, file);
 }
 
+#ifdef CONFIG_DEBUG_FS
+static int tegra_debugfs_framebuffers(struct seq_file *s, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *)s->private;
+	struct drm_device *drm = node->minor->dev;
+	struct drm_framebuffer *fb;
+
+	mutex_lock(&drm->mode_config.fb_lock);
+
+	list_for_each_entry(fb, &drm->mode_config.fb_list, head) {
+		seq_printf(s, "%3d: user size: %d x %d, depth %d, %d bpp, refcount %d\n",
+			   fb->base.id, fb->width, fb->height, fb->depth,
+			   fb->bits_per_pixel,
+			   atomic_read(&fb->refcount.refcount));
+	}
+
+	mutex_unlock(&drm->mode_config.fb_lock);
+
+	return 0;
+}
+
+static struct drm_info_list tegra_debugfs_list[] = {
+	{ "framebuffers", tegra_debugfs_framebuffers, 0 },
+};
+
+static int tegra_debugfs_init(struct drm_minor *minor)
+{
+	return drm_debugfs_create_files(tegra_debugfs_list,
+					ARRAY_SIZE(tegra_debugfs_list),
+					minor->debugfs_root, minor);
+}
+
+static void tegra_debugfs_cleanup(struct drm_minor *minor)
+{
+	drm_debugfs_remove_files(tegra_debugfs_list,
+				 ARRAY_SIZE(tegra_debugfs_list), minor);
+}
+#endif
+
 struct drm_driver tegra_drm_driver = {
 	.driver_features = DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GEM,
 	.load = tegra_drm_load,
@@ -154,6 +193,11 @@ struct drm_driver tegra_drm_driver = {
 	.enable_vblank = tegra_drm_enable_vblank,
 	.disable_vblank = tegra_drm_disable_vblank,
 
+#if defined(CONFIG_DEBUG_FS)
+	.debugfs_init = tegra_debugfs_init,
+	.debugfs_cleanup = tegra_debugfs_cleanup,
+#endif
+
 	.gem_free_object = drm_gem_cma_free_object,
 	.gem_vm_ops = &drm_gem_cma_vm_ops,
 	.dumb_create = drm_gem_cma_dumb_create,
-- 
1.8.1.2
