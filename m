From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [patch] drm/tegra: small leak on error in tegra_fb_alloc()
Date: Sat, 9 Nov 2013 21:34:06 -0800 (PST)
Message-ID: <20131110053406.GB13643@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

If we don't have enough memory for ->planes then we leak "fb".

Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 490f771..1362d78 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -98,8 +98,10 @@ static struct tegra_fb *tegra_fb_alloc(struct drm_device *drm,
 		return ERR_PTR(-ENOMEM);
 
 	fb->planes = kzalloc(num_planes * sizeof(*planes), GFP_KERNEL);
-	if (!fb->planes)
-		return ERR_PTR(-ENOMEM);
+	if (!fb->planes) {
+		err = -ENOMEM;
+		goto free_fb;
+	}
 
 	fb->num_planes = num_planes;
 
@@ -112,12 +114,17 @@ static struct tegra_fb *tegra_fb_alloc(struct drm_device *drm,
 	if (err < 0) {
 		dev_err(drm->dev, "failed to initialize framebuffer: %d\n",
 			err);
-		kfree(fb->planes);
-		kfree(fb);
-		return ERR_PTR(err);
+		goto free_planes;
 	}
 
 	return fb;
+
+free_planes:
+	kfree(fb->planes);
+free_fb:
+	kfree(fb);
+
+	return ERR_PTR(err);
 }
 
 static struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
