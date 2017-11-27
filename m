From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/13] drm/tegra: sor: Register debugfs in ->late_register()
Date: Mon, 27 Nov 2017 11:07:55 +0100
Message-ID: <20171127100758.22149-11-thierry.reding@gmail.com>
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
 drivers/gpu/drm/tegra/sor.c | 53 ++++++++++++++++-----------------------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index f40fc987900c..2fba6c2bd486 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -183,7 +183,6 @@ struct tegra_sor {
 	struct drm_dp_aux *aux;
 
 	struct drm_info_list *debugfs_files;
-	struct drm_minor *minor;
 
 	const struct tegra_sor_ops *ops;
 
@@ -1256,53 +1255,46 @@ static const struct drm_info_list debugfs_files[] = {
 	{ "regs", tegra_sor_show_regs, 0, NULL },
 };
 
-static int tegra_sor_debugfs_init(struct tegra_sor *sor,
-				  struct drm_minor *minor)
+static int tegra_sor_late_register(struct drm_connector *connector)
 {
-	struct dentry *root = sor->output.connector.debugfs_entry;
-	unsigned int i;
+	struct tegra_output *output = connector_to_output(connector);
+	unsigned int i, count = ARRAY_SIZE(debugfs_files);
+	struct drm_minor *minor = connector->dev->primary;
+	struct dentry *root = connector->debugfs_entry;
+	struct tegra_sor *sor = to_sor(output);
 	int err;
 
 	sor->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				     GFP_KERNEL);
-	if (!sor->debugfs_files) {
-		err = -ENOMEM;
-		goto remove;
-	}
+	if (!sor->debugfs_files)
+		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(debugfs_files); i++)
+	for (i = 0; i < count; i++)
 		sor->debugfs_files[i].data = sor;
 
-	err = drm_debugfs_create_files(sor->debugfs_files,
-				       ARRAY_SIZE(debugfs_files),
-				       root, minor);
+	err = drm_debugfs_create_files(sor->debugfs_files, count, root, minor);
 	if (err < 0)
 		goto free;
 
-	sor->minor = minor;
-
 	return 0;
 
 free:
 	kfree(sor->debugfs_files);
 	sor->debugfs_files = NULL;
-remove:
-	debugfs_remove_recursive(root);
+
 	return err;
 }
 
-static void tegra_sor_debugfs_exit(struct tegra_sor *sor)
+static void tegra_sor_early_unregister(struct drm_connector *connector)
 {
-	struct dentry *root = sor->output.connector.debugfs_entry;
-
-	drm_debugfs_remove_files(sor->debugfs_files, ARRAY_SIZE(debugfs_files),
-				 sor->minor);
-	sor->minor = NULL;
+	struct tegra_output *output = connector_to_output(connector);
+	unsigned int count = ARRAY_SIZE(debugfs_files);
+	struct tegra_sor *sor = to_sor(output);
 
+	drm_debugfs_remove_files(sor->debugfs_files, count,
+				 connector->dev->primary);
 	kfree(sor->debugfs_files);
 	sor->debugfs_files = NULL;
-
-	debugfs_remove_recursive(root);
 }
 
 static void tegra_sor_connector_reset(struct drm_connector *connector)
@@ -1355,6 +1347,8 @@ static const struct drm_connector_funcs tegra_sor_connector_funcs = {
 	.destroy = tegra_output_connector_destroy,
 	.atomic_duplicate_state = tegra_sor_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.late_register = tegra_sor_late_register,
+	.early_unregister = tegra_sor_early_unregister,
 };
 
 static int tegra_sor_connector_get_modes(struct drm_connector *connector)
@@ -2347,12 +2341,6 @@ static int tegra_sor_init(struct host1x_client *client)
 
 	sor->output.encoder.possible_crtcs = 0x3;
 
-	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
-		err = tegra_sor_debugfs_init(sor, drm->primary);
-		if (err < 0)
-			dev_err(sor->dev, "debugfs setup failed: %d\n", err);
-	}
-
 	if (sor->aux) {
 		err = drm_dp_aux_attach(sor->aux, &sor->output);
 		if (err < 0) {
@@ -2421,9 +2409,6 @@ static int tegra_sor_exit(struct host1x_client *client)
 	clk_disable_unprepare(sor->clk_dp);
 	clk_disable_unprepare(sor->clk);
 
-	if (IS_ENABLED(CONFIG_DEBUG_FS))
-		tegra_sor_debugfs_exit(sor);
-
 	return 0;
 }
 
-- 
2.15.0
