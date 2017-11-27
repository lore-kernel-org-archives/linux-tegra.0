From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/13] drm/tegra: sor: Root debugfs files at the connector
Date: Mon, 27 Nov 2017 11:07:54 +0100
Message-ID: <20171127100758.22149-10-thierry.reding@gmail.com>
References: <20171127100758.22149-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127100758.22149-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Rather create new files within the top-level DRM device's debugfs node,
add the SOR specific files to the connector's debugfs node. This avoids
the need to come up with subdirectory names and is also more intuitive.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 75b21dbaa8f0..f40fc987900c 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -184,7 +184,6 @@ struct tegra_sor {
 
 	struct drm_info_list *debugfs_files;
 	struct drm_minor *minor;
-	struct dentry *debugfs;
 
 	const struct tegra_sor_ops *ops;
 
@@ -1260,14 +1259,10 @@ static const struct drm_info_list debugfs_files[] = {
 static int tegra_sor_debugfs_init(struct tegra_sor *sor,
 				  struct drm_minor *minor)
 {
-	const char *name = sor->soc->supports_dp ? "sor1" : "sor";
+	struct dentry *root = sor->output.connector.debugfs_entry;
 	unsigned int i;
 	int err;
 
-	sor->debugfs = debugfs_create_dir(name, minor->debugfs_root);
-	if (!sor->debugfs)
-		return -ENOMEM;
-
 	sor->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				     GFP_KERNEL);
 	if (!sor->debugfs_files) {
@@ -1280,7 +1275,7 @@ static int tegra_sor_debugfs_init(struct tegra_sor *sor,
 
 	err = drm_debugfs_create_files(sor->debugfs_files,
 				       ARRAY_SIZE(debugfs_files),
-				       sor->debugfs, minor);
+				       root, minor);
 	if (err < 0)
 		goto free;
 
@@ -1292,13 +1287,14 @@ static int tegra_sor_debugfs_init(struct tegra_sor *sor,
 	kfree(sor->debugfs_files);
 	sor->debugfs_files = NULL;
 remove:
-	debugfs_remove_recursive(sor->debugfs);
-	sor->debugfs = NULL;
+	debugfs_remove_recursive(root);
 	return err;
 }
 
 static void tegra_sor_debugfs_exit(struct tegra_sor *sor)
 {
+	struct dentry *root = sor->output.connector.debugfs_entry;
+
 	drm_debugfs_remove_files(sor->debugfs_files, ARRAY_SIZE(debugfs_files),
 				 sor->minor);
 	sor->minor = NULL;
@@ -1306,8 +1302,7 @@ static void tegra_sor_debugfs_exit(struct tegra_sor *sor)
 	kfree(sor->debugfs_files);
 	sor->debugfs_files = NULL;
 
-	debugfs_remove_recursive(sor->debugfs);
-	sor->debugfs = NULL;
+	debugfs_remove_recursive(root);
 }
 
 static void tegra_sor_connector_reset(struct drm_connector *connector)
-- 
2.15.0
