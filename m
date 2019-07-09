From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] drm/modes: Skip invalid cmdline mode
Date: Tue,  9 Jul 2019 17:51:51 +0300
Message-ID: <20190709145151.23086-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The named mode could be invalid and then cmdline parser misses to validate
mode's dimensions, happily adding 0x0 mode as a valid mode. One case where
this happens is NVIDIA Tegra devices that are using downstream bootloader
which adds "video=tegrafb" to the kernel's cmdline and thus upstream Tegra
DRM driver fails to probe because of the invalid mode.

Fixes: 3aeeb13d8996 ("drm/modes: Support modes names on the command line")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 3 ++-
 drivers/gpu/drm/drm_modes.c          | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index e95fceac8f8b..56d36779d213 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -180,7 +180,8 @@ drm_connector_pick_cmdline_mode(struct drm_connector *connector)
 
 create_mode:
 	mode = drm_mode_create_from_cmdline_mode(connector->dev, cmdline_mode);
-	list_add(&mode->head, &connector->modes);
+	if (mode)
+		list_add(&mode->head, &connector->modes);
 
 	return mode;
 }
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 910561d4f071..74a5739df506 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -158,6 +158,9 @@ struct drm_display_mode *drm_cvt_mode(struct drm_device *dev, int hdisplay,
 	int interlace;
 	u64 tmp;
 
+	if (!hdisplay || !vdisplay)
+		return NULL;
+
 	/* allocate the drm_display_mode structure. If failure, we will
 	 * return directly
 	 */
@@ -392,6 +395,9 @@ drm_gtf_mode_complex(struct drm_device *dev, int hdisplay, int vdisplay,
 	int hsync, hfront_porch, vodd_front_porch_lines;
 	unsigned int tmp1, tmp2;
 
+	if (!hdisplay || !vdisplay)
+		return NULL;
+
 	drm_mode = drm_mode_create(dev);
 	if (!drm_mode)
 		return NULL;
-- 
2.22.0
