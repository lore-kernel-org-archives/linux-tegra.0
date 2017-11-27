From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/13] drm/tegra: dsi: Register debugfs in ->late_register()
Date: Mon, 27 Nov 2017 11:07:52 +0100
Message-ID: <20171127100758.22149-8-thierry.reding@gmail.com>
References: <20171127100758.22149-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127100758.22149-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The ->late_register() and ->early_unregister() callbacks are called at
the right time to make sure userspace only accesses interfaces when it
should. Move debugfs registration and unregistration to these callback
functions to avoid potential races with userspace.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dsi.c | 58 ++++++++++++++-------------------------------
 1 file changed, 18 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 4a78af08df82..4d2ed966f9e3 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -65,8 +65,6 @@ struct tegra_dsi {
 	struct clk *clk;
 
 	struct drm_info_list *debugfs_files;
-	struct drm_minor *minor;
-	struct dentry *debugfs;
 
 	unsigned long flags;
 	enum mipi_dsi_pixel_format format;
@@ -230,58 +228,46 @@ static struct drm_info_list debugfs_files[] = {
 	{ "regs", tegra_dsi_show_regs, 0, NULL },
 };
 
-static int tegra_dsi_debugfs_init(struct tegra_dsi *dsi,
-				  struct drm_minor *minor)
+static int tegra_dsi_late_register(struct drm_connector *connector)
 {
-	const char *name = dev_name(dsi->dev);
-	unsigned int i;
+	struct tegra_output *output = connector_to_output(connector);
+	unsigned int i, count = ARRAY_SIZE(debugfs_files);
+	struct drm_minor *minor = connector->dev->primary;
+	struct dentry *root = connector->debugfs_entry;
+	struct tegra_dsi *dsi = to_dsi(output);
 	int err;
 
-	dsi->debugfs = debugfs_create_dir(name, minor->debugfs_root);
-	if (!dsi->debugfs)
-		return -ENOMEM;
-
 	dsi->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				     GFP_KERNEL);
-	if (!dsi->debugfs_files) {
-		err = -ENOMEM;
-		goto remove;
-	}
+	if (!dsi->debugfs_files)
+		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(debugfs_files); i++)
+	for (i = 0; i < count; i++)
 		dsi->debugfs_files[i].data = dsi;
 
-	err = drm_debugfs_create_files(dsi->debugfs_files,
-				       ARRAY_SIZE(debugfs_files),
-				       dsi->debugfs, minor);
+	err = drm_debugfs_create_files(dsi->debugfs_files, count, root, minor);
 	if (err < 0)
 		goto free;
 
-	dsi->minor = minor;
-
 	return 0;
 
 free:
 	kfree(dsi->debugfs_files);
 	dsi->debugfs_files = NULL;
-remove:
-	debugfs_remove(dsi->debugfs);
-	dsi->debugfs = NULL;
 
 	return err;
 }
 
-static void tegra_dsi_debugfs_exit(struct tegra_dsi *dsi)
+static void tegra_dsi_early_unregister(struct drm_connector *connector)
 {
-	drm_debugfs_remove_files(dsi->debugfs_files, ARRAY_SIZE(debugfs_files),
-				 dsi->minor);
-	dsi->minor = NULL;
+	struct tegra_output *output = connector_to_output(connector);
+	unsigned int count = ARRAY_SIZE(debugfs_files);
+	struct tegra_dsi *dsi = to_dsi(output);
 
+	drm_debugfs_remove_files(dsi->debugfs_files, count,
+				 connector->dev->primary);
 	kfree(dsi->debugfs_files);
 	dsi->debugfs_files = NULL;
-
-	debugfs_remove(dsi->debugfs);
-	dsi->debugfs = NULL;
 }
 
 #define PKT_ID0(id)	((((id) & 0x3f) <<  3) | (1 <<  9))
@@ -823,6 +809,8 @@ static const struct drm_connector_funcs tegra_dsi_connector_funcs = {
 	.destroy = tegra_output_connector_destroy,
 	.atomic_duplicate_state = tegra_dsi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.late_register = tegra_dsi_late_register,
+	.early_unregister = tegra_dsi_early_unregister,
 };
 
 static enum drm_mode_status
@@ -1076,12 +1064,6 @@ static int tegra_dsi_init(struct host1x_client *client)
 		dsi->output.encoder.possible_crtcs = 0x3;
 	}
 
-	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
-		err = tegra_dsi_debugfs_init(dsi, drm->primary);
-		if (err < 0)
-			dev_err(dsi->dev, "debugfs setup failed: %d\n", err);
-	}
-
 	return 0;
 }
 
@@ -1090,10 +1072,6 @@ static int tegra_dsi_exit(struct host1x_client *client)
 	struct tegra_dsi *dsi = host1x_client_to_dsi(client);
 
 	tegra_output_exit(&dsi->output);
-
-	if (IS_ENABLED(CONFIG_DEBUG_FS))
-		tegra_dsi_debugfs_exit(dsi);
-
 	regulator_disable(dsi->vdd);
 
 	return 0;
-- 
2.15.0
