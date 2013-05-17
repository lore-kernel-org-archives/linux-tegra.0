From: Arto Merilainen <amerilainen@nvidia.com>
Subject: [PATCH 6/6] drm/tegra: Fix syncpoint increment return code
Date: Fri, 17 May 2013 14:49:48 +0300
Message-ID: <1368791388-31441-7-git-send-email-amerilainen@nvidia.com>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@avionic-design.de, airlied@linux.ie, linux-tegra@vger.kernel.org
Cc: tbergstrom@nvidia.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add syncpoint increment to return a proper return code based on the
return value from host1x.

Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
---
 drivers/gpu/host1x/drm/drm.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.c
index 2b561c9..1dfd454 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -378,8 +378,7 @@ static int tegra_syncpt_incr(struct drm_device *drm, void *data,
 	if (!sp)
 		return -EINVAL;
 
-	host1x_syncpt_incr(sp);
-	return 0;
+	return host1x_syncpt_incr(sp);
 }
 
 static int tegra_syncpt_wait(struct drm_device *drm, void *data,
-- 
1.7.9.5
