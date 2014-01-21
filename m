From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 2/5] drm/dp: Add drm_dp_dpcd_read_link_status()
Date: Tue, 21 Jan 2014 20:24:20 +0100
Message-ID: <1390332263-11974-3-git-send-email-treding@nvidia.com>
References: <1390332263-11974-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390332263-11974-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

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
index 3e74ed93b19f..b26d46b00b05 100644
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
index c69c1dc1b741..8af695277a84 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -465,4 +465,7 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
 	return drm_dp_dpcd_write(aux, offset, &value, 1);
 }
 
+int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
+				 u8 status[DP_LINK_STATUS_SIZE]);
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
1.8.4.2
