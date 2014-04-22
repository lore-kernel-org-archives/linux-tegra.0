From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [RFC 4/5] drm: Introduce drm_set_unique()
Date: Tue, 22 Apr 2014 17:48:07 +0200
Message-ID: <20140422154807.GT10722@phenom.ffwll.local>
References: <1398179373-29966-1-git-send-email-thierry.reding@gmail.com>
 <1398179373-29966-5-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398179373-29966-5-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 22, 2014 at 05:09:32PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add a helper function that allows drivers to statically set the unique
> name of the device. This will allow platform and USB drivers to get rid
> of their DRM bus implementations and directly use drm_dev_alloc() and
> drm_dev_register().
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_ioctl.c | 37 +++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/drm_stub.c  |  1 +
>  include/drm/drmP.h          |  3 +++
>  3 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 2dd3a6d8382b..371db3bef60c 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -42,6 +42,20 @@
>  #include <asm/mtrr.h>
>  #endif
>  
> +int drm_set_unique(struct drm_device *dev, const char *fmt, ...)

Can you please add a bit of kerneldoc for this? drm_ioctl.c isn't yet
pulled into the drm reference docbook, but better to have it there
already. With that fixed this is

Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>

> +{
> +	va_list ap;
> +
> +	kfree(dev->unique);
> +
> +	va_start(ap, fmt);
> +	dev->unique = kvasprintf(GFP_KERNEL, fmt, ap);
> +	va_end(ap);
> +
> +	return dev->unique ? 0 : -ENOMEM;
> +}
> +EXPORT_SYMBOL(drm_set_unique);
> +
>  /**
>   * Get the bus id.
>   *
> @@ -131,13 +145,24 @@ static int drm_set_busid(struct drm_device *dev, struct drm_file *file_priv)
>  	if (master->unique != NULL)
>  		drm_unset_busid(dev, master);
>  
> -	ret = dev->driver->bus->set_busid(dev, master);
> -	if (ret)
> -		goto err;
> +	if (dev->driver->bus && dev->driver->bus->set_busid) {
> +		ret = dev->driver->bus->set_busid(dev, master);
> +		if (ret) {
> +			drm_unset_busid(dev, master);
> +			return ret;
> +		}
> +	} else {
> +		WARN(dev->unique == NULL,
> +		     "No drm_bus.set_busid() implementation provided by %ps. "
> +		     "Set the unique name explicitly using drm_set_unique().",
> +		     dev->driver);
> +
> +		master->unique = kstrdup(dev->unique, GFP_KERNEL);
> +		if (master->unique)
> +			master->unique_len = strlen(dev->unique);
> +	}
> +
>  	return 0;
> -err:
> -	drm_unset_busid(dev, master);
> -	return ret;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_stub.c b/drivers/gpu/drm/drm_stub.c
> index 3a8e832ad151..9465cf766fe7 100644
> --- a/drivers/gpu/drm/drm_stub.c
> +++ b/drivers/gpu/drm/drm_stub.c
> @@ -646,6 +646,7 @@ static void drm_dev_release(struct kref *ref)
>  	drm_minor_free(dev, DRM_MINOR_CONTROL);
>  
>  	mutex_destroy(&dev->master_mutex);
> +	kfree(dev->unique);
>  	kfree(dev);
>  }
>  
> diff --git a/include/drm/drmP.h b/include/drm/drmP.h
> index 8c80c1894b41..8fdefcdc4036 100644
> --- a/include/drm/drmP.h
> +++ b/include/drm/drmP.h
> @@ -1158,6 +1158,8 @@ struct drm_device {
>  	struct drm_vma_offset_manager *vma_offset_manager;
>  	/*@} */
>  	int switch_power_state;
> +
> +	char *unique;
>  };
>  
>  #define DRM_SWITCH_POWER_ON 0
> @@ -1238,6 +1240,7 @@ extern unsigned int drm_poll(struct file *filp, struct poll_table_struct *wait);
>  				/* Misc. IOCTL support (drm_ioctl.h) */
>  extern int drm_irq_by_busid(struct drm_device *dev, void *data,
>  			    struct drm_file *file_priv);
> +extern int drm_set_unique(struct drm_device *dev, const char *fmt, ...);
>  extern int drm_getunique(struct drm_device *dev, void *data,
>  			 struct drm_file *file_priv);
>  extern int drm_setunique(struct drm_device *dev, void *data,
> -- 
> 1.9.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
