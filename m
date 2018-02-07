From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] drm/tegra: fb: Implement ->fb_mmap() callback
Date: Wed,  7 Feb 2018 18:45:56 +0100
Message-ID: <20180207174556.25401-3-thierry.reding@gmail.com>
References: <20180207174556.25401-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180207174556.25401-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This fixes hangs with legacy applications that use the mmap() syscall on
the fbdev device to map framebuffer memory. The fbdev implementation for
mmap() creates a mapping that conflicts with DRM usage and causes a hang
when the memory is accessed through the mapping.

Reported-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/fb.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 001cb77e2f59..0786159edef3 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -224,12 +224,28 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 }
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
+static int tegra_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *helper = info->par;
+	struct tegra_bo *bo;
+	int err;
+
+	bo = tegra_fb_get_plane(helper->fb, 0);
+
+	err = drm_gem_mmap_obj(&bo->gem, bo->gem.size, vma);
+	if (err < 0)
+		return err;
+
+	return __tegra_gem_mmap(&bo->gem, vma);
+}
+
 static struct fb_ops tegra_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_fillrect = drm_fb_helper_sys_fillrect,
 	.fb_copyarea = drm_fb_helper_sys_copyarea,
 	.fb_imageblit = drm_fb_helper_sys_imageblit,
+	.fb_mmap = tegra_fb_mmap,
 };
 
 static int tegra_fbdev_probe(struct drm_fb_helper *helper,
-- 
2.15.1
