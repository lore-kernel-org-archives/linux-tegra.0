From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/4] gpu: host1x: add runtime pm support for gr2d
Date: Thu, 13 Jun 2013 09:14:58 -0600
Message-ID: <51B9E1F2.3090404@wwwdotorg.org>
References: <1371117218-2326-1-git-send-email-mkulkarni@nvidia.com> <1371117218-2326-3-git-send-email-mkulkarni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371117218-2326-3-git-send-email-mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/13/2013 03:53 AM, Mayuresh Kulkarni wrote:

Patch description?


> diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c

> +#ifdef CONFIG_PM_RUNTIME
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
> +#else
>  	err = clk_prepare_enable(gr2d->clk);
>  	if (err) {
>  		dev_err(dev, "cannot turn on clock\n");
>  		return err;
>  	}
> +#endif

The #else block here is a cut/paste of the body of
gr2d_runtime_resume(). It'd be better to call that function instead. The
following is what I ended up with in the Tegra ASoC driver in order to
support runtime PM on or off:

        pm_runtime_enable(&pdev->dev);
        if (!pm_runtime_enabled(&pdev->dev)) {
                ret = tegra20_i2s_runtime_resume(&pdev->dev);
                if (ret)
                        goto err_pm_disable;
        }

> @@ -328,10 +338,51 @@ static int __exit gr2d_remove(struct platform_device *pdev)
>  
>  	host1x_channel_free(gr2d->channel);
>  	clk_disable_unprepare(gr2d->clk);

Don't you need to remove that clk disable, or make it conditional upon
!PM_RUNTIME?

> +#ifdef CONFIG_PM_RUNTIME
> +	pm_runtime_disable(&pdev->dev);
> +#endif

Similarly, perhaps something like the following here:

        pm_runtime_disable(&pdev->dev);
        if (!pm_runtime_status_suspended(&pdev->dev))
                tegra20_i2s_runtime_suspend(&pdev->dev);

> @ -591,10 +592,18 @@ int host1x_job_submit(struct host1x_job *job)
>  {
>  	struct host1x *host = dev_get_drvdata(job->channel->dev->parent);
>  
> +#ifdef CONFIG_PM_RUNTIME
> +	pm_runtime_get_sync(job->channel->dev);
> +#endif
> +
>  	return host1x_hw_channel_submit(host, job);
>  }
>  
>  int host1x_job_complete(struct host1x_job *job)
>  {
> +#ifdef CONFIG_PM_RUNTIME
> +	return pm_runtime_put(job->channel->dev);
> +#else
>  	return 0;
> +#endif
>  }

I don't think you need any of those ifdefs; simply call the
pm_runtime_*() functions all the time, and they'll be successful no-ops
if !PM_RUNTIME.
