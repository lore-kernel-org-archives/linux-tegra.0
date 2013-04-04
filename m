From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 2/3] drm/tegra: Support the XBGR8888 pixelformat
Date: Thu,  4 Apr 2013 16:09:19 +0200
Message-ID: <1365084560-11069-3-git-send-email-thierry.reding@avionic-design.de>
References: <1365084560-11069-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365084560-11069-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

While at it, also include the RGB565 pixelformat in the list of formats
supported by overlays.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/host1x/drm/dc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/host1x/drm/dc.c b/drivers/gpu/host1x/drm/dc.c
index edfe0ee..14a09a4 100644
--- a/drivers/gpu/host1x/drm/dc.c
+++ b/drivers/gpu/host1x/drm/dc.c
@@ -108,7 +108,9 @@ static const struct drm_plane_funcs tegra_plane_funcs = {
 };
 
 static const uint32_t plane_formats[] = {
+	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_RGB565,
 	DRM_FORMAT_UYVY,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV422,
@@ -546,6 +548,9 @@ int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 unsigned int tegra_dc_format(uint32_t format)
 {
 	switch (format) {
+	case DRM_FORMAT_XBGR8888:
+		return WIN_COLOR_DEPTH_R8G8B8A8;
+
 	case DRM_FORMAT_XRGB8888:
 		return WIN_COLOR_DEPTH_B8G8R8A8;
 
-- 
1.8.2
