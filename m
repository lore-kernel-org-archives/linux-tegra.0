From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Broken build due to 6aed8ec "drm: review locking for drm_fb_helper_restore_fbdev_mode"
Date: Tue, 19 Feb 2013 10:48:12 -0700
Message-ID: <5123BADC.2050807@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Sender: linux-next-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Mark Zhang <markz@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Daniel,

Commit 6aed8ec "drm: review locking for
drm_fb_helper_restore_fbdev_mode" (now in next-20130218 and later)
causes build failures for tegra_defconfig. The issue is this part of the
patch:

> diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
> index 3742bc9..1b6ba2d 100644
> --- a/drivers/gpu/drm/drm_fb_cma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_cma_helper.c
> @@ -389,8 +389,10 @@ EXPORT_SYMBOL_GPL(drm_fbdev_cma_fini);
>   */
>  void drm_fbdev_cma_restore_mode(struct drm_fbdev_cma *fbdev_cma)
>  {
> +       drm_modeset_lock_all(dev);
>         if (fbdev_cma)
>                 drm_fb_helper_restore_fbdev_mode(&fbdev_cma->fb_helper);
> +       drm_modeset_unlock_all(dev);
>  }
>  EXPORT_SYMBOL_GPL(drm_fbdev_cma_restore_mode);

There, there is no "dev" variable, so compile fails.

If I revert this one patch, the build succeeds, although I didn't check
whether DRM still works after that (e.g. due to any dependencies from
the rest of the series).
