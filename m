From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] drm/tegra: Restore opaque and drop alpha formats
 on Tegra20/30
Date: Wed, 20 Dec 2017 19:01:19 +0100
Message-ID: <20171220180119.GB8780@ulmo>
References: <cover.1513783738.git.digetx@gmail.com>
 <0476e28d70b47ec599fb65d1cfa457276629de27.1513783738.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0476e28d70b47ec599fb65d1cfa457276629de27.1513783738.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2017 at 06:46:11PM +0300, Dmitry Osipenko wrote:
> Commit 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats") broke
> DRM's MODE_ADDFB IOCTL on Tegra20/30, because IOCTL uses XRGB format if
> requested FB depth is 24bpp. As a result, Xorg doesn't work anymore with
> both modesetting and opentegra drivers. On older Tegra's each plane has
> a blending configuration which should be used to enable / disable alpha
> blending and right now the blending configs are hardcoded to disabled
> alpha blending. In order to support alpha formats properly, planes
> blending configuration must be adjusted, until then the alpha formats
> are equal to non-alpha.
>=20
> Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c    | 29 ++++++++++++++++++-----------
>  drivers/gpu/drm/tegra/dc.h    |  1 +
>  drivers/gpu/drm/tegra/fb.c    | 13 -------------
>  drivers/gpu/drm/tegra/hub.c   |  3 ++-
>  drivers/gpu/drm/tegra/plane.c | 22 +++++++++++++++++-----
>  drivers/gpu/drm/tegra/plane.h |  2 +-
>  6 files changed, 39 insertions(+), 31 deletions(-)

This kept bugging me, so I spent some time looking at the blending
programming. I came up with the attached patch which seems to work
for all scenarios and is fairly similar to your patch. It has the
added benefit that we can keep support for more formats.

Any comments?

Thierry
--- >8 ---
=46rom 3d2b7d1a9b8239dc6940477d8783461ac60783bc Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
---
 drivers/gpu/drm/tegra/dc.c    | 74 ++++++++++++++++++++++++++++++++++-----=
----
 drivers/gpu/drm/tegra/dc.h    | 13 ++++++++
 drivers/gpu/drm/tegra/fb.c    | 12 -------
 drivers/gpu/drm/tegra/plane.c | 41 ++++++++++++++++++++++++
 drivers/gpu/drm/tegra/plane.h |  3 ++
 5 files changed, 116 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index bc65c314e00f..07c687d7f615 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -168,32 +168,46 @@ static inline u32 compute_initial_dda(unsigned int in)
 	return dfixed_frac(inf);
 }
=20
-static void tegra_plane_setup_blending_legacy(struct tegra_plane *plane)
+static void
+tegra_plane_setup_blending_legacy(struct tegra_plane *plane,
+				  const struct tegra_dc_window *window)
 {
+	u32 foreground =3D BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255) |
+			 BLEND_COLOR_KEY_NONE;
+	u32 background =3D BLEND_WEIGHT1(0) | BLEND_WEIGHT0(0) |
+			 BLEND_COLOR_KEY_NONE;
+	u32 blendnokey =3D BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255);
+
+	/* enable alpha blending if window->alpha */
+	if (window->alpha) {
+		background |=3D BLEND_CONTROL_DEPENDENT;
+		foreground |=3D BLEND_CONTROL_ALPHA;
+	}
+
 	/*
 	 * Disable blending and assume Window A is the bottom-most window,
 	 * Window C is the top-most window and Window B is in the middle.
 	 */
-	tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_NOKEY);
-	tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_1WIN);
+	tegra_plane_writel(plane, blendnokey, DC_WIN_BLEND_NOKEY);
+	tegra_plane_writel(plane, foreground, DC_WIN_BLEND_1WIN);
=20
 	switch (plane->index) {
 	case 0:
-		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_2WIN_X);
-		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_2WIN_Y);
-		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_3WIN_XY);
+		tegra_plane_writel(plane, background, DC_WIN_BLEND_2WIN_X);
+		tegra_plane_writel(plane, background, DC_WIN_BLEND_2WIN_Y);
+		tegra_plane_writel(plane, background, DC_WIN_BLEND_3WIN_XY);
 		break;
=20
 	case 1:
-		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_2WIN_X);
-		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_2WIN_Y);
-		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_3WIN_XY);
+		tegra_plane_writel(plane, foreground, DC_WIN_BLEND_2WIN_X);
+		tegra_plane_writel(plane, background, DC_WIN_BLEND_2WIN_Y);
+		tegra_plane_writel(plane, background, DC_WIN_BLEND_3WIN_XY);
 		break;
=20
 	case 2:
-		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_2WIN_X);
-		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_2WIN_Y);
-		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_3WIN_XY);
+		tegra_plane_writel(plane, foreground, DC_WIN_BLEND_2WIN_X);
+		tegra_plane_writel(plane, foreground, DC_WIN_BLEND_2WIN_Y);
+		tegra_plane_writel(plane, foreground, DC_WIN_BLEND_3WIN_XY);
 		break;
 	}
 }
@@ -359,7 +373,7 @@ static void tegra_dc_setup_window(struct tegra_plane *p=
lane,
 	if (dc->soc->supports_blending) {
 		tegra_plane_setup_blending(plane, window);
 	} else {
-		tegra_plane_setup_blending_legacy(plane);
+		tegra_plane_setup_blending_legacy(plane, window);
 	}
 }
=20
@@ -370,6 +384,11 @@ static const u32 tegra20_primary_formats[] =3D {
 	DRM_FORMAT_RGBA5551,
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_ARGB8888,
+	/* non-native formats */
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGBX5551,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
 };
=20
 static const u32 tegra114_primary_formats[] =3D {
@@ -426,18 +445,37 @@ static int tegra_plane_atomic_check(struct drm_plane =
*plane,
 	struct tegra_bo_tiling *tiling =3D &plane_state->tiling;
 	struct tegra_plane *tegra =3D to_tegra_plane(plane);
 	struct tegra_dc *dc =3D to_tegra_dc(state->crtc);
+	unsigned int format;
 	int err;
=20
 	/* no need for further checks if the plane is being disabled */
 	if (!state->crtc)
 		return 0;
=20
-	err =3D tegra_plane_format(state->fb->format->format,
-				 &plane_state->format,
+	err =3D tegra_plane_format(state->fb->format->format, &format,
 				 &plane_state->swap);
 	if (err < 0)
 		return err;
=20
+	/*
+	 * Tegra20 and Tegra30 are special cases here because they support
+	 * only variants of specific formats with an alpha component, but not
+	 * the corresponding opaque formats. However, the opaque formats can
+	 * be emulated by disabling alpha blending for the plane.
+	 */
+	if (tegra_plane_format_is_opaque(format) &&
+	    !dc->soc->supports_blending) {
+		err =3D tegra_plane_format_get_alpha(format, &format);
+		if (err < 0)
+			return err;
+
+		plane_state->alpha =3D false;
+	} else {
+		plane_state->alpha =3D true;
+	}
+
+	plane_state->format =3D format;
+
 	err =3D tegra_fb_get_tiling(state->fb, tiling);
 	if (err < 0)
 		return err;
@@ -514,6 +552,7 @@ static void tegra_plane_atomic_update(struct drm_plane =
*plane,
 	window.zpos =3D plane->state->normalized_zpos;
 	window.tiling =3D state->tiling;
 	window.format =3D state->format;
+	window.alpha =3D state->alpha;
 	window.swap =3D state->swap;
=20
 	for (i =3D 0; i < fb->format->num_planes; i++) {
@@ -768,6 +807,11 @@ static const u32 tegra20_overlay_formats[] =3D {
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
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 0c887b53cb10..03b04a7e2814 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -151,6 +151,7 @@ struct tegra_dc_window {
=20
 	struct tegra_bo_tiling tiling;
 	u32 format;
+	bool alpha;
 	u32 swap;
 };
=20
@@ -667,8 +668,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define  SCALER_COEFF_DATA(x) (((x) & 0x3ff) << 0)
=20
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
=20
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 5f6289c4e56a..001cb77e2f59 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -254,18 +254,6 @@ static int tegra_fbdev_probe(struct drm_fb_helper *hel=
per,
 	cmd.pitches[0] =3D round_up(sizes->surface_width * bytes_per_pixel,
 				  tegra->pitch_align);
=20
-	/*
-	 * Early generations of Tegra (Tegra20 and Tegra30) do not support any
-	 * of the X* or *X formats, only their A* or *A equivalents. Force the
-	 * legacy framebuffer format to include an alpha component so that the
-	 * framebuffer emulation can be supported on all generations.
-	 */
-	if (sizes->surface_bpp =3D=3D 32 && sizes->surface_depth =3D=3D 24)
-		sizes->surface_depth =3D 32;
-
-	if (sizes->surface_bpp =3D=3D 16 && sizes->surface_depth =3D=3D 15)
-		sizes->surface_depth =3D 16;
-
 	cmd.pixel_format =3D drm_mode_legacy_fb_format(sizes->surface_bpp,
 						     sizes->surface_depth);
=20
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 215051579b3a..dfe991e3d48d 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -51,6 +51,7 @@ tegra_plane_atomic_duplicate_state(struct drm_plane *plan=
e)
 	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
 	copy->tiling =3D state->tiling;
 	copy->format =3D state->format;
+	copy->alpha =3D state->alpha;
 	copy->swap =3D state->swap;
=20
 	return &copy->base;
@@ -256,6 +257,46 @@ bool tegra_plane_format_is_yuv(unsigned int format, bo=
ol *planar)
 	return false;
 }
=20
+/*
+ * This is applicable to Tegra20 and Tegra30 only where the opaque formats=
 can
+ * be emulated using the alpha formats and blending disabled.
+ */
+bool tegra_plane_format_is_opaque(unsigned int format)
+{
+	switch (format) {
+	case WIN_COLOR_DEPTH_B5G5R5X1:
+	case WIN_COLOR_DEPTH_X1B5G5R5:
+	case WIN_COLOR_DEPTH_R8G8B8X8:
+	case WIN_COLOR_DEPTH_B8G8R8X8:
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
+		*alpha =3D WIN_COLOR_DEPTH_B5G5R5A;
+		return 0;
+
+	case WIN_COLOR_DEPTH_X1B5G5R5:
+		*alpha =3D WIN_COLOR_DEPTH_AB5G5R5;
+		return 0;
+
+	case WIN_COLOR_DEPTH_R8G8B8X8:
+		*alpha =3D WIN_COLOR_DEPTH_R8G8B8A8;
+		return 0;
+
+	case WIN_COLOR_DEPTH_B8G8R8X8:
+		*alpha =3D WIN_COLOR_DEPTH_B8G8R8A8;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 void tegra_plane_get(struct tegra_plane *plane)
 {
 	mutex_lock(&plane->lock);
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index 429a086ffe88..06d8b0005fe7 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -48,6 +48,7 @@ struct tegra_plane_state {
=20
 	struct tegra_bo_tiling tiling;
 	u32 format;
+	bool alpha;
 	u32 swap;
 };
=20
@@ -69,6 +70,8 @@ int tegra_plane_state_add(struct tegra_plane *plane,
=20
 int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap);
 bool tegra_plane_format_is_yuv(unsigned int format, bool *planar);
+bool tegra_plane_format_is_opaque(unsigned int format);
+int tegra_plane_format_get_alpha(unsigned int opaque, unsigned int *alpha);
=20
 void tegra_plane_get(struct tegra_plane *plane);
 void tegra_plane_put(struct tegra_plane *plane);
--=20
2.15.1


--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo6pWwACgkQ3SOs138+
s6GSnQ//YrOgpz4bZ9j6Wj8N+RAZ8V4z2tanABoJca3yXJSBlK7oOFayQfQt+9FZ
DCpYwLausjY2yRvQXhDlWoLkOz+UxRWK9fli497RhbZ0BelPyacTc9mhVNWAbblV
aRaCWd1NCf/Q1eX2YG2sOul3HnBbVCO5SeHwbLTjAs493X8ZeS+ZLStUqbl6b5SW
/lY9WiTxWXndTKfsiLPpUmKJL2Ra2ziIDqOWNSRXcoQvUd++JbGcKzmuNm+8R5FC
B6CBMcA8LBH7wSlEZx4lIGLYbonXeufOm4WpmmYNF6bl0qQA2xAw7R2ASIJVVfse
+rW3lYxEMUsJ1p5HuBQvfXqBmbGhwSWiNMaqDe8/FuZ9fhuhSJVQIW/fw2rCDm3D
lpPbW8quaXeRNS+PLTwGguDJY1wF6azLUAopTj5isgxnt2NbOv66BEHVK8R87Fcm
R+zpThGEfPvnLNylBrt9XQa1I//Ssb694M+wd+52W2HzL3V/evDWQdNJ6fsMdYXh
uFB8BGcnpr5g0Kch6t5vcRA+PWsUEmJ3dpYdlHFcfLL41XiQeLtmr0or/ROcGe2R
jfcbMFiAmfgYtNh02M00olTQFNblNeFqWJOivhK8MQSLeFxZK5Ta8qZcIc8aHNw+
2WCJjwDTnHsPrGZv8l4yQIPJ4bK53ii4wOIADNX+YxtrpXI4iQE=
=llkQ
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
