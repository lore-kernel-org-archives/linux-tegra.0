From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2 1/2] drm: constify edid handling functions
Date: Wed, 16 Jan 2013 15:36:41 +0100
Message-ID: <1358347002-10999-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

All those functions only scan a predefined EDID block and have no need
to alter anything. Constify the passed in struct edid pointer to reflect
this in the interface.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/drm_edid.c | 73 ++++++++++++++++++++++++----------------------
 include/drm/drm_crtc.h     | 10 +++----
 include/drm/drm_edid.h     |  2 +-
 3 files changed, 44 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5a3770f..9564e15 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -71,7 +71,7 @@
 
 struct detailed_mode_closure {
 	struct drm_connector *connector;
-	struct edid *edid;
+	const struct edid *edid;
 	bool preferred;
 	u32 quirks;
 	int modes;
@@ -227,7 +227,7 @@ EXPORT_SYMBOL(drm_edid_block_valid);
  *
  * Sanity-check an entire EDID record (including extensions)
  */
-bool drm_edid_is_valid(struct edid *edid)
+bool drm_edid_is_valid(const struct edid *edid)
 {
 	int i;
 	u8 *raw = (u8 *)edid;
@@ -432,7 +432,7 @@ EXPORT_SYMBOL(drm_get_edid);
  *
  * Returns true if @vendor is in @edid, false otherwise
  */
-static bool edid_vendor(struct edid *edid, char *vendor)
+static bool edid_vendor(const struct edid *edid, char *vendor)
 {
 	char edid_vendor[3];
 
@@ -450,7 +450,7 @@ static bool edid_vendor(struct edid *edid, char *vendor)
  *
  * This tells subsequent routines what fixes they need to apply.
  */
-static u32 edid_get_quirks(struct edid *edid)
+static u32 edid_get_quirks(const struct edid *edid)
 {
 	struct edid_quirk *quirk;
 	int i;
@@ -624,7 +624,7 @@ is_rb(struct detailed_timing *t, void *data)
 
 /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
 static bool
-drm_monitor_supports_rb(struct edid *edid)
+drm_monitor_supports_rb(const struct edid *edid)
 {
 	if (edid->revision >= 4) {
 		bool ret = false;
@@ -645,7 +645,7 @@ find_gtf2(struct detailed_timing *t, void *data)
 
 /* Secondary GTF curve kicks in above some break frequency */
 static int
-drm_gtf2_hbreak(struct edid *edid)
+drm_gtf2_hbreak(const struct edid *edid)
 {
 	u8 *r = NULL;
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
@@ -653,7 +653,7 @@ drm_gtf2_hbreak(struct edid *edid)
 }
 
 static int
-drm_gtf2_2c(struct edid *edid)
+drm_gtf2_2c(const struct edid *edid)
 {
 	u8 *r = NULL;
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
@@ -661,7 +661,7 @@ drm_gtf2_2c(struct edid *edid)
 }
 
 static int
-drm_gtf2_m(struct edid *edid)
+drm_gtf2_m(const struct edid *edid)
 {
 	u8 *r = NULL;
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
@@ -669,7 +669,7 @@ drm_gtf2_m(struct edid *edid)
 }
 
 static int
-drm_gtf2_k(struct edid *edid)
+drm_gtf2_k(const struct edid *edid)
 {
 	u8 *r = NULL;
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
@@ -677,7 +677,7 @@ drm_gtf2_k(struct edid *edid)
 }
 
 static int
-drm_gtf2_2j(struct edid *edid)
+drm_gtf2_2j(const struct edid *edid)
 {
 	u8 *r = NULL;
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
@@ -688,7 +688,7 @@ drm_gtf2_2j(struct edid *edid)
  * standard_timing_level - get std. timing level(CVT/GTF/DMT)
  * @edid: EDID block to scan
  */
-static int standard_timing_level(struct edid *edid)
+static int standard_timing_level(const struct edid *edid)
 {
 	if (edid->revision >= 2) {
 		if (edid->revision >= 4 && (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF))
@@ -705,7 +705,7 @@ static int standard_timing_level(struct edid *edid)
  * monitors fill with ascii space (0x20) instead.
  */
 static int
-bad_std_timing(u8 a, u8 b)
+bad_std_timing(const u8 a, const u8 b)
 {
 	return (a == 0x00 && b == 0x00) ||
 	       (a == 0x01 && b == 0x01) ||
@@ -721,8 +721,8 @@ bad_std_timing(u8 a, u8 b)
  * and convert them into a real mode using CVT/GTF/DMT.
  */
 static struct drm_display_mode *
-drm_mode_std(struct drm_connector *connector, struct edid *edid,
-	     struct std_timing *t, int revision)
+drm_mode_std(struct drm_connector *connector, const struct edid *edid,
+	     const struct std_timing *t, int revision)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *m, *mode = NULL;
@@ -881,7 +881,7 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
  * return a new struct drm_display_mode.
  */
 static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
-						  struct edid *edid,
+						  const struct edid *edid,
 						  struct detailed_timing *timing,
 						  u32 quirks)
 {
@@ -981,7 +981,7 @@ set_size:
 
 static bool
 mode_in_hsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, u8 *t)
+		    const struct edid *edid, u8 *t)
 {
 	int hsync, hmin, hmax;
 
@@ -998,7 +998,7 @@ mode_in_hsync_range(const struct drm_display_mode *mode,
 
 static bool
 mode_in_vsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, u8 *t)
+		    const struct edid *edid, u8 *t)
 {
 	int vsync, vmin, vmax;
 
@@ -1014,7 +1014,7 @@ mode_in_vsync_range(const struct drm_display_mode *mode,
 }
 
 static u32
-range_pixel_clock(struct edid *edid, u8 *t)
+range_pixel_clock(const struct edid *edid, u8 *t)
 {
 	/* unspecified */
 	if (t[9] == 0 || t[9] == 255)
@@ -1029,7 +1029,7 @@ range_pixel_clock(struct edid *edid, u8 *t)
 }
 
 static bool
-mode_in_range(const struct drm_display_mode *mode, struct edid *edid,
+mode_in_range(const struct drm_display_mode *mode, const struct edid *edid,
 	      struct detailed_timing *timing)
 {
 	u32 max_clock;
@@ -1075,7 +1075,8 @@ static bool valid_inferred_mode(const struct drm_connector *connector,
 }
 
 static int
-drm_dmt_modes_for_range(struct drm_connector *connector, struct edid *edid,
+drm_dmt_modes_for_range(struct drm_connector *connector,
+			const struct edid *edid,
 			struct detailed_timing *timing)
 {
 	int i, modes = 0;
@@ -1110,7 +1111,8 @@ static void fixup_mode_1366x768(struct drm_display_mode *mode)
 }
 
 static int
-drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
+drm_gtf_modes_for_range(struct drm_connector *connector,
+			const struct edid *edid,
 			struct detailed_timing *timing)
 {
 	int i, modes = 0;
@@ -1138,7 +1140,8 @@ drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
 }
 
 static int
-drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
+drm_cvt_modes_for_range(struct drm_connector *connector,
+			const struct edid *edid,
 			struct detailed_timing *timing)
 {
 	int i, modes = 0;
@@ -1205,7 +1208,7 @@ do_inferred_modes(struct detailed_timing *timing, void *c)
 }
 
 static int
-add_inferred_modes(struct drm_connector *connector, struct edid *edid)
+add_inferred_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	struct detailed_mode_closure closure = {
 		connector, edid, 0, 0, 0
@@ -1265,7 +1268,7 @@ do_established_modes(struct detailed_timing *timing, void *c)
  * (defined above).  Tease them out and add them to the global modes list.
  */
 static int
-add_established_modes(struct drm_connector *connector, struct edid *edid)
+add_established_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	struct drm_device *dev = connector->dev;
 	unsigned long est_bits = edid->established_timings.t1 |
@@ -1300,7 +1303,7 @@ do_standard_modes(struct detailed_timing *timing, void *c)
 	struct detailed_mode_closure *closure = c;
 	struct detailed_non_pixel *data = &timing->data.other_data;
 	struct drm_connector *connector = closure->connector;
-	struct edid *edid = closure->edid;
+	const struct edid *edid = closure->edid;
 
 	if (data->type == EDID_DETAIL_STD_MODES) {
 		int i;
@@ -1327,7 +1330,7 @@ do_standard_modes(struct detailed_timing *timing, void *c)
  * GTF or CVT. Grab them from @edid and add them to the list.
  */
 static int
-add_standard_modes(struct drm_connector *connector, struct edid *edid)
+add_standard_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	int i, modes = 0;
 	struct detailed_mode_closure closure = {
@@ -1415,7 +1418,7 @@ do_cvt_mode(struct detailed_timing *timing, void *c)
 }
 
 static int
-add_cvt_modes(struct drm_connector *connector, struct edid *edid)
+add_cvt_modes(struct drm_connector *connector, const struct edid *edid)
 {	
 	struct detailed_mode_closure closure = {
 		connector, edid, 0, 0, 0
@@ -1458,7 +1461,7 @@ do_detailed_mode(struct detailed_timing *timing, void *c)
  * @quirks: quirks to apply
  */
 static int
-add_detailed_modes(struct drm_connector *connector, struct edid *edid,
+add_detailed_modes(struct drm_connector *connector, const struct edid *edid,
 		   u32 quirks)
 {
 	struct detailed_mode_closure closure = {
@@ -1490,7 +1493,7 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
 /**
  * Search EDID for CEA extension block.
  */
-u8 *drm_find_cea_extension(struct edid *edid)
+u8 *drm_find_cea_extension(const struct edid *edid)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -1591,7 +1594,7 @@ cea_db_offsets(const u8 *cea, int *start, int *end)
 	for ((i) = (start); (i) < (end) && (i) + cea_db_payload_len(&(cea)[(i)]) < (end); (i) += cea_db_payload_len(&(cea)[(i)]) + 1)
 
 static int
-add_cea_modes(struct drm_connector *connector, struct edid *edid)
+add_cea_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	u8 * cea = drm_find_cea_extension(edid);
 	u8 * db, dbl;
@@ -1687,7 +1690,7 @@ static bool cea_db_is_hdmi_vsdb(const u8 *db)
  * - HDCP
  * - Port_ID
  */
-void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
+void drm_edid_to_eld(struct drm_connector *connector, const struct edid *edid)
 {
 	uint8_t *eld = connector->eld;
 	u8 *cea;
@@ -1830,7 +1833,7 @@ EXPORT_SYMBOL(drm_select_eld);
  * Parse the CEA extension according to CEA-861-B.
  * Return true if HDMI, false if not or unknown.
  */
-bool drm_detect_hdmi_monitor(struct edid *edid)
+bool drm_detect_hdmi_monitor(const struct edid *edid)
 {
 	u8 *edid_ext;
 	int i;
@@ -1866,7 +1869,7 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
  * audio' is not defined in EDID.
  *
  */
-bool drm_detect_monitor_audio(struct edid *edid)
+bool drm_detect_monitor_audio(const struct edid *edid)
 {
 	u8 *edid_ext;
 	int i, j;
@@ -1910,7 +1913,7 @@ EXPORT_SYMBOL(drm_detect_monitor_audio);
  * structure that's part of the connector.  Useful for tracking bpp and
  * color spaces.
  */
-static void drm_add_display_info(struct edid *edid,
+static void drm_add_display_info(const struct edid *edid,
 				 struct drm_display_info *info)
 {
 	u8 *edid_ext;
@@ -1986,7 +1989,7 @@ static void drm_add_display_info(struct edid *edid,
  *
  * Return number of modes added or 0 if we couldn't find any.
  */
-int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
+int drm_add_edid_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	int num_modes = 0;
 	u32 quirks;
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 00d78b5..9b2198b 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -882,7 +882,7 @@ extern int drm_mode_group_init_legacy_group(struct drm_device *dev, struct drm_m
 extern bool drm_probe_ddc(struct i2c_adapter *adapter);
 extern struct edid *drm_get_edid(struct drm_connector *connector,
 				 struct i2c_adapter *adapter);
-extern int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
+extern int drm_add_edid_modes(struct drm_connector *connector, const struct edid *edid);
 extern void drm_mode_probed_add(struct drm_connector *connector, struct drm_display_mode *mode);
 extern void drm_mode_remove(struct drm_connector *connector, struct drm_display_mode *mode);
 extern void drm_mode_copy(struct drm_display_mode *dst, const struct drm_display_mode *src);
@@ -1029,10 +1029,10 @@ extern int drm_mode_gamma_get_ioctl(struct drm_device *dev,
 				    void *data, struct drm_file *file_priv);
 extern int drm_mode_gamma_set_ioctl(struct drm_device *dev,
 				    void *data, struct drm_file *file_priv);
-extern u8 *drm_find_cea_extension(struct edid *edid);
+extern u8 *drm_find_cea_extension(const struct edid *edid);
 extern u8 drm_match_cea_mode(struct drm_display_mode *to_match);
-extern bool drm_detect_hdmi_monitor(struct edid *edid);
-extern bool drm_detect_monitor_audio(struct edid *edid);
+extern bool drm_detect_hdmi_monitor(const struct edid *edid);
+extern bool drm_detect_monitor_audio(const struct edid *edid);
 extern int drm_mode_page_flip_ioctl(struct drm_device *dev,
 				    void *data, struct drm_file *file_priv);
 extern struct drm_display_mode *drm_cvt_mode(struct drm_device *dev,
@@ -1051,7 +1051,7 @@ extern uint8_t drm_mode_cea_vic(const struct drm_display_mode *mode);
 
 extern int drm_edid_header_is_valid(const u8 *raw_edid);
 extern bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid);
-extern bool drm_edid_is_valid(struct edid *edid);
+extern bool drm_edid_is_valid(const struct edid *edid);
 struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
 					   int hsize, int vsize, int fresh,
 					   bool rb);
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 0cac551..464ae2b 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -247,7 +247,7 @@ struct edid {
 struct drm_encoder;
 struct drm_connector;
 struct drm_display_mode;
-void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid);
+void drm_edid_to_eld(struct drm_connector *connector, const struct edid *edid);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      struct drm_display_mode *mode);
 struct drm_connector *drm_select_eld(struct drm_encoder *encoder,
-- 
1.8.0.2
