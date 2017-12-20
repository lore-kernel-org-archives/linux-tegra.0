From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 5/5] drm/tegra: Correct timeout in tegra_syncpt_wait
Date: Wed, 20 Dec 2017 18:46:14 +0300
Message-ID: <c7314f8a7085205695a69a7e248161d4dbe326c0.1513783739.git.digetx@gmail.com>
References: <cover.1513783738.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1513783738.git.digetx@gmail.com>
In-Reply-To: <cover.1513783738.git.digetx@gmail.com>
References: <cover.1513783738.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

host1x_syncpt_wait() takes timeout value in jiffies, but DRM passes it in
milliseconds.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bb98336fa8d7..57396388341b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -629,7 +629,8 @@ static int tegra_syncpt_wait(struct drm_device *drm, void *data,
 	if (!sp)
 		return -EINVAL;
 
-	return host1x_syncpt_wait(sp, args->thresh, args->timeout,
+	return host1x_syncpt_wait(sp, args->thresh,
+				  msecs_to_jiffies(args->timeout),
 				  &args->value);
 }
 
-- 
2.15.1
