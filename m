From: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Subject: Re: [PATCH] drm: do not use device name as a format string
Date: Sat, 5 Dec 2015 10:45:50 +0100
Message-ID: <5662B24E.4090202@m4x.org>
References: <1447869498-13277-1-git-send-email-nicolas.iooss_linux@m4x.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447869498-13277-1-git-send-email-nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,
I sent the path below a few weeks ago and did not have any feedback.
Is there any issue in it that I need to fix before submitting it again?

Thanks,
Nicolas Iooss

On 11/18/2015 06:58 PM, Nicolas Iooss wrote:
> drm_dev_set_unique() formats its parameter using kvasprintf() but many
> of its callers directly pass dev_name(dev) as printf format string,
> without any format parameter.  This can cause some issues when the
> device name contains '%' characters.
> 
> To avoid any potential issue, always use "%s" when using
> drm_dev_set_unique() with dev_name().
> 
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c    | 2 +-
>  drivers/gpu/drm/tegra/drm.c                  | 2 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                | 2 +-
>  include/drm/drmP.h                           | 1 +
>  5 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index 244df0a440b7..0d720d3a7ee0 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -733,7 +733,7 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
>  	if (!ddev)
>  		return -ENOMEM;
>  
> -	ret = drm_dev_set_unique(ddev, dev_name(ddev->dev));
> +	ret = drm_dev_set_unique(ddev, "%s", dev_name(ddev->dev));
>  	if (ret)
>  		goto err_unref;
>  
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> index 1930234ba5f1..947d75f59881 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -363,7 +363,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>  	fsl_dev->np = dev->of_node;
>  	drm->dev_private = fsl_dev;
>  	dev_set_drvdata(dev, fsl_dev);
> -	drm_dev_set_unique(drm, dev_name(dev));
> +	drm_dev_set_unique(drm, "%s", dev_name(dev));
>  
>  	ret = drm_dev_register(drm, 0);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 159ef515cab1..b278f60f4376 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -991,7 +991,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
>  	if (!drm)
>  		return -ENOMEM;
>  
> -	drm_dev_set_unique(drm, dev_name(&dev->dev));
> +	drm_dev_set_unique(drm, "%s", dev_name(&dev->dev));
>  	dev_set_drvdata(&dev->dev, drm);
>  
>  	err = drm_dev_register(drm, 0);
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 6e730605edcc..c90a451aaa79 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -168,7 +168,7 @@ static int vc4_drm_bind(struct device *dev)
>  	vc4->dev = drm;
>  	drm->dev_private = vc4;
>  
> -	drm_dev_set_unique(drm, dev_name(dev));
> +	drm_dev_set_unique(drm, "%s", dev_name(dev));
>  
>  	drm_mode_config_init(drm);
>  	if (ret)
> diff --git a/include/drm/drmP.h b/include/drm/drmP.h
> index 0b921ae06cd8..995fb96cb740 100644
> --- a/include/drm/drmP.h
> +++ b/include/drm/drmP.h
> @@ -1049,6 +1049,7 @@ void drm_dev_ref(struct drm_device *dev);
>  void drm_dev_unref(struct drm_device *dev);
>  int drm_dev_register(struct drm_device *dev, unsigned long flags);
>  void drm_dev_unregister(struct drm_device *dev);
> +__printf(2, 3)
>  int drm_dev_set_unique(struct drm_device *dev, const char *fmt, ...);
>  
>  struct drm_minor *drm_minor_acquire(unsigned int minor_id);
> 
