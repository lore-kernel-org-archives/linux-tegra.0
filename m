From: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/21] drm/tegra: remove checks for debugfs functions return value
Date: Thu, 27 Feb 2020 15:02:21 +0300
Message-ID: <20200227120232.19413-11-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200227120232.19413-1-wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel-/w4YWyX8dFk@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail) there is no need to check the
return value of drm_debugfs_create_files(). Therefore, remove the
return checks and error handling of the drm_debugfs_create_files()
function from various debugfs init functions in drm/tegra and have
them return 0 directly.

This change also includes removing the use of drm_debugfs_create_files
as a return value in tegra_debugfs_init() and have the function declared
as void.

Signed-off-by: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c   | 11 +----------
 drivers/gpu/drm/tegra/drm.c  |  8 ++++----
 drivers/gpu/drm/tegra/dsi.c  | 11 +----------
 drivers/gpu/drm/tegra/hdmi.c | 11 +----------
 drivers/gpu/drm/tegra/sor.c  | 11 +----------
 5 files changed, 8 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 7c70fd31a4c2..e70d58b21964 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1496,7 +1496,6 @@ static int tegra_dc_late_register(struct drm_crtc *crtc)
 	struct drm_minor *minor = crtc->dev->primary;
 	struct dentry *root;
 	struct tegra_dc *dc = to_tegra_dc(crtc);
-	int err;
 
 #ifdef CONFIG_DEBUG_FS
 	root = crtc->debugfs_entry;
@@ -1512,17 +1511,9 @@ static int tegra_dc_late_register(struct drm_crtc *crtc)
 	for (i = 0; i < count; i++)
 		dc->debugfs_files[i].data = dc;
 
-	err = drm_debugfs_create_files(dc->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(dc->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(dc->debugfs_files);
-	dc->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_dc_early_unregister(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bd268028fb3d..d4f51b5c7ee5 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -839,11 +839,11 @@ static struct drm_info_list tegra_debugfs_list[] = {
 	{ "iova", tegra_debugfs_iova, 0 },
 };
 
-static int tegra_debugfs_init(struct drm_minor *minor)
+static void tegra_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(tegra_debugfs_list,
-					ARRAY_SIZE(tegra_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(tegra_debugfs_list,
+				 ARRAY_SIZE(tegra_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 88b9d64c77bf..30626fcf61eb 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -234,7 +234,6 @@ static int tegra_dsi_late_register(struct drm_connector *connector)
 	struct drm_minor *minor = connector->dev->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_dsi *dsi = to_dsi(output);
-	int err;
 
 	dsi->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				     GFP_KERNEL);
@@ -244,17 +243,9 @@ static int tegra_dsi_late_register(struct drm_connector *connector)
 	for (i = 0; i < count; i++)
 		dsi->debugfs_files[i].data = dsi;
 
-	err = drm_debugfs_create_files(dsi->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(dsi->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(dsi->debugfs_files);
-	dsi->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_dsi_early_unregister(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6f117628f257..d7799d13d8ad 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1064,7 +1064,6 @@ static int tegra_hdmi_late_register(struct drm_connector *connector)
 	struct drm_minor *minor = connector->dev->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_hdmi *hdmi = to_hdmi(output);
-	int err;
 
 	hdmi->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				      GFP_KERNEL);
@@ -1074,17 +1073,9 @@ static int tegra_hdmi_late_register(struct drm_connector *connector)
 	for (i = 0; i < count; i++)
 		hdmi->debugfs_files[i].data = hdmi;
 
-	err = drm_debugfs_create_files(hdmi->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(hdmi->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(hdmi->debugfs_files);
-	hdmi->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_hdmi_early_unregister(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 81226a4953c1..47c1d133069a 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1687,7 +1687,6 @@ static int tegra_sor_late_register(struct drm_connector *connector)
 	struct drm_minor *minor = connector->dev->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_sor *sor = to_sor(output);
-	int err;
 
 	sor->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				     GFP_KERNEL);
@@ -1697,17 +1696,9 @@ static int tegra_sor_late_register(struct drm_connector *connector)
 	for (i = 0; i < count; i++)
 		sor->debugfs_files[i].data = sor;
 
-	err = drm_debugfs_create_files(sor->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(sor->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(sor->debugfs_files);
-	sor->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_sor_early_unregister(struct drm_connector *connector)
-- 
2.25.0
