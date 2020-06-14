From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 5/6] drm/tegra: plane: Support horizontal reflection mode
Date: Sun, 14 Jun 2020 22:03:47 +0300
Message-ID: <20200614190348.12193-6-digetx@gmail.com>
References: <20200614190348.12193-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200614190348.12193-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Support horizontal reflection mode which will allow to support 180°
rotation mode when combined with the vertical reflection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c    | 24 ++++++++++++++++++++----
 drivers/gpu/drm/tegra/dc.h    |  1 +
 drivers/gpu/drm/tegra/plane.c |  1 +
 drivers/gpu/drm/tegra/plane.h |  1 +
 4 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index ed282f88e409..f31bca27cde4 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -368,6 +368,12 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 	h_size = window->src.w * bpp;
 	v_size = window->src.h;
 
+	if (window->reflect_x)
+		h_offset += (window->src.w - 1) * bpp;
+
+	if (window->reflect_y)
+		v_offset += window->src.h - 1;
+
 	value = V_PRESCALED_SIZE(v_size) | H_PRESCALED_SIZE(h_size);
 	tegra_plane_writel(plane, value, DC_WIN_PRESCALED_SIZE);
 
@@ -404,9 +410,6 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 		tegra_plane_writel(plane, window->stride[0], DC_WIN_LINE_STRIDE);
 	}
 
-	if (window->reflect_y)
-		v_offset += window->src.h - 1;
-
 	tegra_plane_writel(plane, h_offset, DC_WINBUF_ADDR_H_OFFSET);
 	tegra_plane_writel(plane, v_offset, DC_WINBUF_ADDR_V_OFFSET);
 
@@ -470,6 +473,9 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 		value |= COLOR_EXPAND;
 	}
 
+	if (window->reflect_x)
+		value |= H_DIRECTION;
+
 	if (window->reflect_y)
 		value |= V_DIRECTION;
 
@@ -601,7 +607,9 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 				    struct drm_plane_state *state)
 {
 	struct tegra_plane_state *plane_state = to_tegra_plane_state(state);
-	unsigned int rotation = DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y;
+	unsigned int rotation = DRM_MODE_ROTATE_0 |
+				DRM_MODE_REFLECT_X |
+				DRM_MODE_REFLECT_Y;
 	struct tegra_bo_tiling *tiling = &plane_state->tiling;
 	struct tegra_plane *tegra = to_tegra_plane(plane);
 	struct tegra_dc *dc = to_tegra_dc(state->crtc);
@@ -641,6 +649,11 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 
 	rotation = drm_rotation_simplify(state->rotation, rotation);
 
+	if (rotation & DRM_MODE_REFLECT_X)
+		plane_state->reflect_x = true;
+	else
+		plane_state->reflect_x = false;
+
 	if (rotation & DRM_MODE_REFLECT_Y)
 		plane_state->reflect_y = true;
 	else
@@ -706,6 +719,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	window.dst.w = drm_rect_width(&plane->state->dst);
 	window.dst.h = drm_rect_height(&plane->state->dst);
 	window.bits_per_pixel = fb->format->cpp[0] * 8;
+	window.reflect_x = state->reflect_x;
 	window.reflect_y = tegra_fb_is_bottom_up(fb) || state->reflect_y;
 
 	/* copy from state */
@@ -792,6 +806,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
 						 DRM_MODE_ROTATE_0 |
+						 DRM_MODE_REFLECT_X |
 						 DRM_MODE_REFLECT_Y);
 	if (err < 0)
 		dev_err(dc->dev, "failed to create rotation property: %d\n",
@@ -1079,6 +1094,7 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
 						 DRM_MODE_ROTATE_0 |
+						 DRM_MODE_REFLECT_X |
 						 DRM_MODE_REFLECT_Y);
 	if (err < 0)
 		dev_err(dc->dev, "failed to create rotation property: %d\n",
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 98e1b625168e..051d03dcb9b0 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -136,6 +136,7 @@ struct tegra_dc_window {
 	unsigned int stride[2];
 	unsigned long base[3];
 	unsigned int zpos;
+	bool reflect_x;
 	bool reflect_y;
 
 	struct tegra_bo_tiling tiling;
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index e05ef6013a97..4cd0461cc508 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -61,6 +61,7 @@ tegra_plane_atomic_duplicate_state(struct drm_plane *plane)
 	copy->tiling = state->tiling;
 	copy->format = state->format;
 	copy->swap = state->swap;
+	copy->reflect_x = state->reflect_x;
 	copy->reflect_y = state->reflect_y;
 	copy->opaque = state->opaque;
 
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index 8047fc916d8c..c691dd79b27b 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -46,6 +46,7 @@ struct tegra_plane_state {
 	u32 format;
 	u32 swap;
 
+	bool reflect_x;
 	bool reflect_y;
 
 	/* used for legacy blending support only */
-- 
2.26.0
