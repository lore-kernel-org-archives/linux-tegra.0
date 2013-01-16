From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: constify edid handling functions
Date: Wed, 16 Jan 2013 18:44:32 +0200
Message-ID: <20130116164432.GO3503@intel.com>
References: <1358347002-10999-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358347002-10999-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 16, 2013 at 03:36:41PM +0100, Lucas Stach wrote:
> All those functions only scan a predefined EDID block and have no nee=
d
> to alter anything. Constify the passed in struct edid pointer to refl=
ect
> this in the interface.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_edid.c | 73 ++++++++++++++++++++++++------------=
----------
>  include/drm/drm_crtc.h     | 10 +++----
>  include/drm/drm_edid.h     |  2 +-
>  3 files changed, 44 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 5a3770f..9564e15 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -71,7 +71,7 @@
> =20
>  struct detailed_mode_closure {
>  	struct drm_connector *connector;
> -	struct edid *edid;
> +	const struct edid *edid;
>  	bool preferred;
>  	u32 quirks;
>  	int modes;
> @@ -227,7 +227,7 @@ EXPORT_SYMBOL(drm_edid_block_valid);
>   *
>   * Sanity-check an entire EDID record (including extensions)
>   */
> -bool drm_edid_is_valid(struct edid *edid)
> +bool drm_edid_is_valid(const struct edid *edid)

This isn't quite right. This guy calls drm_edid_block_is_valid() which
can modify the EDID. Unfortunately the casts hide the problem, and you
don't get a warning :( I didn't check if that modification could be
elimnated.

Also there's a lot more in drm_edid.c that could be const. I've include=
d
a very quick patch (on top of yours) which undoes a few of the consts
you added, and adds a bunch more. If I compile it w/ -Wcast-qual, the
only warnings I get are from the list.h macros, so it would seem to be
mostly OK.

I had to change the way EDID_QUIRK_135_CLOCK_TOO_HIGH and
EDID_QUIRK_DETAILED_SYNC_PP are applied. Previously they would modify
the EDID itself, but I just made them modify the mode directly. Since
user space can see the raw EDID, this will affect user space too. So
perhaps some other solution would be needed. Possibly the quirks could
be applied in a separate step before the EDID is otherwise parsed.


=46rom 8ffe8d0fa8d2bed71adb372f14d5bf34e6687947 Mon Sep 17 00:00:00 200=
1
=46rom: =3D?UTF-8?q?Ville=3D20Syrj=3DC3=3DA4l=3DC3=3DA4?=3D <ville.syrj=
ala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Date: Wed, 16 Jan 2013 17:56:02 +0200
Subject: [PATCH] constify a lot more

---
 drivers/gpu/drm/drm_edid.c |  182 ++++++++++++++++++++++--------------=
--------
 include/drm/drm_crtc.h     |    8 +-
 include/drm/drm_edid.h     |    4 +-
 3 files changed, 98 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 9564e15..902800c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -227,7 +227,7 @@ EXPORT_SYMBOL(drm_edid_block_valid);
  *
  * Sanity-check an entire EDID record (including extensions)
  */
-bool drm_edid_is_valid(const struct edid *edid)
+bool drm_edid_is_valid(struct edid *edid)
 {
 	int i;
 	u8 *raw =3D (u8 *)edid;
@@ -559,38 +559,38 @@ struct drm_display_mode *drm_mode_find_dmt(struct=
 drm_device *dev,
 }
 EXPORT_SYMBOL(drm_mode_find_dmt);
=20
-typedef void detailed_cb(struct detailed_timing *timing, void *closure=
);
+typedef void detailed_cb(const struct detailed_timing *timing, void *c=
losure);
=20
 static void
-cea_for_each_detailed_block(u8 *ext, detailed_cb *cb, void *closure)
+cea_for_each_detailed_block(const u8 *ext, detailed_cb *cb, void *clos=
ure)
 {
 	int i, n =3D 0;
 	u8 d =3D ext[0x02];
-	u8 *det_base =3D ext + d;
+	const u8 *det_base =3D ext + d;
=20
 	n =3D (127 - d) / 18;
 	for (i =3D 0; i < n; i++)
-		cb((struct detailed_timing *)(det_base + 18 * i), closure);
+		cb((const struct detailed_timing *)(det_base + 18 * i), closure);
 }
=20
 static void
-vtb_for_each_detailed_block(u8 *ext, detailed_cb *cb, void *closure)
+vtb_for_each_detailed_block(const u8 *ext, detailed_cb *cb, void *clos=
ure)
 {
 	unsigned int i, n =3D min((int)ext[0x02], 6);
-	u8 *det_base =3D ext + 5;
+	const u8 *det_base =3D ext + 5;
=20
 	if (ext[0x01] !=3D 1)
 		return; /* unknown version */
=20
 	for (i =3D 0; i < n; i++)
-		cb((struct detailed_timing *)(det_base + 18 * i), closure);
+		cb((const struct detailed_timing *)(det_base + 18 * i), closure);
 }
=20
 static void
-drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closu=
re)
+drm_for_each_detailed_block(const u8 *raw_edid, detailed_cb *cb, void =
*closure)
 {
 	int i;
-	struct edid *edid =3D (struct edid *)raw_edid;
+	const struct edid *edid =3D (const struct edid *)raw_edid;
=20
 	if (edid =3D=3D NULL)
 		return;
@@ -599,7 +599,7 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_=
cb *cb, void *closure)
 		cb(&(edid->detailed_timings[i]), closure);
=20
 	for (i =3D 1; i <=3D raw_edid[0x7e]; i++) {
-		u8 *ext =3D raw_edid + (i * EDID_LENGTH);
+		const u8 *ext =3D raw_edid + (i * EDID_LENGTH);
 		switch (*ext) {
 		case CEA_EXT:
 			cea_for_each_detailed_block(ext, cb, closure);
@@ -614,9 +614,9 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_=
cb *cb, void *closure)
 }
=20
 static void
-is_rb(struct detailed_timing *t, void *data)
+is_rb(const struct detailed_timing *t, void *data)
 {
-	u8 *r =3D (u8 *)t;
+	const u8 *r =3D (const u8 *)t;
 	if (r[3] =3D=3D EDID_DETAIL_MONITOR_RANGE)
 		if (r[15] & 0x10)
 			*(bool *)data =3D true;
@@ -628,7 +628,7 @@ drm_monitor_supports_rb(const struct edid *edid)
 {
 	if (edid->revision >=3D 4) {
 		bool ret =3D false;
-		drm_for_each_detailed_block((u8 *)edid, is_rb, &ret);
+		drm_for_each_detailed_block((const u8 *)edid, is_rb, &ret);
 		return ret;
 	}
=20
@@ -636,51 +636,51 @@ drm_monitor_supports_rb(const struct edid *edid)
 }
=20
 static void
-find_gtf2(struct detailed_timing *t, void *data)
+find_gtf2(const struct detailed_timing *t, void *data)
 {
-	u8 *r =3D (u8 *)t;
+	const u8 *r =3D (const u8 *)t;
 	if (r[3] =3D=3D EDID_DETAIL_MONITOR_RANGE && r[10] =3D=3D 0x02)
-		*(u8 **)data =3D r;
+		*(const u8 **)data =3D r;
 }
=20
 /* Secondary GTF curve kicks in above some break frequency */
 static int
 drm_gtf2_hbreak(const struct edid *edid)
 {
-	u8 *r =3D NULL;
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
+	const u8 *r =3D NULL;
+	drm_for_each_detailed_block((const u8 *)edid, find_gtf2, &r);
 	return r ? (r[12] * 2) : 0;
 }
=20
 static int
 drm_gtf2_2c(const struct edid *edid)
 {
-	u8 *r =3D NULL;
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
+	const u8 *r =3D NULL;
+	drm_for_each_detailed_block((const u8 *)edid, find_gtf2, &r);
 	return r ? r[13] : 0;
 }
=20
 static int
 drm_gtf2_m(const struct edid *edid)
 {
-	u8 *r =3D NULL;
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
+	const u8 *r =3D NULL;
+	drm_for_each_detailed_block((const u8 *)edid, find_gtf2, &r);
 	return r ? (r[15] << 8) + r[14] : 0;
 }
=20
 static int
 drm_gtf2_k(const struct edid *edid)
 {
-	u8 *r =3D NULL;
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
+	const u8 *r =3D NULL;
+	drm_for_each_detailed_block((const u8 *)edid, find_gtf2, &r);
 	return r ? r[16] : 0;
 }
=20
 static int
 drm_gtf2_2j(const struct edid *edid)
 {
-	u8 *r =3D NULL;
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
+	const u8 *r =3D NULL;
+	drm_for_each_detailed_block((const u8 *)edid, find_gtf2, &r);
 	return r ? r[17] : 0;
 }
=20
@@ -838,7 +838,7 @@ drm_mode_std(struct drm_connector *connector, const=
 struct edid *edid,
  */
 static void
 drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
-			    struct detailed_pixel_timing *pt)
+			    const struct detailed_pixel_timing *pt)
 {
 	int i;
 	static const struct {
@@ -882,11 +882,11 @@ drm_mode_do_interlace_quirk(struct drm_display_mo=
de *mode,
  */
 static struct drm_display_mode *drm_mode_detailed(struct drm_device *d=
ev,
 						  const struct edid *edid,
-						  struct detailed_timing *timing,
+						  const struct detailed_timing *timing,
 						  u32 quirks)
 {
 	struct drm_display_mode *mode;
-	struct detailed_pixel_timing *pt =3D &timing->data.pixel_data;
+	const struct detailed_pixel_timing *pt =3D &timing->data.pixel_data;
 	unsigned hactive =3D (pt->hactive_hblank_hi & 0xf0) << 4 | pt->hactiv=
e_lo;
 	unsigned vactive =3D (pt->vactive_vblank_hi & 0xf0) << 4 | pt->vactiv=
e_lo;
 	unsigned hblank =3D (pt->hactive_hblank_hi & 0xf) << 8 | pt->hblank_l=
o;
@@ -928,9 +928,9 @@ static struct drm_display_mode *drm_mode_detailed(s=
truct drm_device *dev,
 		return NULL;
=20
 	if (quirks & EDID_QUIRK_135_CLOCK_TOO_HIGH)
-		timing->pixel_clock =3D cpu_to_le16(1088);
-
-	mode->clock =3D le16_to_cpu(timing->pixel_clock) * 10;
+		mode->clock =3D 10880;
+	else
+		mode->clock =3D le16_to_cpu(timing->pixel_clock) * 10;
=20
 	mode->hdisplay =3D hactive;
 	mode->hsync_start =3D mode->hdisplay + hsync_offset;
@@ -951,14 +951,14 @@ static struct drm_display_mode *drm_mode_detailed=
(struct drm_device *dev,
 	drm_mode_do_interlace_quirk(mode, pt);
=20
 	if (quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
-		pt->misc |=3D DRM_EDID_PT_HSYNC_POSITIVE | DRM_EDID_PT_VSYNC_POSITIV=
E;
+		mode->flags |=3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
+	} else {
+		mode->flags |=3D (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
+			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
+		mode->flags |=3D (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
+			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
 	}
=20
-	mode->flags |=3D (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
-		DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
-	mode->flags |=3D (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
-		DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
-
 set_size:
 	mode->width_mm =3D pt->width_mm_lo | (pt->width_height_mm_hi & 0xf0) =
<< 4;
 	mode->height_mm =3D pt->height_mm_lo | (pt->width_height_mm_hi & 0xf)=
 << 8;
@@ -981,7 +981,7 @@ set_size:
=20
 static bool
 mode_in_hsync_range(const struct drm_display_mode *mode,
-		    const struct edid *edid, u8 *t)
+		    const struct edid *edid, const u8 *t)
 {
 	int hsync, hmin, hmax;
=20
@@ -998,7 +998,7 @@ mode_in_hsync_range(const struct drm_display_mode *=
mode,
=20
 static bool
 mode_in_vsync_range(const struct drm_display_mode *mode,
-		    const struct edid *edid, u8 *t)
+		    const struct edid *edid, const u8 *t)
 {
 	int vsync, vmin, vmax;
=20
@@ -1014,7 +1014,7 @@ mode_in_vsync_range(const struct drm_display_mode=
 *mode,
 }
=20
 static u32
-range_pixel_clock(const struct edid *edid, u8 *t)
+range_pixel_clock(const struct edid *edid, const u8 *t)
 {
 	/* unspecified */
 	if (t[9] =3D=3D 0 || t[9] =3D=3D 255)
@@ -1030,10 +1030,10 @@ range_pixel_clock(const struct edid *edid, u8 *=
t)
=20
 static bool
 mode_in_range(const struct drm_display_mode *mode, const struct edid *=
edid,
-	      struct detailed_timing *timing)
+	      const struct detailed_timing *timing)
 {
 	u32 max_clock;
-	u8 *t =3D (u8 *)timing;
+	const u8 *t =3D (const u8 *)timing;
=20
 	if (!mode_in_hsync_range(mode, edid, t))
 		return false;
@@ -1059,7 +1059,7 @@ mode_in_range(const struct drm_display_mode *mode=
, const struct edid *edid,
 static bool valid_inferred_mode(const struct drm_connector *connector,
 				const struct drm_display_mode *mode)
 {
-	struct drm_display_mode *m;
+	const struct drm_display_mode *m;
 	bool ok =3D false;
=20
 	list_for_each_entry(m, &connector->probed_modes, head) {
@@ -1077,7 +1077,7 @@ static bool valid_inferred_mode(const struct drm_=
connector *connector,
 static int
 drm_dmt_modes_for_range(struct drm_connector *connector,
 			const struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes =3D 0;
 	struct drm_display_mode *newmode;
@@ -1113,7 +1113,7 @@ static void fixup_mode_1366x768(struct drm_displa=
y_mode *mode)
 static int
 drm_gtf_modes_for_range(struct drm_connector *connector,
 			const struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes =3D 0;
 	struct drm_display_mode *newmode;
@@ -1142,7 +1142,7 @@ drm_gtf_modes_for_range(struct drm_connector *con=
nector,
 static int
 drm_cvt_modes_for_range(struct drm_connector *connector,
 			const struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes =3D 0;
 	struct drm_display_mode *newmode;
@@ -1170,11 +1170,11 @@ drm_cvt_modes_for_range(struct drm_connector *c=
onnector,
 }
=20
 static void
-do_inferred_modes(struct detailed_timing *timing, void *c)
+do_inferred_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure =3D c;
-	struct detailed_non_pixel *data =3D &timing->data.other_data;
-	struct detailed_data_monitor_range *range =3D &data->data.range;
+	const struct detailed_non_pixel *data =3D &timing->data.other_data;
+	const struct detailed_data_monitor_range *range =3D &data->data.range=
;
=20
 	if (data->type !=3D EDID_DETAIL_MONITOR_RANGE)
 		return;
@@ -1215,18 +1215,18 @@ add_inferred_modes(struct drm_connector *connec=
tor, const struct edid *edid)
 	};
=20
 	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block((u8 *)edid, do_inferred_modes,
+		drm_for_each_detailed_block((const u8 *)edid, do_inferred_modes,
 					    &closure);
=20
 	return closure.modes;
 }
=20
 static int
-drm_est3_modes(struct drm_connector *connector, struct detailed_timing=
 *timing)
+drm_est3_modes(struct drm_connector *connector, const struct detailed_=
timing *timing)
 {
 	int i, j, m, modes =3D 0;
 	struct drm_display_mode *mode;
-	u8 *est =3D ((u8 *)timing) + 5;
+	const u8 *est =3D ((const u8 *)timing) + 5;
=20
 	for (i =3D 0; i < 6; i++) {
 		for (j =3D 7; j > 0; j--) {
@@ -1251,10 +1251,10 @@ drm_est3_modes(struct drm_connector *connector,=
 struct detailed_timing *timing)
 }
=20
 static void
-do_established_modes(struct detailed_timing *timing, void *c)
+do_established_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure =3D c;
-	struct detailed_non_pixel *data =3D &timing->data.other_data;
+	const struct detailed_non_pixel *data =3D &timing->data.other_data;
=20
 	if (data->type =3D=3D EDID_DETAIL_EST_TIMINGS)
 		closure->modes +=3D drm_est3_modes(closure->connector, timing);
@@ -1291,24 +1291,24 @@ add_established_modes(struct drm_connector *con=
nector, const struct edid *edid)
 	}
=20
 	if (version_greater(edid, 1, 0))
-		    drm_for_each_detailed_block((u8 *)edid,
+		    drm_for_each_detailed_block((const u8 *)edid,
 						do_established_modes, &closure);
=20
 	return modes + closure.modes;
 }
=20
 static void
-do_standard_modes(struct detailed_timing *timing, void *c)
+do_standard_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure =3D c;
-	struct detailed_non_pixel *data =3D &timing->data.other_data;
+	const struct detailed_non_pixel *data =3D &timing->data.other_data;
 	struct drm_connector *connector =3D closure->connector;
 	const struct edid *edid =3D closure->edid;
=20
 	if (data->type =3D=3D EDID_DETAIL_STD_MODES) {
 		int i;
 		for (i =3D 0; i < 6; i++) {
-			struct std_timing *std;
+			const struct std_timing *std;
 			struct drm_display_mode *newmode;
=20
 			std =3D &data->data.timings[i];
@@ -1350,7 +1350,7 @@ add_standard_modes(struct drm_connector *connecto=
r, const struct edid *edid)
 	}
=20
 	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block((u8 *)edid, do_standard_modes,
+		drm_for_each_detailed_block((const u8 *)edid, do_standard_modes,
 					    &closure);
=20
 	/* XXX should also look for standard codes in VTB blocks */
@@ -1359,12 +1359,12 @@ add_standard_modes(struct drm_connector *connec=
tor, const struct edid *edid)
 }
=20
 static int drm_cvt_modes(struct drm_connector *connector,
-			 struct detailed_timing *timing)
+			 const struct detailed_timing *timing)
 {
 	int i, j, modes =3D 0;
 	struct drm_display_mode *newmode;
 	struct drm_device *dev =3D connector->dev;
-	struct cvt_timing *cvt;
+	const struct cvt_timing *cvt;
 	const int rates[] =3D { 60, 85, 75, 60, 50 };
 	const u8 empty[3] =3D { 0, 0, 0 };
=20
@@ -1408,10 +1408,10 @@ static int drm_cvt_modes(struct drm_connector *=
connector,
 }
=20
 static void
-do_cvt_mode(struct detailed_timing *timing, void *c)
+do_cvt_mode(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure =3D c;
-	struct detailed_non_pixel *data =3D &timing->data.other_data;
+	const struct detailed_non_pixel *data =3D &timing->data.other_data;
=20
 	if (data->type =3D=3D EDID_DETAIL_CVT_3BYTE)
 		closure->modes +=3D drm_cvt_modes(closure->connector, timing);
@@ -1425,7 +1425,7 @@ add_cvt_modes(struct drm_connector *connector, co=
nst struct edid *edid)
 	};
=20
 	if (version_greater(edid, 1, 2))
-		drm_for_each_detailed_block((u8 *)edid, do_cvt_mode, &closure);
+		drm_for_each_detailed_block((const u8 *)edid, do_cvt_mode, &closure)=
;
=20
 	/* XXX should also look for CVT codes in VTB blocks */
=20
@@ -1433,7 +1433,7 @@ add_cvt_modes(struct drm_connector *connector, co=
nst struct edid *edid)
 }
=20
 static void
-do_detailed_mode(struct detailed_timing *timing, void *c)
+do_detailed_mode(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure =3D c;
 	struct drm_display_mode *newmode;
@@ -1476,7 +1476,7 @@ add_detailed_modes(struct drm_connector *connecto=
r, const struct edid *edid,
 		closure.preferred =3D
 		    (edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
=20
-	drm_for_each_detailed_block((u8 *)edid, do_detailed_mode, &closure);
+	drm_for_each_detailed_block((const u8 *)edid, do_detailed_mode, &clos=
ure);
=20
 	return closure.modes;
 }
@@ -1493,9 +1493,9 @@ add_detailed_modes(struct drm_connector *connecto=
r, const struct edid *edid,
 /**
  * Search EDID for CEA extension block.
  */
-u8 *drm_find_cea_extension(const struct edid *edid)
+const u8 *drm_find_cea_extension(const struct edid *edid)
 {
-	u8 *edid_ext =3D NULL;
+	const u8 *edid_ext =3D NULL;
 	int i;
=20
 	/* No EDID or EDID extensions */
@@ -1504,7 +1504,7 @@ u8 *drm_find_cea_extension(const struct edid *edi=
d)
=20
 	/* Find CEA extension */
 	for (i =3D 0; i < edid->extensions; i++) {
-		edid_ext =3D (u8 *)edid + EDID_LENGTH * (i + 1);
+		edid_ext =3D (const u8 *)edid + EDID_LENGTH * (i + 1);
 		if (edid_ext[0] =3D=3D CEA_EXT)
 			break;
 	}
@@ -1520,13 +1520,13 @@ EXPORT_SYMBOL(drm_find_cea_extension);
  * Looks for a CEA mode matching given drm_display_mode.
  * Returns its CEA Video ID code, or 0 if not found.
  */
-u8 drm_match_cea_mode(struct drm_display_mode *to_match)
+u8 drm_match_cea_mode(const struct drm_display_mode *to_match)
 {
-	struct drm_display_mode *cea_mode;
+	const struct drm_display_mode *cea_mode;
 	u8 mode;
=20
 	for (mode =3D 0; mode < drm_num_cea_modes; mode++) {
-		cea_mode =3D (struct drm_display_mode *)&edid_cea_modes[mode];
+		cea_mode =3D (const struct drm_display_mode *)&edid_cea_modes[mode];
=20
 		if (drm_mode_equal(to_match, cea_mode))
 			return mode + 1;
@@ -1537,10 +1537,11 @@ EXPORT_SYMBOL(drm_match_cea_mode);
=20
=20
 static int
-do_cea_modes (struct drm_connector *connector, u8 *db, u8 len)
+do_cea_modes (struct drm_connector *connector, const u8 *db, u8 len)
 {
 	struct drm_device *dev =3D connector->dev;
-	u8 * mode, cea_mode;
+	const u8 * mode;
+	u8 cea_mode;
 	int modes =3D 0;
=20
 	for (mode =3D db; mode < db + len; mode++) {
@@ -1596,8 +1597,9 @@ cea_db_offsets(const u8 *cea, int *start, int *en=
d)
 static int
 add_cea_modes(struct drm_connector *connector, const struct edid *edid=
)
 {
-	u8 * cea =3D drm_find_cea_extension(edid);
-	u8 * db, dbl;
+	const u8 *cea =3D drm_find_cea_extension(edid);
+	const u8 *db;
+	u8 dbl;
 	int modes =3D 0;
=20
 	if (cea && cea_revision(cea) >=3D 3) {
@@ -1658,10 +1660,10 @@ parse_hdmi_vsdb(struct drm_connector *connector=
, const u8 *db)
 }
=20
 static void
-monitor_name(struct detailed_timing *t, void *data)
+monitor_name(const struct detailed_timing *t, void *data)
 {
 	if (t->data.other_data.type =3D=3D EDID_DETAIL_MONITOR_NAME)
-		*(u8 **)data =3D t->data.other_data.data.str.str;
+		*(const u8 **)data =3D t->data.other_data.data.str.str;
 }
=20
 static bool cea_db_is_hdmi_vsdb(const u8 *db)
@@ -1693,9 +1695,9 @@ static bool cea_db_is_hdmi_vsdb(const u8 *db)
 void drm_edid_to_eld(struct drm_connector *connector, const struct edi=
d *edid)
 {
 	uint8_t *eld =3D connector->eld;
-	u8 *cea;
-	u8 *name;
-	u8 *db;
+	const u8 *cea;
+	const u8 *name;
+	const u8 *db;
 	int sad_count =3D 0;
 	int mnl;
 	int dbl;
@@ -1709,7 +1711,7 @@ void drm_edid_to_eld(struct drm_connector *connec=
tor, const struct edid *edid)
 	}
=20
 	name =3D NULL;
-	drm_for_each_detailed_block((u8 *)edid, monitor_name, &name);
+	drm_for_each_detailed_block((const u8 *)edid, monitor_name, &name);
 	for (mnl =3D 0; name && mnl < 13; mnl++) {
 		if (name[mnl] =3D=3D 0x0a)
 			break;
@@ -1771,8 +1773,8 @@ EXPORT_SYMBOL(drm_edid_to_eld);
  * @connector: connector associated with the HDMI/DP sink
  * @mode: the display mode
  */
-int drm_av_sync_delay(struct drm_connector *connector,
-		      struct drm_display_mode *mode)
+int drm_av_sync_delay(const struct drm_connector *connector,
+		      const struct drm_display_mode *mode)
 {
 	int i =3D !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	int a, v;
@@ -1835,7 +1837,7 @@ EXPORT_SYMBOL(drm_select_eld);
  */
 bool drm_detect_hdmi_monitor(const struct edid *edid)
 {
-	u8 *edid_ext;
+	const u8 *edid_ext;
 	int i;
 	int start_offset, end_offset;
=20
@@ -1871,7 +1873,7 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
  */
 bool drm_detect_monitor_audio(const struct edid *edid)
 {
-	u8 *edid_ext;
+	const u8 *edid_ext;
 	int i, j;
 	bool has_audio =3D false;
 	int start_offset, end_offset;
@@ -1916,7 +1918,7 @@ EXPORT_SYMBOL(drm_detect_monitor_audio);
 static void drm_add_display_info(const struct edid *edid,
 				 struct drm_display_info *info)
 {
-	u8 *edid_ext;
+	const u8 *edid_ext;
=20
 	info->width_mm =3D edid->width_cm * 10;
 	info->height_mm =3D edid->height_cm * 10;
@@ -1989,7 +1991,7 @@ static void drm_add_display_info(const struct edi=
d *edid,
  *
  * Return number of modes added or 0 if we couldn't find any.
  */
-int drm_add_edid_modes(struct drm_connector *connector, const struct e=
did *edid)
+int drm_add_edid_modes(struct drm_connector *connector, struct edid *e=
did)
 {
 	int num_modes =3D 0;
 	u32 quirks;
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 9b2198b..50c17b9 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -882,7 +882,7 @@ extern int drm_mode_group_init_legacy_group(struct =
drm_device *dev, struct drm_m
 extern bool drm_probe_ddc(struct i2c_adapter *adapter);
 extern struct edid *drm_get_edid(struct drm_connector *connector,
 				 struct i2c_adapter *adapter);
-extern int drm_add_edid_modes(struct drm_connector *connector, const s=
truct edid *edid);
+extern int drm_add_edid_modes(struct drm_connector *connector, struct =
edid *edid);
 extern void drm_mode_probed_add(struct drm_connector *connector, struc=
t drm_display_mode *mode);
 extern void drm_mode_remove(struct drm_connector *connector, struct dr=
m_display_mode *mode);
 extern void drm_mode_copy(struct drm_display_mode *dst, const struct d=
rm_display_mode *src);
@@ -1029,8 +1029,8 @@ extern int drm_mode_gamma_get_ioctl(struct drm_de=
vice *dev,
 				    void *data, struct drm_file *file_priv);
 extern int drm_mode_gamma_set_ioctl(struct drm_device *dev,
 				    void *data, struct drm_file *file_priv);
-extern u8 *drm_find_cea_extension(const struct edid *edid);
-extern u8 drm_match_cea_mode(struct drm_display_mode *to_match);
+extern const u8 *drm_find_cea_extension(const struct edid *edid);
+extern u8 drm_match_cea_mode(const struct drm_display_mode *to_match);
 extern bool drm_detect_hdmi_monitor(const struct edid *edid);
 extern bool drm_detect_monitor_audio(const struct edid *edid);
 extern int drm_mode_page_flip_ioctl(struct drm_device *dev,
@@ -1051,7 +1051,7 @@ extern uint8_t drm_mode_cea_vic(const struct drm_=
display_mode *mode);
=20
 extern int drm_edid_header_is_valid(const u8 *raw_edid);
 extern bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_b=
ad_edid);
-extern bool drm_edid_is_valid(const struct edid *edid);
+extern bool drm_edid_is_valid(struct edid *edid);
 struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
 					   int hsize, int vsize, int fresh,
 					   bool rb);
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 464ae2b..1e0ab69 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -248,8 +248,8 @@ struct drm_encoder;
 struct drm_connector;
 struct drm_display_mode;
 void drm_edid_to_eld(struct drm_connector *connector, const struct edi=
d *edid);
-int drm_av_sync_delay(struct drm_connector *connector,
-		      struct drm_display_mode *mode);
+int drm_av_sync_delay(const struct drm_connector *connector,
+		      const struct drm_display_mode *mode);
 struct drm_connector *drm_select_eld(struct drm_encoder *encoder,
 				     struct drm_display_mode *mode);
 int drm_load_edid_firmware(struct drm_connector *connector);
--=20
1.7.8.6

--=20
Ville Syrj=E4l=E4
Intel OTC
