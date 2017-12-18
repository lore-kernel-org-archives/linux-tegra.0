From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] drm/tegra: fix non-debugfs builds
Date: Mon, 18 Dec 2017 14:44:46 +0100
Message-ID: <20171218134519.3042726-1-arnd@arndb.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The new debugfs registration fails to build when CONFIG_DEBUGFS is
disabled, because the drm_crtc structure is lacking a member in that
configuration:

drivers/gpu/drm/tegra/dc.c: In function 'tegra_dc_late_register':
drivers/gpu/drm/tegra/dc.c:1204:28: error: 'struct drm_crtc' has no member named 'debugfs_entry'

Without CONFIG_DEBUGFS, the rest of the function already degrades
into nothing, so we just avoid the one assignment.

Fixes: b95800eeef09 ("drm/tegra: dc: Register debugfs in ->late_register()")
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index e963e40d8a25..e8a0cad5899c 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1201,10 +1201,16 @@ static int tegra_dc_late_register(struct drm_crtc *crtc)
 {
 	unsigned int i, count = ARRAY_SIZE(debugfs_files);
 	struct drm_minor *minor = crtc->dev->primary;
-	struct dentry *root = crtc->debugfs_entry;
+	struct dentry *root;
 	struct tegra_dc *dc = to_tegra_dc(crtc);
 	int err;
 
+#ifdef CONFIG_DEBUG_FS
+	root = crtc->debugfs_entry;
+#else
+	root = NULL;
+#endif
+
 	dc->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				    GFP_KERNEL);
 	if (!dc->debugfs_files)
-- 
2.9.0
