From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] drm/tegra: Include linux/types.h
Date: Mon, 17 Jun 2013 13:58:14 +0200
Message-ID: <1371470294.26299.21.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

"make headers_check" complains about include/uapi/drm/tegra_drm.h:
    [...]/usr/include/drm/tegra_drm.h:21: found __[us]{8,16,32,64} type without #include <linux/types.h>

So let's include linux/types.h in this header.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Tested only with "make headers_check". I don't actually build or run
code that uses tegra_drm.h.

 include/uapi/drm/tegra_drm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
index 6e132a2..6698e81 100644
--- a/include/uapi/drm/tegra_drm.h
+++ b/include/uapi/drm/tegra_drm.h
@@ -17,6 +17,8 @@
 #ifndef _UAPI_TEGRA_DRM_H_
 #define _UAPI_TEGRA_DRM_H_
 
+#include <linux/types.h>
+
 struct drm_tegra_gem_create {
 	__u64 size;
 	__u32 flags;
-- 
1.8.1.4
