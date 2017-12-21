From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/tegra: dc: Implement legacy blending
Date: Fri, 22 Dec 2017 02:52:37 +0300
Message-ID: <5b219dc7-3912-9c3a-0135-c8d2860d0003@gmail.com>
References: <20171221140317.18447-1-thierry.reding@gmail.com>
 <3ccf0299-95d9-0c46-dd86-de16434b6e42@gmail.com>
 <cffaa2f8-42f4-557f-1824-a42fdca54aaa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cffaa2f8-42f4-557f-1824-a42fdca54aaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 21.12.2017 22:13, Dmitry Osipenko wrote:
> On 21.12.2017 21:46, Dmitry Osipenko wrote:
>> On 21.12.2017 17:03, Thierry Reding wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> This implements alpha blending on legacy display controllers (Tegra20,
>>> Tegra30 and Tegra114). While it's theoretically possible to support the
>>> zpos property to enable userspace to specify the Z-order of each plane
>>> individually, this is not currently supported and the same fixed Z-
>>> order as previously defined is used.
>>>
>>> Reverts commit 71835caa00e8 ("drm/tegra: fb: Force alpha formats") since
>>> the opaque formats are now supported.
>>>
>>> Reported-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
> 
> [snip]
> 
>>> +
>>> +void tegra_plane_check_dependent(struct tegra_plane *tegra,
>>> +				 struct tegra_plane_state *state)
>>> +{
>>> +	struct drm_plane_state *old, *new;
>>> +	struct drm_plane *plane;
>>> +	unsigned int zpos[2];
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < 3; i++)
>>> +		state->dependent[i] = false;
>>> +
>>> +	for (i = 0; i < 2; i++)
>>> +		zpos[i] = 0;
>>> +
>>> +	for_each_oldnew_plane_in_state(state->base.state, plane, old, new, i) {
>>
>> Somehow this works when 2 windows are blended (primary plane + cursor). But
>> unfortunately this doesn't work at all in a case when 3 windows blended (primary
>> + video overlay + cursor), for some reason there is only one plane in the state
>> here, so blending dependency tracking doesn't work at all. I'll continue to look
>> into it, but for now I don't know why it doesn't work as expected. If you have
>> any idea, please tell.
> 
> Actually, I think this code only works when all planes are updated in a single
> commit. We need to handle cases when only some of the active planes are
> adjusting the state.
> 
> [snip]
> 

I've moved blending state to CRTC and now seems it is really working correctly.
I tried to run kms-planes-blend on my Intel desktop, but it crashes my machine
and so can't compare the result of the test, it looks correct though. Video
overlay + mouse cursor now working fine.

I've amended your patch, see it below.

---------------------------------------


From e5264125fb81757999f6b11fec0e7cfffb2ca6d6 Mon Sep 17 00:00:00 2001
From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Wed, 20 Dec 2017 09:39:14 +0100
Subject: [PATCH] drm/tegra: dc: Implement legacy blending

This implements alpha blending on legacy display controllers (Tegra20,
Tegra30 and Tegra114). While it's theoretically possible to support the
zpos property to enable userspace to specify the Z-order of each plane
individually, this is not currently supported and the same fixed Z-
order as previously defined is used.

Reverts commit 71835caa00e8 ("drm/tegra: fb: Force alpha formats") since
the opaque formats are now supported.

Reported-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c    |  90 ++++++++++++++++++--------
 drivers/gpu/drm/tegra/dc.h    |  21 ++++++
 drivers/gpu/drm/tegra/fb.c    |  12 ----
 drivers/gpu/drm/tegra/plane.c | 145 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/plane.h |   4 ++
 5 files changed, 233 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 2a0c1e93f82e..fb7c0d211ac0 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -154,32 +154,12 @@ static inline u32 compute_initial_dda(unsigned int in)

 static void tegra_plane_setup_blending_legacy(struct tegra_plane *plane)
 {
-	/*
-	 * Disable blending and assume Window A is the bottom-most window,
-	 * Window C is the top-most window and Window B is in the middle.
-	 */
-	tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_NOKEY);
-	tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_1WIN);
-
-	switch (plane->index) {
-	case 0:
-		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_2WIN_X);
-		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_2WIN_Y);
-		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_3WIN_XY);
-		break;
-
-	case 1:
-		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_2WIN_X);
-		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_2WIN_Y);
-		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_3WIN_XY);
-		break;
+	u32 foreground = BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255) |
+			 BLEND_COLOR_KEY_NONE;
+	u32 blendnokey = BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255);

-	case 2:
-		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_2WIN_X);
-		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_2WIN_Y);
-		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_3WIN_XY);
-		break;
-	}
+	tegra_plane_writel(plane, blendnokey, DC_WIN_BLEND_NOKEY);
+	tegra_plane_writel(plane, foreground, DC_WIN_BLEND_1WIN);
 }

 static void tegra_plane_setup_blending(struct tegra_plane *plane,
@@ -353,6 +333,11 @@ static const u32 tegra20_primary_formats[] = {
 	DRM_FORMAT_RGBA5551,
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_ARGB8888,
+	/* non-native formats */
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGBX5551,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
 };

 static const u32 tegra114_primary_formats[] = {
@@ -409,18 +394,38 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	struct tegra_bo_tiling *tiling = &plane_state->tiling;
 	struct tegra_plane *tegra = to_tegra_plane(plane);
 	struct tegra_dc *dc = to_tegra_dc(state->crtc);
+	unsigned int format;
 	int err;

 	/* no need for further checks if the plane is being disabled */
 	if (!state->crtc)
 		return 0;

-	err = tegra_plane_format(state->fb->format->format,
-				 &plane_state->format,
+	err = tegra_plane_format(state->fb->format->format, &format,
 				 &plane_state->swap);
 	if (err < 0)
 		return err;

+	/*
+	 * Tegra20 and Tegra30 are special cases here because they support
+	 * only variants of specific formats with an alpha component, but not
+	 * the corresponding opaque formats. However, the opaque formats can
+	 * be emulated by disabling alpha blending for the plane.
+	 */
+	if (!dc->soc->supports_blending) {
+		if (!tegra_plane_format_has_alpha(format)) {
+			err = tegra_plane_format_get_alpha(format, &format);
+			if (err < 0)
+				return err;
+		}
+
+		err = tegra_plane_update_blending_state(tegra, plane_state);
+		if (err < 0)
+			return err;
+	}
+
+	plane_state->format = format;
+
 	err = tegra_fb_get_tiling(state->fb, tiling);
 	if (err < 0)
 		return err;
@@ -737,6 +742,11 @@ static const u32 tegra20_overlay_formats[] = {
 	DRM_FORMAT_RGBA5551,
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_ARGB8888,
+	/* non-native formats */
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGBX5551,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
 	/* planar formats */
 	DRM_FORMAT_UYVY,
 	DRM_FORMAT_YUYV,
@@ -924,6 +934,7 @@ tegra_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 {
 	struct tegra_dc_state *state = to_dc_state(crtc->state);
 	struct tegra_dc_state *copy;
+	unsigned int i;

 	copy = kmalloc(sizeof(*copy), GFP_KERNEL);
 	if (!copy)
@@ -935,6 +946,9 @@ tegra_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 	copy->div = state->div;
 	copy->planes = state->planes;

+	for (i = 0; i < 3; i++)
+		copy->blend[i] = state->blend[i];
+
 	return &copy->base;
 }

@@ -1687,8 +1701,30 @@ static void tegra_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct tegra_dc_state *state = to_dc_state(crtc->state);
 	struct tegra_dc *dc = to_tegra_dc(crtc);
+	struct tegra_dc_blend_state *bs;
+	struct tegra_plane *plane;
+	struct drm_plane *p;
 	u32 value;

+	if (!dc->soc->supports_blending) {
+		drm_for_each_plane(p, crtc->dev) {
+			if (!(p->possible_crtcs & (1 << dc->pipe)))
+				continue;
+
+			plane = to_tegra_plane(p);
+			bs = &state->blend[plane->index];
+
+			tegra_plane_writel(plane, bs->to_win_x,
+					   DC_WIN_BLEND_2WIN_X);
+
+			tegra_plane_writel(plane,bs->to_win_y,
+					   DC_WIN_BLEND_2WIN_Y);
+
+			tegra_plane_writel(plane, bs->to_win_xy,
+					   DC_WIN_BLEND_3WIN_XY);
+		}
+	}
+
 	value = state->planes << 8 | GENERAL_UPDATE;
 	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
 	value = tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index e2831e96ea96..2bfe4d46f007 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -18,6 +18,13 @@

 struct tegra_output;

+struct tegra_dc_blend_state {
+	u32 to_win_x;
+	u32 to_win_y;
+	u32 to_win_xy;
+	bool opaque;
+};
+
 struct tegra_dc_state {
 	struct drm_crtc_state base;

@@ -26,6 +33,8 @@ struct tegra_dc_state {
 	unsigned int div;

 	u32 planes;
+
+	struct tegra_dc_blend_state blend[3];
 };

 static inline struct tegra_dc_state *to_dc_state(struct drm_crtc_state *state)
@@ -649,8 +658,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_WIN_DV_CONTROL			0x70e

 #define DC_WIN_BLEND_NOKEY			0x70f
+#define  BLEND_WEIGHT1(x) (((x) & 0xff) << 16)
+#define  BLEND_WEIGHT0(x) (((x) & 0xff) <<  8)
+
 #define DC_WIN_BLEND_1WIN			0x710
+#define  BLEND_CONTROL_FIX    (0 << 2)
+#define  BLEND_CONTROL_ALPHA  (1 << 2)
+#define  BLEND_COLOR_KEY_NONE (0 << 0)
+#define  BLEND_COLOR_KEY_0    (1 << 0)
+#define  BLEND_COLOR_KEY_1    (2 << 0)
+#define  BLEND_COLOR_KEY_BOTH (3 << 0)
+
 #define DC_WIN_BLEND_2WIN_X			0x711
+#define  BLEND_CONTROL_DEPENDENT (2 << 2)
+
 #define DC_WIN_BLEND_2WIN_Y			0x712
 #define DC_WIN_BLEND_3WIN_XY			0x713

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 1af4ef9241f1..e05fde7172f8 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -254,18 +254,6 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 	cmd.pitches[0] = round_up(sizes->surface_width * bytes_per_pixel,
 				  tegra->pitch_align);

-	/*
-	 * Early generations of Tegra (Tegra20 and Tegra30) do not support any
-	 * of the X* or *X formats, only their A* or *A equivalents. Force the
-	 * legacy framebuffer format to include an alpha component so that the
-	 * framebuffer emulation can be supported on all generations.
-	 */
-	if (sizes->surface_bpp == 32 && sizes->surface_depth == 24)
-		sizes->surface_depth = 32;
-
-	if (sizes->surface_bpp == 16 && sizes->surface_depth == 15)
-		sizes->surface_depth = 16;
-
 	cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 						     sizes->surface_depth);

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 9146aead973b..6877fba46984 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -238,3 +238,148 @@ bool tegra_plane_format_is_yuv(unsigned int format, bool
*planar)

 	return false;
 }
+
+static bool __drm_format_has_alpha(u32 format)
+{
+	switch (format) {
+	case DRM_FORMAT_ARGB4444:
+	case DRM_FORMAT_ARGB1555:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_ARGB8888:
+		return true;
+	}
+
+	return false;
+}
+
+/*
+ * This is applicable to Tegra20 and Tegra30 only where the opaque formats can
+ * be emulated using the alpha formats and alpha blending disabled.
+ */
+bool tegra_plane_format_has_alpha(unsigned int format)
+{
+	switch (format) {
+	case WIN_COLOR_DEPTH_B4G4R4A4:
+	case WIN_COLOR_DEPTH_A1B5G5R5:
+	case WIN_COLOR_DEPTH_B5G5R5A1:
+	case WIN_COLOR_DEPTH_R8G8B8A8:
+	case WIN_COLOR_DEPTH_B8G8R8A8:
+		return true;
+	}
+
+	return false;
+}
+
+int tegra_plane_format_get_alpha(unsigned int opaque, unsigned int *alpha)
+{
+	switch (opaque) {
+	case WIN_COLOR_DEPTH_B5G5R5X1:
+		*alpha = WIN_COLOR_DEPTH_B5G5R5A1;
+		return 0;
+
+	case WIN_COLOR_DEPTH_X1B5G5R5:
+		*alpha = WIN_COLOR_DEPTH_A1B5G5R5;
+		return 0;
+
+	case WIN_COLOR_DEPTH_R8G8B8X8:
+		*alpha = WIN_COLOR_DEPTH_R8G8B8A8;
+		return 0;
+
+	case WIN_COLOR_DEPTH_B8G8R8X8:
+		*alpha = WIN_COLOR_DEPTH_B8G8R8A8;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+int tegra_plane_update_blending_state(struct tegra_plane *tegra,
+				      struct tegra_plane_state *state)
+{
+	u32 blend_transparent = BLEND_WEIGHT1(0) | BLEND_WEIGHT0(0);
+	u32 blend_opaque = BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255);
+	struct tegra_dc_blend_state *blend_state;
+	struct tegra_dc_blend_state *win_a_state;
+	struct tegra_dc_blend_state *win_b_state;
+	struct tegra_dc_blend_state *win_c_state;
+	struct tegra_dc_state *dc_state;
+	struct drm_crtc_state *crtc_state;
+
+	crtc_state = drm_atomic_get_crtc_state(state->base.state,
+					       state->base.crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	dc_state = to_dc_state(crtc_state);
+	blend_state = &dc_state->blend[tegra->index];
+	blend_state->opaque = !__drm_format_has_alpha(
+					state->base.fb->format->format);
+
+	win_a_state = &dc_state->blend[0];
+	win_b_state = &dc_state->blend[1];
+	win_c_state = &dc_state->blend[2];
+
+	/* setup blending state for window A */
+
+	if (win_b_state->opaque) {
+		win_a_state->to_win_x = blend_transparent;
+	} else {
+		if (win_a_state->opaque)
+			win_a_state->to_win_x = BLEND_CONTROL_DEPENDENT;
+		else
+			win_a_state->to_win_x = BLEND_CONTROL_ALPHA;
+	}
+
+	if (win_c_state->opaque) {
+		win_a_state->to_win_y = blend_transparent;
+	} else {
+		if (win_a_state->opaque)
+			win_a_state->to_win_y = BLEND_CONTROL_DEPENDENT;
+		else
+			win_a_state->to_win_y = BLEND_CONTROL_ALPHA;
+	}
+
+	if (win_b_state->opaque || win_c_state->opaque) {
+		win_a_state->to_win_xy = blend_transparent;
+	} else {
+		if (win_a_state->opaque)
+			win_a_state->to_win_xy = BLEND_CONTROL_DEPENDENT;
+		else
+			win_a_state->to_win_xy = BLEND_CONTROL_ALPHA;
+	}
+
+	/* setup blending state for window B */
+
+	if (win_b_state->opaque)
+		win_b_state->to_win_x = blend_opaque;
+	else
+		win_b_state->to_win_x = BLEND_CONTROL_ALPHA;
+
+	if (win_c_state->opaque) {
+		win_b_state->to_win_y = blend_transparent;
+		win_b_state->to_win_xy = blend_transparent;
+	} else {
+		if (win_b_state->opaque) {
+			win_b_state->to_win_y = BLEND_CONTROL_DEPENDENT;
+			win_b_state->to_win_xy = BLEND_CONTROL_DEPENDENT;
+		} else {
+			win_b_state->to_win_y = BLEND_CONTROL_ALPHA;
+			win_b_state->to_win_xy = BLEND_CONTROL_ALPHA;
+		}
+	}
+
+	/* setup blending state for window C */
+
+	if (win_c_state->opaque) {
+		win_c_state->to_win_x = blend_opaque;
+		win_c_state->to_win_y = blend_opaque;
+		win_c_state->to_win_xy = blend_opaque;
+	} else {
+		win_c_state->to_win_x = BLEND_CONTROL_ALPHA;
+		win_c_state->to_win_y = BLEND_CONTROL_ALPHA;
+		win_c_state->to_win_xy = BLEND_CONTROL_ALPHA;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index dca66cb95d25..13d410099772 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -58,5 +58,9 @@ int tegra_plane_state_add(struct tegra_plane *plane,

 int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap);
 bool tegra_plane_format_is_yuv(unsigned int format, bool *planar);
+bool tegra_plane_format_has_alpha(unsigned int format);
+int tegra_plane_format_get_alpha(unsigned int opaque, unsigned int *alpha);
+int tegra_plane_update_blending_state(struct tegra_plane *tegra,
+				      struct tegra_plane_state *state);

 #endif /* TEGRA_PLANE_H */
-- 
2.15.1
