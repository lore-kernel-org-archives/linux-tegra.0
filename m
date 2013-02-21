From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v4 3/9] drm/tegra: Add plane support
Date: Thu, 21 Feb 2013 15:35:55 +0100
Message-ID: <1361457361-13838-4-git-send-email-thierry.reding@avionic-design.de>
References: <1361457361-13838-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361457361-13838-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add support for the B and C planes which support RGB and YUV pixel
formats and can be used as overlays or hardware cursor. Currently 32-bit
XRGB as well as UYVY, YUV420 and YUV422 pixel formats are advertised.
Other formats should be easy to add but these are the most common ones
and should cover the majority of use-cases.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changes in v3:
- split DC_CMD_STATE_CONTROL writes
- adjust plane index to match window index
- drop support for YUV422 format for now
- disable active planes when CRTC is disabled
- disable plane on module unload

Changes in v4:
- add proper YUV420, YUV422 and UYVY support

 drivers/gpu/drm/tegra/dc.c  | 431 ++++++++++++++++++++++++++++++++++----------
 drivers/gpu/drm/tegra/dc.h  |  12 +-
 drivers/gpu/drm/tegra/drm.h |  24 +++
 3 files changed, 372 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index d35ff8b..52bf63f 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -18,26 +18,143 @@
 #include "drm.h"
 #include "dc.h"
 
-struct tegra_dc_window {
-	fixed20_12 x;
-	fixed20_12 y;
-	fixed20_12 w;
-	fixed20_12 h;
-	unsigned int outx;
-	unsigned int outy;
-	unsigned int outw;
-	unsigned int outh;
-	unsigned int stride;
-	unsigned int fmt;
+struct tegra_plane {
+	struct drm_plane base;
+	unsigned int index;
 };
 
+static inline struct tegra_plane *to_tegra_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct tegra_plane, base);
+}
+
+static int tegra_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
+			      struct drm_framebuffer *fb, int crtc_x,
+			      int crtc_y, unsigned int crtc_w,
+			      unsigned int crtc_h, uint32_t src_x,
+			      uint32_t src_y, uint32_t src_w, uint32_t src_h)
+{
+	struct tegra_plane *p = to_tegra_plane(plane);
+	struct tegra_dc *dc = to_tegra_dc(crtc);
+	struct tegra_dc_window window;
+	unsigned int i;
+
+	memset(&window, 0, sizeof(window));
+	window.src.x = src_x >> 16;
+	window.src.y = src_y >> 16;
+	window.src.w = src_w >> 16;
+	window.src.h = src_h >> 16;
+	window.dst.x = crtc_x;
+	window.dst.y = crtc_y;
+	window.dst.w = crtc_w;
+	window.dst.h = crtc_h;
+	window.format = tegra_dc_format(fb->pixel_format);
+	window.bits_per_pixel = fb->bits_per_pixel;
+
+	for (i = 0; i < drm_format_num_planes(fb->pixel_format); i++) {
+		struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(fb, i);
+
+		window.base[i] = gem->paddr + fb->offsets[i];
+
+		/*
+		 * Tegra doesn't support different strides for U and V planes
+		 * so we display a warning if the user tries to display a
+		 * framebuffer with such a configuration.
+		 */
+		if (i >= 2) {
+			if (fb->pitches[i] != window.stride[1])
+				DRM_ERROR("unsupported UV-plane configuration\n");
+		} else {
+			window.stride[i] = fb->pitches[i];
+		}
+	}
+
+	return tegra_dc_setup_window(dc, p->index, &window);
+}
+
+static int tegra_plane_disable(struct drm_plane *plane)
+{
+	struct tegra_dc *dc = to_tegra_dc(plane->crtc);
+	struct tegra_plane *p = to_tegra_plane(plane);
+	unsigned long value;
+
+	value = WINDOW_A_SELECT << p->index;
+	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
+
+	value = tegra_dc_readl(dc, DC_WIN_WIN_OPTIONS);
+	value &= ~WIN_ENABLE;
+	tegra_dc_writel(dc, value, DC_WIN_WIN_OPTIONS);
+
+	tegra_dc_writel(dc, WIN_A_UPDATE << p->index, DC_CMD_STATE_CONTROL);
+	tegra_dc_writel(dc, WIN_A_ACT_REQ << p->index, DC_CMD_STATE_CONTROL);
+
+	return 0;
+}
+
+static void tegra_plane_destroy(struct drm_plane *plane)
+{
+	tegra_plane_disable(plane);
+	drm_plane_cleanup(plane);
+}
+
+static const struct drm_plane_funcs tegra_plane_funcs = {
+	.update_plane = tegra_plane_update,
+	.disable_plane = tegra_plane_disable,
+	.destroy = tegra_plane_destroy,
+};
+
+static const uint32_t plane_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YUV422,
+};
+
+static int tegra_dc_add_planes(struct drm_device *drm, struct tegra_dc *dc)
+{
+	unsigned int i;
+	int err = 0;
+
+	for (i = 0; i < 2; i++) {
+		struct tegra_plane *plane;
+
+		plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
+		if (!plane)
+			return -ENOMEM;
+
+		plane->index = 1 + i;
+
+		err = drm_plane_init(drm, &plane->base, 1 << dc->pipe,
+				     &tegra_plane_funcs, plane_formats,
+				     ARRAY_SIZE(plane_formats), false);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
 static const struct drm_crtc_funcs tegra_crtc_funcs = {
 	.set_config = drm_crtc_helper_set_config,
 	.destroy = drm_crtc_cleanup,
 };
 
-static void tegra_crtc_dpms(struct drm_crtc *crtc, int mode)
+static void tegra_crtc_disable(struct drm_crtc *crtc)
 {
+	struct drm_device *drm = crtc->dev;
+	struct drm_plane *plane;
+
+	list_for_each_entry(plane, &drm->mode_config.plane_list, head) {
+		if (plane->crtc == crtc) {
+			tegra_plane_disable(plane);
+			plane->crtc = NULL;
+
+			if (plane->fb) {
+				drm_framebuffer_unreference(plane->fb);
+				plane->fb = NULL;
+			}
+		}
+	}
 }
 
 static bool tegra_crtc_mode_fixup(struct drm_crtc *crtc,
@@ -47,10 +164,11 @@ static bool tegra_crtc_mode_fixup(struct drm_crtc *crtc,
 	return true;
 }
 
-static inline u32 compute_dda_inc(fixed20_12 inf, unsigned int out, bool v,
+static inline u32 compute_dda_inc(unsigned int in, unsigned int out, bool v,
 				  unsigned int bpp)
 {
 	fixed20_12 outf = dfixed_init(out);
+	fixed20_12 inf = dfixed_init(in);
 	u32 dda_inc;
 	int max;
 
@@ -80,9 +198,10 @@ static inline u32 compute_dda_inc(fixed20_12 inf, unsigned int out, bool v,
 	return dda_inc;
 }
 
-static inline u32 compute_initial_dda(fixed20_12 in)
+static inline u32 compute_initial_dda(unsigned int in)
 {
-	return dfixed_frac(in);
+	fixed20_12 inf = dfixed_init(in);
+	return dfixed_frac(inf);
 }
 
 static int tegra_dc_set_timings(struct tegra_dc *dc,
@@ -153,6 +272,185 @@ static int tegra_crtc_setup_clk(struct drm_crtc *crtc,
 	return 0;
 }
 
+static bool tegra_dc_format_is_yuv(unsigned int format, bool *planar)
+{
+	switch (format) {
+	case WIN_COLOR_DEPTH_YCbCr422:
+	case WIN_COLOR_DEPTH_YUV422:
+		if (planar)
+			*planar = false;
+
+		return true;
+
+	case WIN_COLOR_DEPTH_YCbCr420P:
+	case WIN_COLOR_DEPTH_YUV420P:
+	case WIN_COLOR_DEPTH_YCbCr422P:
+	case WIN_COLOR_DEPTH_YUV422P:
+	case WIN_COLOR_DEPTH_YCbCr422R:
+	case WIN_COLOR_DEPTH_YUV422R:
+	case WIN_COLOR_DEPTH_YCbCr422RA:
+	case WIN_COLOR_DEPTH_YUV422RA:
+		if (planar)
+			*planar = true;
+
+		return true;
+	}
+
+	return false;
+}
+
+int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
+			  const struct tegra_dc_window *window)
+{
+	unsigned h_offset, v_offset, h_size, v_size, h_dda, v_dda, bpp;
+	unsigned long value;
+	bool yuv, planar;
+
+	/*
+	 * For YUV planar modes, the number of bytes per pixel takes into
+	 * account only the luma component and therefore is 1.
+	 */
+	yuv = tegra_dc_format_is_yuv(window->format, &planar);
+	if (!yuv)
+		bpp = window->bits_per_pixel / 8;
+	else
+		bpp = planar ? 1 : 2;
+
+	value = WINDOW_A_SELECT << index;
+	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
+
+	tegra_dc_writel(dc, window->format, DC_WIN_COLOR_DEPTH);
+	tegra_dc_writel(dc, 0, DC_WIN_BYTE_SWAP);
+
+	value = V_POSITION(window->dst.y) | H_POSITION(window->dst.x);
+	tegra_dc_writel(dc, value, DC_WIN_POSITION);
+
+	value = V_SIZE(window->dst.h) | H_SIZE(window->dst.w);
+	tegra_dc_writel(dc, value, DC_WIN_SIZE);
+
+	h_offset = window->src.x * bpp;
+	v_offset = window->src.y;
+	h_size = window->src.w * bpp;
+	v_size = window->src.h;
+
+	value = V_PRESCALED_SIZE(v_size) | H_PRESCALED_SIZE(h_size);
+	tegra_dc_writel(dc, value, DC_WIN_PRESCALED_SIZE);
+
+	/*
+	 * For DDA computations the number of bytes per pixel for YUV planar
+	 * modes needs to take into account all Y, U and V components.
+	 */
+	if (yuv && planar)
+		bpp = 2;
+
+	h_dda = compute_dda_inc(window->src.w, window->dst.w, false, bpp);
+	v_dda = compute_dda_inc(window->src.h, window->dst.h, true, bpp);
+
+	value = V_DDA_INC(v_dda) | H_DDA_INC(h_dda);
+	tegra_dc_writel(dc, value, DC_WIN_DDA_INC);
+
+	h_dda = compute_initial_dda(window->src.x);
+	v_dda = compute_initial_dda(window->src.y);
+
+	tegra_dc_writel(dc, h_dda, DC_WIN_H_INITIAL_DDA);
+	tegra_dc_writel(dc, v_dda, DC_WIN_V_INITIAL_DDA);
+
+	tegra_dc_writel(dc, 0, DC_WIN_UV_BUF_STRIDE);
+	tegra_dc_writel(dc, 0, DC_WIN_BUF_STRIDE);
+
+	tegra_dc_writel(dc, window->base[0], DC_WINBUF_START_ADDR);
+
+	if (yuv && planar) {
+		tegra_dc_writel(dc, window->base[1], DC_WINBUF_START_ADDR_U);
+		tegra_dc_writel(dc, window->base[2], DC_WINBUF_START_ADDR_V);
+		value = window->stride[1] << 16 | window->stride[0];
+		tegra_dc_writel(dc, value, DC_WIN_LINE_STRIDE);
+	} else {
+		tegra_dc_writel(dc, window->stride[0], DC_WIN_LINE_STRIDE);
+	}
+
+	tegra_dc_writel(dc, h_offset, DC_WINBUF_ADDR_H_OFFSET);
+	tegra_dc_writel(dc, v_offset, DC_WINBUF_ADDR_V_OFFSET);
+
+	value = WIN_ENABLE;
+
+	if (yuv) {
+		/* setup default colorspace conversion coefficients */
+		tegra_dc_writel(dc, 0x00f0, DC_WIN_CSC_YOF);
+		tegra_dc_writel(dc, 0x012a, DC_WIN_CSC_KYRGB);
+		tegra_dc_writel(dc, 0x0000, DC_WIN_CSC_KUR);
+		tegra_dc_writel(dc, 0x0198, DC_WIN_CSC_KVR);
+		tegra_dc_writel(dc, 0x039b, DC_WIN_CSC_KUG);
+		tegra_dc_writel(dc, 0x032f, DC_WIN_CSC_KVG);
+		tegra_dc_writel(dc, 0x0204, DC_WIN_CSC_KUB);
+		tegra_dc_writel(dc, 0x0000, DC_WIN_CSC_KVB);
+
+		value |= CSC_ENABLE;
+	} else if (bpp < 24) {
+		value |= COLOR_EXPAND;
+	}
+
+	tegra_dc_writel(dc, value, DC_WIN_WIN_OPTIONS);
+
+	/*
+	 * Disable blending and assume Window A is the bottom-most window,
+	 * Window C is the top-most window and Window B is in the middle.
+	 */
+	tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_NOKEY);
+	tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_1WIN);
+
+	switch (index) {
+	case 0:
+		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_X);
+		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_Y);
+		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_3WIN_XY);
+		break;
+
+	case 1:
+		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_X);
+		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_Y);
+		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_3WIN_XY);
+		break;
+
+	case 2:
+		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_X);
+		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_Y);
+		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_3WIN_XY);
+		break;
+	}
+
+	tegra_dc_writel(dc, WIN_A_UPDATE << index, DC_CMD_STATE_CONTROL);
+	tegra_dc_writel(dc, WIN_A_ACT_REQ << index, DC_CMD_STATE_CONTROL);
+
+	return 0;
+}
+
+unsigned int tegra_dc_format(uint32_t format)
+{
+	switch (format) {
+	case DRM_FORMAT_XRGB8888:
+		return WIN_COLOR_DEPTH_B8G8R8A8;
+
+	case DRM_FORMAT_RGB565:
+		return WIN_COLOR_DEPTH_B5G6R5;
+
+	case DRM_FORMAT_UYVY:
+		return WIN_COLOR_DEPTH_YCbCr422;
+
+	case DRM_FORMAT_YUV420:
+		return WIN_COLOR_DEPTH_YCbCr420P;
+
+	case DRM_FORMAT_YUV422:
+		return WIN_COLOR_DEPTH_YCbCr422P;
+
+	default:
+		break;
+	}
+
+	WARN(1, "unsupported pixel format %u, using default\n", format);
+	return WIN_COLOR_DEPTH_B8G8R8A8;
+}
+
 static int tegra_crtc_mode_set(struct drm_crtc *crtc,
 			       struct drm_display_mode *mode,
 			       struct drm_display_mode *adjusted,
@@ -160,8 +458,7 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
 {
 	struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(crtc->fb, 0);
 	struct tegra_dc *dc = to_tegra_dc(crtc);
-	unsigned int h_dda, v_dda, bpp;
-	struct tegra_dc_window win;
+	struct tegra_dc_window window;
 	unsigned long div, value;
 	int err;
 
@@ -192,81 +489,23 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
 	tegra_dc_writel(dc, value, DC_DISP_DISP_CLOCK_CONTROL);
 
 	/* setup window parameters */
-	memset(&win, 0, sizeof(win));
-	win.x.full = dfixed_const(0);
-	win.y.full = dfixed_const(0);
-	win.w.full = dfixed_const(mode->hdisplay);
-	win.h.full = dfixed_const(mode->vdisplay);
-	win.outx = 0;
-	win.outy = 0;
-	win.outw = mode->hdisplay;
-	win.outh = mode->vdisplay;
-
-	switch (crtc->fb->pixel_format) {
-	case DRM_FORMAT_XRGB8888:
-		win.fmt = WIN_COLOR_DEPTH_B8G8R8A8;
-		break;
-
-	case DRM_FORMAT_RGB565:
-		win.fmt = WIN_COLOR_DEPTH_B5G6R5;
-		break;
-
-	default:
-		win.fmt = WIN_COLOR_DEPTH_B8G8R8A8;
-		WARN_ON(1);
-		break;
-	}
-
-	bpp = crtc->fb->bits_per_pixel / 8;
-	win.stride = crtc->fb->pitches[0];
-
-	/* program window registers */
-	value = WINDOW_A_SELECT;
-	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
-
-	tegra_dc_writel(dc, win.fmt, DC_WIN_COLOR_DEPTH);
-	tegra_dc_writel(dc, 0, DC_WIN_BYTE_SWAP);
-
-	value = V_POSITION(win.outy) | H_POSITION(win.outx);
-	tegra_dc_writel(dc, value, DC_WIN_POSITION);
-
-	value = V_SIZE(win.outh) | H_SIZE(win.outw);
-	tegra_dc_writel(dc, value, DC_WIN_SIZE);
-
-	value = V_PRESCALED_SIZE(dfixed_trunc(win.h)) |
-		H_PRESCALED_SIZE(dfixed_trunc(win.w) * bpp);
-	tegra_dc_writel(dc, value, DC_WIN_PRESCALED_SIZE);
-
-	h_dda = compute_dda_inc(win.w, win.outw, false, bpp);
-	v_dda = compute_dda_inc(win.h, win.outh, true, bpp);
-
-	value = V_DDA_INC(v_dda) | H_DDA_INC(h_dda);
-	tegra_dc_writel(dc, value, DC_WIN_DDA_INC);
-
-	h_dda = compute_initial_dda(win.x);
-	v_dda = compute_initial_dda(win.y);
-
-	tegra_dc_writel(dc, h_dda, DC_WIN_H_INITIAL_DDA);
-	tegra_dc_writel(dc, v_dda, DC_WIN_V_INITIAL_DDA);
-
-	tegra_dc_writel(dc, 0, DC_WIN_UV_BUF_STRIDE);
-	tegra_dc_writel(dc, 0, DC_WIN_BUF_STRIDE);
-
-	tegra_dc_writel(dc, fb->obj->paddr, DC_WINBUF_START_ADDR);
-	tegra_dc_writel(dc, win.stride, DC_WIN_LINE_STRIDE);
-	tegra_dc_writel(dc, dfixed_trunc(win.x) * bpp,
-			DC_WINBUF_ADDR_H_OFFSET);
-	tegra_dc_writel(dc, dfixed_trunc(win.y), DC_WINBUF_ADDR_V_OFFSET);
-
-	value = WIN_ENABLE;
-
-	if (bpp < 24)
-		value |= COLOR_EXPAND;
-
-	tegra_dc_writel(dc, value, DC_WIN_WIN_OPTIONS);
-
-	tegra_dc_writel(dc, 0xff00, DC_WIN_BLEND_NOKEY);
-	tegra_dc_writel(dc, 0xff00, DC_WIN_BLEND_1WIN);
+	memset(&window, 0, sizeof(window));
+	window.src.x = 0;
+	window.src.y = 0;
+	window.src.w = mode->hdisplay;
+	window.src.h = mode->vdisplay;
+	window.dst.x = 0;
+	window.dst.y = 0;
+	window.dst.w = mode->hdisplay;
+	window.dst.h = mode->vdisplay;
+	window.format = tegra_dc_format(crtc->fb->pixel_format);
+	window.bits_per_pixel = crtc->fb->bits_per_pixel;
+	window.stride[0] = crtc->fb->pitches[0];
+	window.base[0] = gem->paddr;
+
+	err = tegra_dc_setup_window(dc, 0, &window);
+	if (err < 0)
+		dev_err(dc->dev, "failed to enable root plane\n");
 
 	return 0;
 }
@@ -347,7 +586,7 @@ static void tegra_crtc_load_lut(struct drm_crtc *crtc)
 }
 
 static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
-	.dpms = tegra_crtc_dpms,
+	.disable = tegra_crtc_disable,
 	.mode_fixup = tegra_crtc_mode_fixup,
 	.mode_set = tegra_crtc_mode_set,
 	.prepare = tegra_crtc_prepare,
@@ -588,7 +827,7 @@ static int tegra_dc_show_regs(struct seq_file *s, void *data)
 	DUMP_REG(DC_WIN_BLEND_1WIN);
 	DUMP_REG(DC_WIN_BLEND_2WIN_X);
 	DUMP_REG(DC_WIN_BLEND_2WIN_Y);
-	DUMP_REG(DC_WIN_BLEND32WIN_XY);
+	DUMP_REG(DC_WIN_BLEND_3WIN_XY);
 	DUMP_REG(DC_WIN_HP_FETCH_CONTROL);
 	DUMP_REG(DC_WINBUF_START_ADDR);
 	DUMP_REG(DC_WINBUF_START_ADDR_NS);
@@ -690,6 +929,10 @@ static int tegra_dc_drm_init(struct host1x_client *client,
 		return err;
 	}
 
+	err = tegra_dc_add_planes(drm, dc);
+	if (err < 0)
+		return err;
+
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
 		err = tegra_dc_debugfs_init(dc, drm->primary);
 		if (err < 0)
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 99977b5..e2fa328 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -290,8 +290,18 @@
 #define DC_DISP_SD_HW_K_VALUES			0x4dd
 #define DC_DISP_SD_MAN_K_VALUES			0x4de
 
+#define DC_WIN_CSC_YOF				0x611
+#define DC_WIN_CSC_KYRGB			0x612
+#define DC_WIN_CSC_KUR				0x613
+#define DC_WIN_CSC_KVR				0x614
+#define DC_WIN_CSC_KUG				0x615
+#define DC_WIN_CSC_KVG				0x616
+#define DC_WIN_CSC_KUB				0x617
+#define DC_WIN_CSC_KVB				0x618
+
 #define DC_WIN_WIN_OPTIONS			0x700
 #define COLOR_EXPAND (1 <<  6)
+#define CSC_ENABLE   (1 << 18)
 #define WIN_ENABLE   (1 << 30)
 
 #define DC_WIN_BYTE_SWAP			0x701
@@ -359,7 +369,7 @@
 #define DC_WIN_BLEND_1WIN			0x710
 #define DC_WIN_BLEND_2WIN_X			0x711
 #define DC_WIN_BLEND_2WIN_Y			0x712
-#define DC_WIN_BLEND32WIN_XY			0x713
+#define DC_WIN_BLEND_3WIN_XY			0x713
 
 #define DC_WIN_HP_FETCH_CONTROL			0x714
 
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 3c61aab..896ff43 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -107,6 +107,30 @@ static inline unsigned long tegra_dc_readl(struct tegra_dc *dc,
 	return readl(dc->regs + (reg << 2));
 }
 
+struct tegra_dc_window {
+	struct {
+		unsigned int x;
+		unsigned int y;
+		unsigned int w;
+		unsigned int h;
+	} src;
+	struct {
+		unsigned int x;
+		unsigned int y;
+		unsigned int w;
+		unsigned int h;
+	} dst;
+	unsigned int bits_per_pixel;
+	unsigned int format;
+	unsigned int stride[2];
+	unsigned long base[3];
+};
+
+/* from dc.c */
+extern unsigned int tegra_dc_format(uint32_t format);
+extern int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
+				 const struct tegra_dc_window *window);
+
 struct tegra_output_ops {
 	int (*enable)(struct tegra_output *output);
 	int (*disable)(struct tegra_output *output);
-- 
1.8.1.2
