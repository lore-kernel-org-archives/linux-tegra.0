From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] drm/tegra: Correct timeout in tegra_syncpt_wait
Date: Sun, 17 Dec 2017 20:25:42 +0300
Message-ID: <8a87083279bb793dd21a0c621bcd002a851495e5.1513530934.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

host1x_syncpt_wait() takes timeout value in jiffies, but DRM passes it in
milliseconds.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
