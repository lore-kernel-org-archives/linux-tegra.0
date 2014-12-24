From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH nouveau 06/11] platform: complete the power up/down
 sequence
Date: Wed, 24 Dec 2014 14:23:05 +0100
Message-ID: <1419427385.2179.13.camel@lynxeye.de>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
	 <1419331204-26679-7-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419331204-26679-7-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 23.12.2014, 18:39 +0800 schrieb Vince Hsu:
> This patch adds some missing pieces of the rail gaing/ungating sequence that
> can improve the stability in theory.
> 
> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drm/nouveau_platform.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  drm/nouveau_platform.h |  3 +++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drm/nouveau_platform.c b/drm/nouveau_platform.c
> index 68788b17a45c..527fe2358fc9 100644
> --- a/drm/nouveau_platform.c
> +++ b/drm/nouveau_platform.c
> @@ -25,9 +25,11 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/reset.h>
>  #include <linux/regulator/consumer.h>
>  #include <soc/tegra/fuse.h>
> +#include <soc/tegra/mc.h>
>  #include <soc/tegra/pmc.h>
>  
>  #include "nouveau_drm.h"
> @@ -61,6 +63,9 @@ static int nouveau_platform_power_up(struct nouveau_platform_gpu *gpu)
>  	reset_control_deassert(gpu->rst);
>  	udelay(10);
>  
> +	tegra_mc_flush(gpu->mc, gpu->swgroup, false);
> +	udelay(10);
> +
>  	return 0;
>  
>  err_clamp:
> @@ -77,6 +82,14 @@ static int nouveau_platform_power_down(struct nouveau_platform_gpu *gpu)
>  {
>  	int err;
>  
> +	tegra_mc_flush(gpu->mc, gpu->swgroup, true);
> +	udelay(10);
> +
> +	err = tegra_powergate_gpu_set_clamping(true);
> +	if (err)
> +		return err;
> +	udelay(10);
> +
>  	reset_control_assert(gpu->rst);
>  	udelay(10);
>  
> @@ -91,6 +104,31 @@ static int nouveau_platform_power_down(struct nouveau_platform_gpu *gpu)
>  	return 0;
>  }
>  
> +static int nouveau_platform_get_mc(struct device *dev,
> +		struct tegra_mc **mc, unsigned int *swgroup)

Uhm, no. If this is needed this has to be a Tegra MC function and not
burried into nouveau code. You are using knowledge about the internal
workings of the MC driver here.

Also this should probably only take the Dt node pointer as argument and
return a something like a tegra_mc_client struct that contains both the
MC device pointer and the swgroup so you can pass that to
tegra_mc_flush().

> +{
> +	struct of_phandle_args args;
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	ret = of_parse_phandle_with_fixed_args(dev->of_node, "mc",
> +				1, 0, &args);
> +	if (ret)
> +		return ret;
> +
> +	pdev = of_find_device_by_node(args.np);
> +	if (!pdev)
> +		return -EINVAL;

This is wrong, you need to handle -EPROBE_DEFER here.

> +
> +	*mc = platform_get_drvdata(pdev);
> +	if (!*mc)
> +		return -EINVAL;
> +
> +	*swgroup = args.args[0];
> +
> +	return 0;
> +}
> +
>  static int nouveau_platform_probe(struct platform_device *pdev)
>  {
>  	struct nouveau_platform_gpu *gpu;
> @@ -118,6 +156,10 @@ static int nouveau_platform_probe(struct platform_device *pdev)
>  	if (IS_ERR(gpu->clk_pwr))
>  		return PTR_ERR(gpu->clk_pwr);
>  
> +	err = nouveau_platform_get_mc(&pdev->dev, &gpu->mc, &gpu->swgroup);
> +	if (err)
> +		return err;
> +
>  	err = nouveau_platform_power_up(gpu);
>  	if (err)
>  		return err;
> diff --git a/drm/nouveau_platform.h b/drm/nouveau_platform.h
> index 58c28b5653d5..969dbddd786d 100644
> --- a/drm/nouveau_platform.h
> +++ b/drm/nouveau_platform.h
> @@ -35,6 +35,9 @@ struct nouveau_platform_gpu {
>  	struct clk *clk_pwr;
>  
>  	struct regulator *vdd;
> +
> +	struct tegra_mc *mc;
> +	unsigned int swgroup;
>  };
>  
>  struct nouveau_platform_device {
