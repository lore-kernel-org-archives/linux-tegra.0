From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 2/5] drm/tegra: Add plane support
Date: Mon, 14 Jan 2013 16:55:29 +0100
Message-ID: <1358178932-25505-3-git-send-email-thierry.reding@avionic-design.de>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358178932-25505-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add support for the B and C planes which support RGB and YUV pixel
formats and can be used as overlays or hardware cursor.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c  | 321 +++++++++++++++++++++++++++++++-------------
 drivers/gpu/drm/tegra/dc.h  |   2 +-
 drivers/gpu/drm/tegra/drm.h |  29 ++++
 3 files changed, 259 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 656b2e3..157e962 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -18,19 +18,104 @@
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
+	unsigned long base = tegra_framebuffer_base(fb);
+	struct tegra_plane *p = to_tegra_plane(plane);
+	struct tegra_dc *dc = to_tegra_dc(crtc);
+	struct tegra_dc_window window;
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
+	window.stride = fb->pitches[0];
+	window.base = base;
+
+	return tegra_dc_setup_window(dc, p->index + 1, &window);
+}
+
+static int tegra_plane_disable(struct drm_plane *plane)
+{
+	struct tegra_dc *dc = to_tegra_dc(plane->crtc);
+	struct tegra_plane *p = to_tegra_plane(plane);
+	unsigned int index = p->index + 1;
+	unsigned long value;
+
+	value = WINDOW_A_SELECT << index;
+	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
+
+	value = tegra_dc_readl(dc, DC_WIN_WIN_OPTIONS);
+	value &= ~WIN_ENABLE;
+	tegra_dc_writel(dc, value, DC_WIN_WIN_OPTIONS);
+
+	value = (WIN_A_ACT_REQ << index) | (WIN_A_UPDATE << index);
+	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
+
+	return 0;
+}
+
+static void tegra_plane_destroy(struct drm_plane *plane)
+{
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
+		plane->index = i;
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
@@ -47,10 +132,11 @@ static bool tegra_crtc_mode_fixup(struct drm_crtc *crtc,
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
 
@@ -80,9 +166,10 @@ static inline u32 compute_dda_inc(fixed20_12 inf, unsigned int out, bool v,
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
@@ -153,6 +240,111 @@ static int tegra_crtc_setup_clk(struct drm_crtc *crtc,
 	return 0;
 }
 
+int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
+			  const struct tegra_dc_window *window)
+{
+	unsigned h_offset, v_offset, h_size, v_size, h_dda, v_dda, bpp;
+	unsigned long value;
+
+	bpp = window->bits_per_pixel / 8;
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
+	tegra_dc_writel(dc, window->base, DC_WINBUF_START_ADDR);
+	tegra_dc_writel(dc, window->stride, DC_WIN_LINE_STRIDE);
+	tegra_dc_writel(dc, h_offset, DC_WINBUF_ADDR_H_OFFSET);
+	tegra_dc_writel(dc, v_offset, DC_WINBUF_ADDR_V_OFFSET);
+
+	value = WIN_ENABLE;
+
+	if (bpp < 24)
+		value |= COLOR_EXPAND;
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
+	value = (WIN_A_ACT_REQ << index) | (WIN_A_UPDATE << index);
+	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
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
@@ -160,8 +352,7 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
 {
 	struct tegra_framebuffer *fb = to_tegra_fb(crtc->fb);
 	struct tegra_dc *dc = to_tegra_dc(crtc);
-	unsigned int h_dda, v_dda, bpp;
-	struct tegra_dc_window win;
+	struct tegra_dc_window window;
 	unsigned long div, value;
 	int err;
 
@@ -192,81 +383,23 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
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
+	window.stride = crtc->fb->pitches[0];
+	window.base = fb->obj->paddr;
+
+	err = tegra_dc_setup_window(dc, 0, &window);
+	if (err < 0)
+		dev_err(dc->dev, "failed to enable root plane\n");
 
 	return 0;
 }
@@ -588,7 +721,7 @@ static int tegra_dc_show_regs(struct seq_file *s, void *data)
 	DUMP_REG(DC_WIN_BLEND_1WIN);
 	DUMP_REG(DC_WIN_BLEND_2WIN_X);
 	DUMP_REG(DC_WIN_BLEND_2WIN_Y);
-	DUMP_REG(DC_WIN_BLEND32WIN_XY);
+	DUMP_REG(DC_WIN_BLEND_3WIN_XY);
 	DUMP_REG(DC_WIN_HP_FETCH_CONTROL);
 	DUMP_REG(DC_WINBUF_START_ADDR);
 	DUMP_REG(DC_WINBUF_START_ADDR_NS);
@@ -690,6 +823,10 @@ static int tegra_dc_drm_init(struct host1x_client *client,
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
index 99977b5..ccfc220 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -359,7 +359,7 @@
 #define DC_WIN_BLEND_1WIN			0x710
 #define DC_WIN_BLEND_2WIN_X			0x711
 #define DC_WIN_BLEND_2WIN_Y			0x712
-#define DC_WIN_BLEND32WIN_XY			0x713
+#define DC_WIN_BLEND_3WIN_XY			0x713
 
 #define DC_WIN_HP_FETCH_CONTROL			0x714
 
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 056a6d9..d7ab6bc 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -31,6 +31,11 @@ static inline struct tegra_framebuffer *to_tegra_fb(struct drm_framebuffer *fb)
 	return container_of(fb, struct tegra_framebuffer, base);
 }
 
+static inline unsigned long tegra_framebuffer_base(struct drm_framebuffer *fb)
+{
+	return to_tegra_fb(fb)->obj->paddr;
+}
+
 struct host1x {
 	struct drm_device *drm;
 	struct device *dev;
@@ -121,6 +126,30 @@ static inline unsigned long tegra_dc_readl(struct tegra_dc *dc,
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
+	unsigned int stride;
+	unsigned long base;
+};
+
+/* from dc.c */
+extern unsigned int tegra_dc_format(uint32_t format);
+extern int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
+				 const struct tegra_dc_window *window);
+
 struct display {
 	unsigned int width;
 	unsigned int height;
-- 
1.8.1
