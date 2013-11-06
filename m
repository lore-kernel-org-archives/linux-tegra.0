From: Duan Jiong <duanj.fnst@cn.fujitsu.com>
Subject: [PATCH] drm/tegra: replace IS_ERR and PTR_ERR with PTR_ERR_OR_ZERO
Date: Wed, 6 Nov 2013 15:53:55 +0800
Message-ID: <1383724435-15380-1-git-send-email-duanj.fnst@cn.fujitsu.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kernel@pengutronix.de, linux@arm.linux.org.uk, a.zummo@towertech.it, airlied@linux.ie
Cc: linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Duan Jiong <duanj.fnst@cn.fujitsu.com>
List-Id: linux-tegra@vger.kernel.org

This patch fixes coccinelle error regarding usage of IS_ERR and
PTR_ERR instead of PTR_ERR_OR_ZERO.

Signed-off-by: Duan Jiong <duanj.fnst@cn.fujitsu.com>
---
 drivers/gpu/drm/tegra/gem.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 28a9cbc..ba6a7ac 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -199,10 +199,7 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
 
 	bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
 					 &args->handle);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(bo);
 }
 
 int tegra_bo_dumb_map_offset(struct drm_file *file, struct drm_device *drm,
-- 
1.8.3.1
