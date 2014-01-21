From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 3/5] drm/dp: Add DisplayPort link helpers
Date: Tue, 21 Jan 2014 20:24:21 +0100
Message-ID: <1390332263-11974-4-git-send-email-treding@nvidia.com>
References: <1390332263-11974-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390332263-11974-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add a helper to probe a DP link (read out the supported DPCD revision,
maximum rate, link count and capabilities) as well as power up the DP
link and configure it accordingly.

Reviewed-by: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Reviewed-by: Jani Nikula <jani.nikula-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v4:
- fix a couple of typos in comments as pointed out by Alex Deucher

Changes in v3:
- split into drm_dp_link_power_up() and drm_dp_link_configure()
- do not change sink state for DPCD versions earlier than 1.1
- sleep for 1-2 ms after setting local sink to D0 state
- read and write consecutive registers where possible
- read DPCD revision when link is probed
- remove duplicate kerneldoc

 drivers/gpu/drm/drm_dp_helper.c | 94 +++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_dp_helper.h     | 17 ++++++++
 2 files changed, 111 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index b26d46b00b05..eea15b1414ed 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -472,3 +472,97 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				DP_LINK_STATUS_SIZE);
 }
 EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
+
+/**
+ * drm_dp_link_probe() - probe a DisplayPort link for capabilities
+ * @aux: DisplayPort AUX channel
+ * @link: pointer to structure in which to return link capabilities
+ *
+ * The structure filled in by this function can usually be passed directly
+ * into drm_dp_link_power_up() and drm_dp_link_configure() to power up and
+ * configure the link based on the link's capabilities.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
+{
+	u8 values[3];
+	int err;
+
+	memset(link, 0, sizeof(*link));
+
+	err = drm_dp_dpcd_read(aux, DP_DPCD_REV, values, sizeof(values));
+	if (err < 0)
+		return err;
+
+	link->revision = values[0];
+	link->rate = drm_dp_bw_code_to_link_rate(values[1]);
+	link->num_lanes = values[2] & DP_MAX_LANE_COUNT_MASK;
+
+	if (values[2] & DP_ENHANCED_FRAME_CAP)
+		link->capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
+
+	return 0;
+}
+
+/**
+ * drm_dp_link_power_up() - power up a DisplayPort link
+ * @aux: DisplayPort AUX channel
+ * @link: pointer to a structure containing the link configuration
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link)
+{
+	u8 value;
+	int err;
+
+	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
+	if (link->revision < 0x11)
+		return 0;
+
+	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
+	if (err < 0)
+		return err;
+
+	value &= ~DP_SET_POWER_MASK;
+	value |= DP_SET_POWER_D0;
+
+	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
+	if (err < 0)
+		return err;
+
+	/*
+	 * According to the DP 1.1 specification, a "Sink Device must exit the
+	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
+	 * Control Field" (register 0x600).
+	 */
+	usleep_range(1000, 2000);
+
+	return 0;
+}
+
+/**
+ * drm_dp_link_configure() - configure a DisplayPort link
+ * @aux: DisplayPort AUX channel
+ * @link: pointer to a structure containing the link configuration
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link)
+{
+	u8 values[2];
+	int err;
+
+	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
+	values[1] = link->num_lanes;
+
+	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
+		values[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
+
+	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, values, sizeof(values));
+	if (err < 0)
+		return err;
+
+	return 0;
+}
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 8af695277a84..c7b3c736c40a 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -291,6 +291,7 @@
 #define DP_SET_POWER                        0x600
 # define DP_SET_POWER_D0                    0x1
 # define DP_SET_POWER_D3                    0x2
+# define DP_SET_POWER_MASK                  0x3
 
 #define DP_PSR_ERROR_STATUS                 0x2006  /* XXX 1.2? */
 # define DP_PSR_LINK_CRC_ERROR              (1 << 0)
@@ -468,4 +469,20 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE]);
 
+/*
+ * DisplayPort link
+ */
+#define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
+
+struct drm_dp_link {
+	unsigned char revision;
+	unsigned int rate;
+	unsigned int num_lanes;
+	unsigned long capabilities;
+};
+
+int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link);
+int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link);
+int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link);
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
1.8.4.2
