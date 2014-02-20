From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 2/5] drm/dp: Add drm_dp_dpcd_read_link_status()
Date: Thu, 20 Feb 2014 16:55:31 +0100
Message-ID: <1392911734-6689-3-git-send-email-thierry.reding@gmail.com>
References: <1392911734-6689-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392911734-6689-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The function reads the link status (6 bytes starting at offset 0x202)
from the DPCD so that it can be conveniently passed to other DPCD
helpers.

Reviewed-by: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Reviewed-by: Jani Nikula <jani.nikula-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/drm_dp_helper.c | 16 ++++++++++++++++
 include/drm/drm_dp_helper.h     |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index da6bcfe178a6..84262ed64ce7 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -456,3 +456,19 @@ ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
 				  size);
 }
 EXPORT_SYMBOL(drm_dp_dpcd_write);
+
+/**
+ * drm_dp_dpcd_read_link_status() - read DPCD link status (bytes 0x202-0x207)
+ * @aux: DisplayPort AUX channel
+ * @status: buffer to store the link status in (must be at least 6 bytes)
+ *
+ * Returns the number of bytes transferred on success or a negative error
+ * code on failure.
+ */
+int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
+				 u8 status[DP_LINK_STATUS_SIZE])
+{
+	return drm_dp_dpcd_read(aux, DP_LANE0_1_STATUS, status,
+				DP_LINK_STATUS_SIZE);
+}
+EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 0eb29f089e61..8759ce6ce97f 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -487,4 +487,7 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
 	return drm_dp_dpcd_write(aux, offset, &value, 1);
 }
 
+int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
+				 u8 status[DP_LINK_STATUS_SIZE]);
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
1.8.4.2
