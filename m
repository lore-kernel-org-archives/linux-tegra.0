From: Emil Goode <emilgoode@gmail.com>
Subject: [PATCH] drm/tegra: Include header drm/drm.h
Date: Fri, 26 Apr 2013 19:49:51 +0200
Message-ID: <1366998591-8508-1-git-send-email-emilgoode@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, swarren@wwwdotorg.org
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Include definitions of used types by including drm/drm.h

Sparse output:
/usr/include/drm/tegra_drm.h:21:
	found __[us]{8,16,32,64} type without
	#include <linux/types.h>

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 include/uapi/drm/tegra_drm.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
index 6e132a2..73bde4e 100644
--- a/include/uapi/drm/tegra_drm.h
+++ b/include/uapi/drm/tegra_drm.h
@@ -17,6 +17,8 @@
 #ifndef _UAPI_TEGRA_DRM_H_
 #define _UAPI_TEGRA_DRM_H_
 
+#include <drm/drm.h>
+
 struct drm_tegra_gem_create {
 	__u64 size;
 	__u32 flags;
-- 
1.7.10.4
