From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: Expose color key and plane blending controls to userspace
Date: Fri,  2 Sep 2016 12:33:42 +0300
Message-ID: <20160902093359.9063-1-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Chromakey is a simple way of video overlay overlap implementation. This
patch adds 2 new IOCTL's: first - sets color key and is common across of
all Tegra SoC's, second - sets plane blending controls and allows to
utilize the color key, this one is exclusive to Tegra20/30.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c   | 150 +++++++++++++++++++++++++++++++++-------
 drivers/gpu/drm/tegra/dc.h   |   6 ++
 drivers/gpu/drm/tegra/drm.c  | 159 +++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/drm.h  |  14 ++++
 include/uapi/drm/tegra_drm.h |  34 +++++++++
 5 files changed, 337 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index ddac53c..5956382 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -42,6 +42,11 @@ static inline struct tegra_plane *to_tegra_plane(struct drm_plane *plane)
 	return container_of(plane, struct tegra_plane, base);
 }
 
+struct tegra_dc_color_key {
+	u32 upper;
+	u32 lower;
+};
+
 struct tegra_dc_state {
 	struct drm_crtc_state base;
 
@@ -50,6 +55,9 @@ struct tegra_dc_state {
 	unsigned int div;
 
 	u32 planes;
+
+	struct tegra_dc_color_key color_key0;
+	struct tegra_dc_color_key color_key1;
 };
 
 static inline struct tegra_dc_state *to_dc_state(struct drm_crtc_state *state)
@@ -66,6 +74,11 @@ struct tegra_plane_state {
 	struct tegra_bo_tiling tiling;
 	u32 format;
 	u32 swap;
+	u32 blend_nokey;
+	u32 blend_1win;
+	u32 blend_2win_x;
+	u32 blend_2win_y;
+	u32 blend_3win_xy;
 };
 
 static inline struct tegra_plane_state *
@@ -77,6 +90,66 @@ to_tegra_plane_state(struct drm_plane_state *state)
 	return NULL;
 }
 
+void tegra_dc_set_color_key(struct drm_crtc_state *crtc_state,
+			    int key_id, u32 upper, u32 lower)
+{
+	struct tegra_dc_state *state = to_dc_state(crtc_state);
+	struct tegra_dc_color_key *color_key;
+
+	if (key_id == 0)
+		color_key = &state->color_key0;
+	else
+		color_key = &state->color_key1;
+
+	color_key->lower = lower;
+	color_key->upper = upper;
+}
+
+void tegra20_dc_plane_set_blending(struct drm_plane_state *plane_state,
+				   unsigned int blend_config,
+				   unsigned int blend_control,
+				   unsigned int blend_weight0,
+				   unsigned int blend_weight1,
+				   bool use_color_key0,
+				   bool use_color_key1)
+{
+	struct tegra_plane_state *state = to_tegra_plane_state(plane_state);
+	u32 value;
+
+	if (blend_config == DRM_TEGRA_PLANE_BLEND_CONFIG_NOKEY) {
+		value = DC_WIN_BLEND_CONTROL_NOKEY(blend_control);
+	} else {
+		value = DC_WIN_BLEND_CONTROL(blend_control);
+
+		if (use_color_key0)
+			value |= DC_WIN_BLEND_CKEY0;
+
+		if (use_color_key1)
+			value |= DC_WIN_BLEND_CKEY1;
+	}
+
+	value |= DC_WIN_BLEND_WEIGHT0(blend_weight0);
+	value |= DC_WIN_BLEND_WEIGHT1(blend_weight1);
+
+	switch (blend_config) {
+	case DRM_TEGRA_PLANE_BLEND_CONFIG_NOKEY:
+		state->blend_nokey = value;
+		break;
+	case DRM_TEGRA_PLANE_BLEND_CONFIG_1WIN:
+		state->blend_1win = value;
+		break;
+	case DRM_TEGRA_PLANE_BLEND_CONFIG_2WIN_X:
+		state->blend_2win_x = value;
+		break;
+	case DRM_TEGRA_PLANE_BLEND_CONFIG_2WIN_Y:
+		state->blend_2win_y = value;
+		break;
+	case DRM_TEGRA_PLANE_BLEND_CONFIG_3WIN_XY:
+		state->blend_3win_xy = value;
+		break;
+	}
+}
+
 static void tegra_dc_stats_reset(struct tegra_dc_stats *stats)
 {
 	stats->frames = 0;
@@ -381,32 +454,11 @@ static void tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 
 	tegra_dc_writel(dc, value, DC_WIN_WIN_OPTIONS);
 
-	/*
-	 * Disable blending and assume Window A is the bottom-most window,
-	 * Window C is the top-most window and Window B is in the middle.
-	 */
-	tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_NOKEY);
-	tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_1WIN);
-
-	switch (index) {
-	case 0:
-		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_X);
-		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_Y);
-		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_3WIN_XY);
-		break;
-
-	case 1:
-		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_X);
-		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_Y);
-		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_3WIN_XY);
-		break;
-
-	case 2:
-		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_X);
-		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_Y);
-		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_3WIN_XY);
-		break;
-	}
+	tegra_dc_writel(dc, window->blend_nokey,   DC_WIN_BLEND_NOKEY);
+	tegra_dc_writel(dc, window->blend_1win,    DC_WIN_BLEND_1WIN);
+	tegra_dc_writel(dc, window->blend_2win_x,  DC_WIN_BLEND_2WIN_X);
+	tegra_dc_writel(dc, window->blend_2win_y,  DC_WIN_BLEND_2WIN_Y);
+	tegra_dc_writel(dc, window->blend_3win_xy, DC_WIN_BLEND_3WIN_XY);
 
 	spin_unlock_irqrestore(&dc->lock, flags);
 }
@@ -444,6 +496,34 @@ static void tegra_plane_reset(struct drm_plane *plane)
 	if (state) {
 		plane->state = &state->base;
 		plane->state->plane = plane;
+
+		/*
+		 * By default, disable blending and assume Window A is the
+		 * bottom-most window, Window C is the top-most window and
+		 * Window B is in the middle.
+		 */
+		state->blend_nokey = 0xffff00;
+		state->blend_1win  = 0xffff00;
+
+		switch (plane->index) {
+		case 0:
+			state->blend_2win_x  = 0x000000;
+			state->blend_2win_y  = 0x000000;
+			state->blend_3win_xy = 0x000000;
+			break;
+
+		case 1:
+			state->blend_2win_x  = 0xffff00;
+			state->blend_2win_y  = 0x000000;
+			state->blend_3win_xy = 0x000000;
+			break;
+
+		case 2:
+			state->blend_2win_x  = 0xffff00;
+			state->blend_2win_y  = 0xffff00;
+			state->blend_3win_xy = 0xffff00;
+			break;
+		}
 	}
 }
 
@@ -460,6 +540,11 @@ static struct drm_plane_state *tegra_plane_atomic_duplicate_state(struct drm_pla
 	copy->tiling = state->tiling;
 	copy->format = state->format;
 	copy->swap = state->swap;
+	copy->blend_nokey = state->blend_nokey;
+	copy->blend_1win = state->blend_1win;
+	copy->blend_2win_x = state->blend_2win_x;
+	copy->blend_2win_y = state->blend_2win_y;
+	copy->blend_3win_xy = state->blend_3win_xy;
 
 	return &copy->base;
 }
@@ -593,6 +678,11 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	window.tiling = state->tiling;
 	window.format = state->format;
 	window.swap = state->swap;
+	window.blend_nokey = state->blend_nokey;
+	window.blend_1win = state->blend_1win;
+	window.blend_2win_x = state->blend_2win_x;
+	window.blend_2win_y = state->blend_2win_y;
+	window.blend_3win_xy = state->blend_3win_xy;
 
 	for (i = 0; i < drm_format_num_planes(fb->pixel_format); i++) {
 		struct tegra_bo *bo = tegra_fb_get_plane(fb, i);
@@ -1045,6 +1135,8 @@ tegra_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 	copy->pclk = state->pclk;
 	copy->div = state->div;
 	copy->planes = state->planes;
+	copy->color_key0 = state->color_key0;
+	copy->color_key1 = state->color_key1;
 
 	return &copy->base;
 }
@@ -1343,6 +1435,12 @@ static void tegra_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	tegra_dc_writel(dc, state->planes << 8, DC_CMD_STATE_CONTROL);
 	tegra_dc_writel(dc, state->planes, DC_CMD_STATE_CONTROL);
+
+	tegra_dc_writel(dc, state->color_key0.lower, DC_DISP_COLOR_KEY0_LOWER);
+	tegra_dc_writel(dc, state->color_key0.upper, DC_DISP_COLOR_KEY0_UPPER);
+	tegra_dc_writel(dc, state->color_key1.lower, DC_DISP_COLOR_KEY1_LOWER);
+	tegra_dc_writel(dc, state->color_key1.upper, DC_DISP_COLOR_KEY1_UPPER);
+	tegra_dc_commit(dc);
 }
 
 static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 4a26863..45d8142 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -433,6 +433,12 @@
 #define DC_WIN_BLEND_2WIN_X			0x711
 #define DC_WIN_BLEND_2WIN_Y			0x712
 #define DC_WIN_BLEND_3WIN_XY			0x713
+#define DC_WIN_BLEND_CKEY0			(1 << 0)
+#define DC_WIN_BLEND_CKEY1			(1 << 1)
+#define DC_WIN_BLEND_CONTROL(x)			((x) <<  2)
+#define DC_WIN_BLEND_CONTROL_NOKEY(x)		((x) <<  0)
+#define DC_WIN_BLEND_WEIGHT0(x)			((x) <<  8)
+#define DC_WIN_BLEND_WEIGHT1(x)			((x) << 16)
 
 #define DC_WIN_HP_FETCH_CONTROL			0x714
 
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 755264d..917b75b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -13,6 +13,8 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 
+#include <soc/tegra/fuse.h>
+
 #include "drm.h"
 #include "gem.h"
 
@@ -771,6 +773,161 @@ static int tegra_gem_get_flags(struct drm_device *drm, void *data,
 
 	return 0;
 }
+
+static int tegra_set_color_key(struct drm_device *drm, void *data,
+			       struct drm_file *file)
+{
+	struct drm_tegra_set_color_key *args = data;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	bool crtc_mask_invalid = true;
+	int ret;
+
+	if (args->key_id > 1)
+		return -EINVAL;
+
+	drm_for_each_crtc(crtc, drm) {
+		if (!(args->crtc_mask & drm_crtc_mask(crtc)))
+			continue;
+
+		crtc_mask_invalid = false;
+
+		drm_modeset_acquire_init(&ctx, 0);
+
+		state = drm_atomic_state_alloc(drm);
+		if (!state) {
+			ret = -ENOMEM;
+			goto unlock;
+		}
+
+		state->acquire_ctx = &ctx;
+retry:
+		crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(crtc_state)) {
+			ret = PTR_ERR(crtc_state);
+			goto unlock;
+		}
+
+		tegra_dc_set_color_key(crtc_state, args->key_id,
+				       args->upper, args->lower);
+
+		ret = drm_atomic_commit(state);
+		if (ret == -EDEADLK)
+			goto backoff;
+		if (ret)
+			drm_atomic_state_free(state);
+unlock:
+		drm_modeset_drop_locks(&ctx);
+		drm_modeset_acquire_fini(&ctx);
+
+		if (ret)
+			return ret;
+
+		continue;
+backoff:
+		drm_atomic_state_clear(state);
+		drm_modeset_backoff(&ctx);
+
+		goto retry;
+	}
+
+	if (crtc_mask_invalid)
+		return -ENOENT;
+
+	return 0;
+}
+
+static int tegra20_plane_set_blending(struct drm_device *drm, void *data,
+				      struct drm_file *file)
+{
+	struct drm_tegra20_plane_set_blending *args = data;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_plane *plane;
+	struct drm_plane_state *plane_state;
+	struct drm_atomic_state *state;
+	u8 chip = tegra_get_chip_id();
+	int ret;
+
+	switch (chip) {
+	case TEGRA20:
+	case TEGRA30:
+		break;
+	default:
+		return -ENOTTY;
+	}
+
+	plane = drm_plane_find(drm, args->plane_id);
+	if (!plane)
+		return -ENOENT;
+
+	switch (args->blend_config) {
+	case DRM_TEGRA_PLANE_BLEND_CONFIG_NOKEY:
+	case DRM_TEGRA_PLANE_BLEND_CONFIG_1WIN:
+	case DRM_TEGRA_PLANE_BLEND_CONFIG_2WIN_X:
+	case DRM_TEGRA_PLANE_BLEND_CONFIG_2WIN_Y:
+	case DRM_TEGRA_PLANE_BLEND_CONFIG_3WIN_XY:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (args->blend_control) {
+	case DRM_TEGRA_PLANE_BLEND_CONTROL_FIX_WEIGHT:
+	case DRM_TEGRA_PLANE_BLEND_CONTROL_ALPHA_WEIGHT:
+	case DRM_TEGRA_PLANE_BLEND_CONTROL_DEPENDENT_WEIGHT:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (args->blend_weight0 > 0xff)
+		return -EINVAL;
+
+	if (args->blend_weight1 > 0xff)
+		return -EINVAL;
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	state = drm_atomic_state_alloc(drm);
+	if (!state) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	state->acquire_ctx = &ctx;
+retry:
+	plane_state = drm_atomic_get_plane_state(state, plane);
+	if (IS_ERR(plane_state)) {
+		ret = PTR_ERR(plane_state);
+		goto unlock;
+	}
+
+	tegra20_dc_plane_set_blending(plane_state,
+				      args->blend_config,
+				      args->blend_control,
+				      args->blend_weight0,
+				      args->blend_weight1,
+				      args->use_color_key0,
+				      args->use_color_key1);
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK)
+		goto backoff;
+	if (ret)
+		drm_atomic_state_free(state);
+unlock:
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	return ret;
+backoff:
+	drm_atomic_state_clear(state);
+	drm_modeset_backoff(&ctx);
+
+	goto retry;
+}
 #endif
 
 static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
@@ -789,6 +946,8 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_GET_TILING, tegra_gem_get_tiling, 0),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_SET_FLAGS, tegra_gem_set_flags, 0),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_GET_FLAGS, tegra_gem_get_flags, 0),
+	DRM_IOCTL_DEF_DRV(TEGRA_SET_COLOR_KEY, tegra_set_color_key, 0),
+	DRM_IOCTL_DEF_DRV(TEGRA20_PLANE_SET_BLENDING, tegra20_plane_set_blending, 0),
 #endif
 };
 
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 0ddcce1..d2eef79 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -189,6 +189,11 @@ struct tegra_dc_window {
 	struct tegra_bo_tiling tiling;
 	u32 format;
 	u32 swap;
+	u32 blend_nokey;
+	u32 blend_1win;
+	u32 blend_2win_x;
+	u32 blend_2win_y;
+	u32 blend_3win_xy;
 };
 
 /* from dc.c */
@@ -200,6 +205,15 @@ int tegra_dc_state_setup_clock(struct tegra_dc *dc,
 			       struct drm_crtc_state *crtc_state,
 			       struct clk *clk, unsigned long pclk,
 			       unsigned int div);
+void tegra_dc_set_color_key(struct drm_crtc_state *crtc_state,
+			    int key_id, u32 upper, u32 lower);
+void tegra20_dc_plane_set_blending(struct drm_plane_state *plane_state,
+				   unsigned int blend_config,
+				   unsigned int blend_control,
+				   unsigned int blend_weight0,
+				   unsigned int blend_weight1,
+				   bool use_color_key0,
+				   bool use_color_key1);
 
 struct tegra_output {
 	struct device_node *of_node;
diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
index d954f8c..dff9fac 100644
--- a/include/uapi/drm/tegra_drm.h
+++ b/include/uapi/drm/tegra_drm.h
@@ -172,6 +172,36 @@ struct drm_tegra_gem_get_flags {
 	__u32 flags;
 };
 
+struct drm_tegra_set_color_key {
+	/* input */
+	__u32 crtc_mask;	/* Display controllers to use that key */
+	__u32 key_id;		/* Specify what color key to set, 0 or 1 */
+	__u32 upper;		/* Color key itself in ARGB_8888 format */
+	__u32 lower;		/* in range lower..upper */
+};
+
+#define DRM_TEGRA_PLANE_BLEND_CONFIG_NOKEY	0
+#define DRM_TEGRA_PLANE_BLEND_CONFIG_1WIN	1
+#define DRM_TEGRA_PLANE_BLEND_CONFIG_2WIN_X	2
+#define DRM_TEGRA_PLANE_BLEND_CONFIG_2WIN_Y	3
+#define DRM_TEGRA_PLANE_BLEND_CONFIG_3WIN_XY	4
+
+#define DRM_TEGRA_PLANE_BLEND_CONTROL_FIX_WEIGHT	0
+#define DRM_TEGRA_PLANE_BLEND_CONTROL_ALPHA_WEIGHT	1
+#define DRM_TEGRA_PLANE_BLEND_CONTROL_DEPENDENT_WEIGHT	2
+
+struct drm_tegra20_plane_set_blending {
+	/* input */
+	__u32 plane_id;
+	__u32 blend_config;	/* Specify blending configuration to set */
+	__u32 blend_control;
+	__u32 blend_weight0;
+	__u32 blend_weight1;
+	__u32 use_color_key0;	/* Ignored by the NOKEY blending config */
+	__u32 use_color_key1;	/* Ignored by the NOKEY blending config */
+	__u32 pad;
+};
+
 #define DRM_TEGRA_GEM_CREATE		0x00
 #define DRM_TEGRA_GEM_MMAP		0x01
 #define DRM_TEGRA_SYNCPT_READ		0x02
@@ -186,6 +216,8 @@ struct drm_tegra_gem_get_flags {
 #define DRM_TEGRA_GEM_GET_TILING	0x0b
 #define DRM_TEGRA_GEM_SET_FLAGS		0x0c
 #define DRM_TEGRA_GEM_GET_FLAGS		0x0d
+#define DRM_TEGRA_SET_COLOR_KEY		0x0e
+#define DRM_TEGRA20_PLANE_SET_BLENDING	0x0f
 
 #define DRM_IOCTL_TEGRA_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_CREATE, struct drm_tegra_gem_create)
 #define DRM_IOCTL_TEGRA_GEM_MMAP DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_MMAP, struct drm_tegra_gem_mmap)
@@ -201,6 +233,8 @@ struct drm_tegra_gem_get_flags {
 #define DRM_IOCTL_TEGRA_GEM_GET_TILING DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_GET_TILING, struct drm_tegra_gem_get_tiling)
 #define DRM_IOCTL_TEGRA_GEM_SET_FLAGS DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_SET_FLAGS, struct drm_tegra_gem_set_flags)
 #define DRM_IOCTL_TEGRA_GEM_GET_FLAGS DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_GET_FLAGS, struct drm_tegra_gem_get_flags)
+#define DRM_IOCTL_TEGRA_SET_COLOR_KEY DRM_IOW(DRM_COMMAND_BASE + DRM_TEGRA_SET_COLOR_KEY, struct drm_tegra_set_color_key)
+#define DRM_IOCTL_TEGRA20_PLANE_SET_BLENDING DRM_IOW(DRM_COMMAND_BASE + DRM_TEGRA20_PLANE_SET_BLENDING, struct drm_tegra20_plane_set_blending)
 
 #if defined(__cplusplus)
 }
-- 
2.9.3
