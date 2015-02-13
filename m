From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] drm/tegra: Add support for DRM_FORMAT_RGBA8888
Date: Fri, 13 Feb 2015 10:22:31 +0800
Message-ID: <1423794151-29614-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 3aaa84ae2681..bd635fd328c9 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -125,6 +125,12 @@ static int tegra_dc_format(u32 fourcc, u32 *format, u32 *swap)
 		*format = WIN_COLOR_DEPTH_R8G8B8A8;
 		break;
 
+	case DRM_FORMAT_RGBA8888:
+		*format = WIN_COLOR_DEPTH_R8G8B8A8;
+		if (swap)
+			*swap = BYTE_SWAP_SWAP4;
+		break;
+
 	case DRM_FORMAT_XRGB8888:
 		*format = WIN_COLOR_DEPTH_B8G8R8A8;
 		break;
-- 
1.8.1.5
